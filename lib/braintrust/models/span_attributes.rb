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
      optional :type, enum: -> { Braintrust::SpanType }, nil?: true

      # @!method initialize(name: nil, type: nil)
      #   Human-identifying attributes of the span, such as name, type, etc.
      #
      #   @param name [String, nil] Name of the span, for display purposes only
      #
      #   @param type [Symbol, Braintrust::Models::SpanType, nil] Type of the span, for display purposes only
    end
  end
end
