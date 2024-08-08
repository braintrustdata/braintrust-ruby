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
      raise NotImplementedError
    end

    # @return [ListObjects]
    def next_page
      raise NotImplementedError
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
  end
end
