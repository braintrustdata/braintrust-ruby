# frozen_string_literal: true

module Braintrust
  module Models
    class ViewOptions < BaseModel
      # @!attribute [rw] column_order
      #   @return [Array<String>]
      optional :column_order, Braintrust::ArrayOf.new(String)

      # @!attribute [rw] column_sizing
      #   @return [Hash]
      optional :column_sizing, Hash

      # @!attribute [rw] column_visibility
      #   @return [Hash]
      optional :column_visibility, Hash
    end
  end
end
