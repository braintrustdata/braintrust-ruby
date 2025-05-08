# typed: strong

module Braintrust
  module Models
    class ChatCompletionContentPartText < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      sig { returns(Braintrust::ChatCompletionContentPartText::Type::OrSymbol) }
      attr_accessor :type

      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

      sig do
        params(
          type: Braintrust::ChatCompletionContentPartText::Type::OrSymbol,
          text: String
        ).returns(T.attached_class)
      end
      def self.new(type:, text: nil)
      end

      sig do
        override.returns(
          {
            type: Braintrust::ChatCompletionContentPartText::Type::OrSymbol,
            text: String
          }
        )
      end
      def to_hash
      end

      module Type
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Braintrust::ChatCompletionContentPartText::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT =
          T.let(
            :text,
            Braintrust::ChatCompletionContentPartText::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Braintrust::ChatCompletionContentPartText::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
