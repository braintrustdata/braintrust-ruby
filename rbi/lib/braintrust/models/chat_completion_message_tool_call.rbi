# typed: strong

module Braintrust
  module Models
    class ChatCompletionMessageToolCall < Braintrust::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig { returns(Braintrust::Models::ChatCompletionMessageToolCall::Function) }
      def function
      end

      sig do
        params(_: T.any(Braintrust::Models::ChatCompletionMessageToolCall::Function, Braintrust::Util::AnyHash))
          .returns(T.any(Braintrust::Models::ChatCompletionMessageToolCall::Function, Braintrust::Util::AnyHash))
      end
      def function=(_)
      end

      sig { returns(Braintrust::Models::ChatCompletionMessageToolCall::Type::OrSymbol) }
      def type
      end

      sig do
        params(_: Braintrust::Models::ChatCompletionMessageToolCall::Type::OrSymbol)
          .returns(Braintrust::Models::ChatCompletionMessageToolCall::Type::OrSymbol)
      end
      def type=(_)
      end

      sig do
        params(
          id: String,
          function: Braintrust::Models::ChatCompletionMessageToolCall::Function,
          type: Braintrust::Models::ChatCompletionMessageToolCall::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(id:, function:, type:)
      end

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
      def to_hash
      end

      class Function < Braintrust::BaseModel
        sig { returns(String) }
        def arguments
        end

        sig { params(_: String).returns(String) }
        def arguments=(_)
        end

        sig { returns(String) }
        def name
        end

        sig { params(_: String).returns(String) }
        def name=(_)
        end

        sig { params(arguments: String, name: String).returns(T.attached_class) }
        def self.new(arguments:, name:)
        end

        sig { override.returns({arguments: String, name: String}) }
        def to_hash
        end
      end

      module Type
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ChatCompletionMessageToolCall::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, Braintrust::Models::ChatCompletionMessageToolCall::Type::TaggedSymbol) }

        FUNCTION = T.let(:function, Braintrust::Models::ChatCompletionMessageToolCall::Type::OrSymbol)
      end
    end
  end
end
