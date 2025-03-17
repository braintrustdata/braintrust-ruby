# typed: strong

module Braintrust
  module Models
    # Type of the span, for display purposes only
    class SpanType < Braintrust::Enum
      abstract!

      Value = type_template(:out) { {fixed: Symbol} }

      LLM = :llm
      SCORE = :score
      FUNCTION = :function
      EVAL = :eval
      TASK = :task
      TOOL = :tool
    end
  end
end
