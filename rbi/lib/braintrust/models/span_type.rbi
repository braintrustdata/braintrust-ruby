# typed: strong

module Braintrust
  module Models
    # Type of the span, for display purposes only
    class SpanType < Braintrust::Enum
      abstract!

      LLM = T.let(:llm, T.nilable(Symbol))
      SCORE = T.let(:score, T.nilable(Symbol))
      FUNCTION = T.let(:function, T.nilable(Symbol))
      EVAL = T.let(:eval, T.nilable(Symbol))
      TASK = T.let(:task, T.nilable(Symbol))
      TOOL = T.let(:tool, T.nilable(Symbol))

      class << self
        sig { override.returns(T::Array[Symbol]) }
        def values
        end
      end
    end
  end
end
