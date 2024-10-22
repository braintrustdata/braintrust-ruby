# frozen_string_literal: true

module Braintrust
  class ListObjects
    # @return [Array]
    attr_accessor :objects

    # @!visibility private
    attr_accessor :client, :req, :opts

    # @!visibility private
    def initialize(model, raw_data, _response, client, req, opts)
      self.objects = (raw_data[:objects] || []).map { |e| model.convert(e) }
      self.client = client
      self.req = req
      self.opts = opts
    end

    # @return [Boolean]
    def next_page?
      !objects.empty?
    end

    # @return [Braintrust::ListObjects]
    def next_page
      if !next_page?
        raise "No more pages available; please check #next_page? before calling #next_page"
      end
      client.request(Util.deep_merge(req, {query: {starting_after: objects.last.id}}), opts)
    end

    # @return [nil]
    def auto_paging_each(&blk)
      if !blk
        raise "A block must be given to #auto_paging_each"
      end
      page = self
      loop do
        page.objects.each { |e| blk.call(e) }
        break if !page.next_page?
        page = page.next_page
      end
    end

    # @return String
    def inspect
      "#<#{selfl.class}:0x#{object_id.to_s(16)} objects=#{objects.inspect}>"
    end
  end
end
