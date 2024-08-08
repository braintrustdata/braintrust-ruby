# frozen_string_literal: true

module Braintrust
  # @!visibility private
  class PooledNetRequester
    def initialize
      @mutex = Mutex.new
      @pools = {}
    end

    def get_pool(req)
      hostname = req[:host]
      scheme = req[:scheme]
      port =
        req[:port] ||
        case scheme.to_sym
        when :https
          Net::HTTP.https_default_port
        else
          Net::HTTP.http_default_port
        end
      @mutex.synchronize do
        @pools[hostname] ||= ConnectionPool.new do
          conn = Net::HTTP.new(hostname, port)
          conn.use_ssl = scheme.to_sym == :https
          conn.start
          conn
        end
        @pools[hostname]
      end
    end

    def execute(req)
      get_pool(req).with do |conn|
        # Net can't understand posting to a URI representing only path + query,
        # so we concatenate
        query_string = ("?#{URI.encode_www_form(req[:query])}" if req[:query])
        uri_string = (req[:path] || "/") + (query_string || "")
        case req[:method]
        when :get
          conn.get(uri_string, req[:headers])
        when :patch
          conn.patch(uri_string, req[:body], req[:headers])
        when :put
          conn.put(uri_string, req[:body], req[:headers])
        when :post
          conn.post(uri_string, req[:body], req[:headers])
          # TODO: more verbs
        when :delete
          # `Net::HTTP`'s "convenience method" for delete doesn't accept a body
          request = Net::HTTP::Delete.new(uri_string)
          request.body = req[:body] if req[:body]
          if req[:headers]
            req[:headers].each { |k, v| request[k] = v }
          end

          conn.request(request)
        else
          raise NotImplementedError.new, req[:method]
        end
      end
    end
  end
end
