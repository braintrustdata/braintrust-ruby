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
      #   @return [Symbol, Braintrust::Models::SpanAttributes::Type, nil]
      optional :type, enum: -> { Braintrust::Models::SpanAttributes::Type }, nil?: true

      # @!parse
      #   # Human-identifying attributes of the span, such as name, type, etc.
      #   #
      #   # @param name [String, nil]
      #   # @param type [Symbol, Braintrust::Models::SpanAttributes::Type, nil]
      #   #
      #   def initialize(name: nil, type: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # Type of the span, for display purposes only
      class Type < Braintrust::Enum
        LLM = :llm
        SCORE = :score
        FUNCTION = :function
        EVAL = :eval
        TASK = :task
        TOOL = :tool

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end
    end
  end
end
