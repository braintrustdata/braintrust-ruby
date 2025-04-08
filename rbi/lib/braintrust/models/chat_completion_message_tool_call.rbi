# typed: strong

module Braintrust
  module Models
    class ChatCompletionMessageToolCall < Braintrust::Internal::Type::BaseModel
      sig { returns(String) }
      attr_accessor :id

      sig { returns(Braintrust::Models::ChatCompletionMessageToolCall::Function) }
      attr_reader :function

      sig do
        params(
          function: T.any(Braintrust::Models::ChatCompletionMessageToolCall::Function, Braintrust::Internal::AnyHash)
        )
          .void
      end
      attr_writer :function

      sig { returns(Braintrust::Models::ChatCompletionMessageToolCall::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          function: T.any(Braintrust::Models::ChatCompletionMessageToolCall::Function, Braintrust::Internal::AnyHash),
          type: Braintrust::Models::ChatCompletionMessageToolCall::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(id:, function:, type:); end

      sig do
        override
          .returns(
            {
              id: String,
              function: Braintrust::Models::ChatCompletionMessageToolCall::Function,
              type: Braintrust::Models::ChatCompletionMessageToolCall::Type::OrSymbol
            }
          )
      end
      def to_hash; end

      class Function < Braintrust::Internal::Type::BaseModel
        sig { returns(String) }
        attr_accessor :arguments

        sig { returns(String) }
        attr_accessor :name

        sig { params(arguments: String, name: String).returns(T.attached_class) }
        def self.new(arguments:, name:); end

        sig { override.returns({arguments: String, name: String}) }
        def to_hash; end
      end

      module Type
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ChatCompletionMessageToolCall::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Braintrust::Models::ChatCompletionMessageToolCall::Type::TaggedSymbol) }

        FUNCTION = T.let(:function, Braintrust::Models::ChatCompletionMessageToolCall::Type::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::ChatCompletionMessageToolCall::Type::TaggedSymbol]) }
        def self.values; end
      end
    end
  end
end
