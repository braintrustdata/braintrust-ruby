# typed: strong

module Braintrust
  module Models
    class ChatCompletionContentPartText < Braintrust::BaseModel
      sig { returns(Braintrust::Models::ChatCompletionContentPartText::Type::OrSymbol) }
      def type
      end

      sig do
        params(_: Braintrust::Models::ChatCompletionContentPartText::Type::OrSymbol)
          .returns(Braintrust::Models::ChatCompletionContentPartText::Type::OrSymbol)
      end
      def type=(_)
      end

      sig { returns(T.nilable(String)) }
      def text
      end

      sig { params(_: String).returns(String) }
      def text=(_)
      end

      sig do
        params(type: Braintrust::Models::ChatCompletionContentPartText::Type::OrSymbol, text: String)
          .returns(T.attached_class)
      end
      def self.new(type:, text: nil)
      end

      sig { override.returns({type: Braintrust::Models::ChatCompletionContentPartText::Type::OrSymbol, text: String}) }
      def to_hash
      end

      module Type
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ChatCompletionContentPartText::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, Braintrust::Models::ChatCompletionContentPartText::Type::TaggedSymbol) }

        TEXT = T.let(:text, Braintrust::Models::ChatCompletionContentPartText::Type::OrSymbol)
      end
    end
  end
end
