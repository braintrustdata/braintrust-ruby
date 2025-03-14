# frozen_string_literal: true

module Braintrust
  module Models
    class SpanAttributes < Braintrust::BaseModel
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

      # @!parse
      #   # Human-identifying attributes of the span, such as name, type, etc.
      #   #
      #   # @param name [String, nil]
      #   # @param type [Symbol, Braintrust::Models::SpanType, nil]
      #   #
      #   def initialize(name: nil, type: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
