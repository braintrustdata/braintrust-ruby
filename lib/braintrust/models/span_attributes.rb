# frozen_string_literal: true

module Braintrust
  module Models
    class SpanAttributes < Braintrust::BaseModel
      # @!attribute [rw] name
      #   Name of the span, for display purposes only
      #   @return [String]
      optional :name, String

      # @!attribute [rw] type
      #   Type of the span, for display purposes only
      #   @return [Symbol, Braintrust::Models::SpanAttributes::Type]
      optional :type, enum: -> { Braintrust::Models::SpanAttributes::Type }

      # Type of the span, for display purposes only
      class Type < Braintrust::Enum
        LLM = :llm
        SCORE = :score
        FUNCTION = :function
        EVAL = :eval
        TASK = :task
        TOOL = :tool
      end

      # @!parse
      #   # Create a new instance of SpanAttributes from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String, nil] :name Name of the span, for display purposes only
      #   #   @option data [String, nil] :type Type of the span, for display purposes only
      #   def initialize(data = {}) = super
    end
  end
end
