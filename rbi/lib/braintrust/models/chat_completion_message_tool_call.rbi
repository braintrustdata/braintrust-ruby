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
        params(_: Braintrust::Models::ChatCompletionMessageToolCall::Function)
          .returns(Braintrust::Models::ChatCompletionMessageToolCall::Function)
      end
      def function=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig do
        params(id: String, function: Braintrust::Models::ChatCompletionMessageToolCall::Function, type: Symbol)
          .returns(T.attached_class)
      end
      def self.new(id:, function:, type:)
      end

      sig do
        override
          .returns({id: String, function: Braintrust::Models::ChatCompletionMessageToolCall::Function, type: Symbol})
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

      class Type < Braintrust::Enum
        abstract!

        FUNCTION = :function

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end
    end
  end
end
