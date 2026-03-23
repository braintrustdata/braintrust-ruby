# frozen_string_literal: true

module Braintrust
  module Models
    # Type of the span, for display purposes only
    module SpanType
      extend Braintrust::Internal::Type::Enum

      LLM = :llm
      SCORE = :score
      FUNCTION = :function
      EVAL = :eval
      TASK = :task
      TOOL = :tool

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
