# frozen_string_literal: true

module Braintrust
  module Models
    class ViewOptions < Braintrust::BaseModel
      # @!attribute column_order
      #
      #   @return [Array<String>, nil]
      optional :column_order, Braintrust::ArrayOf[String], api_name: :columnOrder, nil?: true

      # @!attribute column_sizing
      #
      #   @return [Hash{Symbol=>Float}, nil]
      optional :column_sizing, Braintrust::HashOf[Float], api_name: :columnSizing, nil?: true

      # @!attribute column_visibility
      #
      #   @return [Hash{Symbol=>Boolean}, nil]
      optional :column_visibility,
               Braintrust::HashOf[Braintrust::BooleanModel],
               api_name: :columnVisibility,
               nil?: true

      # @!parse
      #   # Options for the view in the app
      #   #
      #   # @param column_order [Array<String>, nil]
      #   # @param column_sizing [Hash{Symbol=>Float}, nil]
      #   # @param column_visibility [Hash{Symbol=>Boolean}, nil]
      #   #
      #   def initialize(column_order: nil, column_sizing: nil, column_visibility: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
