# frozen_string_literal: true

module Braintrust
  module Models
    class ViewOptions < BaseModel
      # @!attribute [rw] column_order
      #   @return [Array<String>]
      optional :column_order, Braintrust::ArrayOf.new(String), api_name: :columnOrder

      # @!attribute [rw] column_sizing
      #   @return [Hash]
      optional :column_sizing, Hash, api_name: :columnSizing

      # @!attribute [rw] column_visibility
      #   @return [Hash]
      optional :column_visibility, Hash, api_name: :columnVisibility

      # @!parse
      #   # Create a new instance of ViewOptions from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Array<String>, nil] :columnOrder
      #   #   @option data [Hash, nil] :columnSizing
      #   #   @option data [Hash, nil] :columnVisibility
      #   def initialize(data = {}) = super
    end
  end
end
