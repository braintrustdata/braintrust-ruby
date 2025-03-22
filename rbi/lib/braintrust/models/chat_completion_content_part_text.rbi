# typed: strong

module Braintrust
  module Models
    class ChatCompletionContentPartText < Braintrust::BaseModel
      sig { returns(Braintrust::Models::ChatCompletionContentPartText::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

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

        TEXT = T.let(:text, Braintrust::Models::ChatCompletionContentPartText::Type::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::ChatCompletionContentPartText::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
