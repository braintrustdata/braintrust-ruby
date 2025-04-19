# frozen_string_literal: true

module Braintrust
  module Models
    class SpanAttributes < Braintrust::Internal::Type::BaseModel
      # @!attribute name
      #   Name of the span, for display purposes only
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute type
      #   Type of the span, for display purposes only
      #
      #   @return [Symbol, Braintrust::Models::SpanType, nil]
      optional :type, enum: -> { Braintrust::Models::SpanType }, nil?: true

      # @!method initialize(name: nil, type: nil)
      #   Human-identifying attributes of the span, such as name, type, etc.
      #
      #   @param name [String, nil]
      #   @param type [Symbol, Braintrust::Models::SpanType, nil]
    end
  end
end
