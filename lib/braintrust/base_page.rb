# frozen_string_literal: true

module Braintrust
  # @example
  # ```ruby
  # if page.has_next?
  #   page = page.next_page
  # end
  # ```
  #
  # @example
  # ```ruby
  # page.auto_paging_each do |top_level|
  #   puts(top_level)
  # end
  # ```
  #
  # @example
  # ```ruby
  # top_levels = page
  #   .to_enum
  #   .lazy
  #   .select { _1.object_id.even? }
  #   .map(&:itself)
  #   .take(2)
  #   .to_a
  #
  # top_levels => Array
  # ```
  module BasePage
    # rubocop:disable Lint/UnusedMethodArgument

    # @return [Boolean]
    def next_page? = (raise NotImplementedError)

    # @raise [Braintrust::APIError]
    # @return [Braintrust::BasePage]
    def next_page = (raise NotImplementedError)

    # @param blk [Proc]
    #
    # @return [void]
    def auto_paging_each(&) = (raise NotImplementedError)

    # @return [Enumerable]
    def to_enum = super(:auto_paging_each)

    alias_method :enum_for, :to_enum

    # @api private
    #
    # @param client [Braintrust::BaseClient]
    # @param req [Hash{Symbol=>Object}]
    # @param headers [Hash{String=>String}, Net::HTTPHeader]
    # @param page_data [Object]
    def initialize(client:, req:, headers:, page_data:)
      @client = client
      @req = req
      super()
    end

    # rubocop:enable Lint/UnusedMethodArgument
  end
end
