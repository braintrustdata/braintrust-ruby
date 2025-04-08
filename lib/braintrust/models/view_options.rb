# frozen_string_literal: true

module Braintrust
  module Models
    class ViewOptions < Braintrust::Internal::Type::BaseModel
      # @!attribute column_order
      #
      #   @return [Array<String>, nil]
      optional :column_order, Braintrust::Internal::Type::ArrayOf[String], api_name: :columnOrder, nil?: true

      # @!attribute column_sizing
      #
      #   @return [Hash{Symbol=>Float}, nil]
      optional :column_sizing, Braintrust::Internal::Type::HashOf[Float], api_name: :columnSizing, nil?: true

      # @!attribute column_visibility
      #
      #   @return [Hash{Symbol=>Boolean}, nil]
      optional :column_visibility,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Boolean],
               api_name: :columnVisibility,
               nil?: true

      # @!attribute grouping
      #
      #   @return [String, nil]
      optional :grouping, String, nil?: true

      # @!attribute layout
      #
      #   @return [String, nil]
      optional :layout, String, nil?: true

      # @!attribute row_height
      #
      #   @return [String, nil]
      optional :row_height, String, api_name: :rowHeight, nil?: true

      # @!parse
      #   # Options for the view in the app
      #   #
      #   # @param column_order [Array<String>, nil]
      #   # @param column_sizing [Hash{Symbol=>Float}, nil]
      #   # @param column_visibility [Hash{Symbol=>Boolean}, nil]
      #   # @param grouping [String, nil]
      #   # @param layout [String, nil]
      #   # @param row_height [String, nil]
      #   #
      #   def initialize(
      #     column_order: nil,
      #     column_sizing: nil,
      #     column_visibility: nil,
      #     grouping: nil,
      #     layout: nil,
      #     row_height: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
