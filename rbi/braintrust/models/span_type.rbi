# typed: strong

module Braintrust
  module Models
    # Type of the span, for display purposes only
    module SpanType
      extend Braintrust::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::SpanType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      LLM = T.let(:llm, Braintrust::SpanType::TaggedSymbol)
      SCORE = T.let(:score, Braintrust::SpanType::TaggedSymbol)
      FUNCTION = T.let(:function, Braintrust::SpanType::TaggedSymbol)
      EVAL = T.let(:eval, Braintrust::SpanType::TaggedSymbol)
      TASK = T.let(:task, Braintrust::SpanType::TaggedSymbol)
      TOOL = T.let(:tool, Braintrust::SpanType::TaggedSymbol)

      sig { override.returns(T::Array[Braintrust::SpanType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
