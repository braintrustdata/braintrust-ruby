# typed: strong

module Braintrust
  module Models
    # Type of the span, for display purposes only
    module SpanType
      extend Braintrust::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::SpanType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      LLM = T.let(:llm, Braintrust::Models::SpanType::TaggedSymbol)
      SCORE = T.let(:score, Braintrust::Models::SpanType::TaggedSymbol)
      FUNCTION = T.let(:function, Braintrust::Models::SpanType::TaggedSymbol)
      EVAL = T.let(:eval, Braintrust::Models::SpanType::TaggedSymbol)
      TASK = T.let(:task, Braintrust::Models::SpanType::TaggedSymbol)
      TOOL = T.let(:tool, Braintrust::Models::SpanType::TaggedSymbol)

      sig { override.returns(T::Array[Braintrust::Models::SpanType::TaggedSymbol]) }
      def self.values; end
    end
  end
end
