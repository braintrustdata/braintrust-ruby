# frozen_string_literal: true

module Braintrust
  module Internal
    # @generic Elem
    #
    # @example
    #   if list_objects.has_next?
    #     list_objects = list_objects.next_page
    #   end
    #
    # @example
    #   list_objects.auto_paging_each do |project|
    #     puts(project)
    #   end
    class ListObjects
      include Braintrust::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :objects

      # @api private
      #
      # @param client [Braintrust::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}, Net::HTTPHeader]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {objects: Array | nil => objects}
          @objects = objects&.map { Braintrust::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
      end

      # @return [Boolean]
      def next_page?
        !objects.to_a.empty?
      end

      # @raise [Braintrust::HTTP::Error]
      # @return [Braintrust::Internal::ListObjects]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = Braintrust::Internal::Util.deep_merge(@req, {query: {starting_after: objects&.last&.id}})
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.objects&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @return [String]
      def inspect
        model = Braintrust::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} >"
      end
    end
  end
end
