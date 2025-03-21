# typed: strong

module Braintrust
  module Models
    # Type of the span, for display purposes only
    module SpanType
      extend Braintrust::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::SpanType) }
      OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::SpanType::TaggedSymbol) }

      LLM = T.let(:llm, Braintrust::Models::SpanType::OrSymbol)
      SCORE = T.let(:score, Braintrust::Models::SpanType::OrSymbol)
      FUNCTION = T.let(:function, Braintrust::Models::SpanType::OrSymbol)
      EVAL = T.let(:eval, Braintrust::Models::SpanType::OrSymbol)
      TASK = T.let(:task, Braintrust::Models::SpanType::OrSymbol)
      TOOL = T.let(:tool, Braintrust::Models::SpanType::OrSymbol)
    end
  end
end
