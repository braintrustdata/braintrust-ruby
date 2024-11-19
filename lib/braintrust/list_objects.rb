# frozen_string_literal: true

module Braintrust
  class ListObjects
    # @return [Array<Object>]
    attr_accessor :objects

    # @!visibility private
    #
    # @param model [Object]
    # @param raw_data [Hash{Symbol => Object}]
    # @param response [Net::HTTPResponse]
    # @param client [Braintrust::Client]
    # @param req [Hash{Symbol => Object}]
    # @param opts [Hash{Symbol => Object}]
    def initialize(client:, model:, req:, opts:, response:, raw_data:)
      @objects = (raw_data[:objects] || []).map { |e| model.convert(e) }
      @client = client
      @req = req
      @opts = opts
    end

    # @return [Boolean]
    def next_page?
      !objects.empty?
    end

    # @raise [Braintrust::HTTP::Error]
    # @return [Braintrust::ListObjects]
    def next_page
      unless next_page?
        raise "No more pages available; please check #next_page? before calling #next_page"
      end

      req = Braintrust::Util.deep_merge(@req, {query: {starting_after: objects.last.id}})
      @client.request(req, @opts)
    end

    # @param blk [Proc]
    #
    # @return [nil]
    def auto_paging_each(&blk)
      unless block_given?
        raise "A block must be given to #auto_paging_each"
      end
      page = self
      loop do
        page.objects.each { |e| blk.call(e) }
        break unless page.next_page?
        page = page.next_page
      end
    end

    # @return [String]
    def inspect
      "#<#{self.class}:0x#{object_id.to_s(16)} objects=#{objects.inspect}>"
    end
  end
end
