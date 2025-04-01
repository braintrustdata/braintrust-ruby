# frozen_string_literal: true

module Braintrust
  # @example
  #   if list_objects.has_next?
  #     list_objects = list_objects.next_page
  #   end
  #
  # @example
  #   list_objects.auto_paging_each do |project|
  #     puts(project)
  #   end
  #
  # @example
  #   projects =
  #     list_objects
  #     .to_enum
  #     .lazy
  #     .select { _1.object_id.even? }
  #     .map(&:itself)
  #     .take(2)
  #     .to_a
  #
  #   projects => Array
  class ListObjects
    include Braintrust::Type::BasePage

    # @return [Array<Object>, nil]
    attr_accessor :objects

    # @api private
    #
    # @param client [Braintrust::Transport::BaseClient]
    # @param req [Hash{Symbol=>Object}]
    # @param headers [Hash{String=>String}, Net::HTTPHeader]
    # @param page_data [Hash{Symbol=>Object}]
    def initialize(client:, req:, headers:, page_data:)
      super
      model = req.fetch(:model)

      case page_data
      in {objects: Array | nil => objects}
        @objects = objects&.map { Braintrust::Type::Converter.coerce(model, _1) }
      else
      end
    end

    # @return [Boolean]
    def next_page?
      !objects.to_a.empty?
    end

    # @raise [Braintrust::HTTP::Error]
    # @return [Braintrust::ListObjects]
    def next_page
      unless next_page?
        message = "No more pages available. Please check #next_page? before calling ##{__method__}"
        raise RuntimeError.new(message)
      end

      req = Braintrust::Util.deep_merge(@req, {query: {starting_after: objects&.last&.id}})
      @client.request(req)
    end

    # @param blk [Proc]
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
    def inspect
      "#<#{self.class}:0x#{object_id.to_s(16)} objects=#{objects.inspect}>"
    end
  end
end
