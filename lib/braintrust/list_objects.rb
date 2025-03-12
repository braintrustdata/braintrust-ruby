# frozen_string_literal: true

module Braintrust
  # @example
  # ```ruby
  # if list_objects.has_next?
  #   page = list_objects.next_page
  # end
  # ```
  #
  # @example
  # ```ruby
  # list_objects.auto_paging_each do |item|
  # #   item ...
  # end
  # ```
  #
  # @example
  # ```ruby
  # items = list_objects.to_enum.take(2)
  #
  # items => Array
  # ```
  class ListObjects
    include Braintrust::BasePage

    # @return [Array<Object>]
    attr_accessor :objects

    # rubocop:disable Lint/UnusedMethodArgument
    # @private
    #
    # @param client [Braintrust::BaseClient]
    # @param req [Hash{Symbol=>Object}]
    # @param headers [Hash{String=>String}, Net::HTTPHeader]
    # @param page_data [Hash{Symbol=>Object}]
    #
    def initialize(client:, req:, headers:, page_data:)
      @client = client
      @req = req
      model = req.fetch(:model)

      case page_data
      in {objects: Array | nil => objects}
        @objects = objects&.map { model.coerce(_1) }
      else
      end
    end
    # rubocop:enable Lint/UnusedMethodArgument

    # @return [Boolean]
    #
    def next_page?
      !objects.to_a.empty?
    end

    # @raise [Braintrust::HTTP::Error]
    # @return [Braintrust::ListObjects]
    #
    def next_page
      unless next_page?
        raise RuntimeError.new("No more pages available. Please check #next_page? before calling ##{__method__}")
      end

      req = Braintrust::Util.deep_merge(@req, {query: {starting_after: objects&.last&.id}})
      @client.request(req)
    end

    # @param blk [Proc]
    #
    def auto_paging_each(&blk)
      unless block_given?
        raise ArgumentError.new("A block must be given to ##{__method__}")
      end
      page = self
      loop do
        page.objects&.each { blk.call(_1) }
        break unless page.next_page?
        page = page.next_page
      end
    end

    # @return [String]
    #
    def inspect
      "#<#{self.class}:0x#{object_id.to_s(16)} objects=#{objects.inspect}>"
    end
  end
end
