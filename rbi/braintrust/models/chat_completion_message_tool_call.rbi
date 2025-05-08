# typed: strong

module Braintrust
  module Models
    class ChatCompletionMessageToolCall < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Braintrust::ChatCompletionMessageToolCall::Function) }
      attr_reader :function

      sig do
        params(
          function: Braintrust::ChatCompletionMessageToolCall::Function::OrHash
        ).void
      end
      attr_writer :function

      sig { returns(Braintrust::ChatCompletionMessageToolCall::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          id: String,
          function: Braintrust::ChatCompletionMessageToolCall::Function::OrHash,
          type: Braintrust::ChatCompletionMessageToolCall::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(id:, function:, type:)
      end

      sig do
        override.returns(
          {
            id: String,
            function: Braintrust::ChatCompletionMessageToolCall::Function,
            type: Braintrust::ChatCompletionMessageToolCall::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      class Function < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

        sig { returns(String) }
        attr_accessor :arguments

        sig { returns(String) }
        attr_accessor :name

        sig do
          params(arguments: String, name: String).returns(T.attached_class)
        end
        def self.new(arguments:, name:)
        end

        sig { override.returns({ arguments: String, name: String }) }
        def to_hash
        end
      end

      module Type
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Braintrust::ChatCompletionMessageToolCall::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FUNCTION =
          T.let(
            :function,
            Braintrust::ChatCompletionMessageToolCall::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Braintrust::ChatCompletionMessageToolCall::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
