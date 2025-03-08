# typed: strong

module Braintrust
  module Models
    class SpanAttributes < Braintrust::BaseModel
      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def type=(_)
      end

      sig { params(name: T.nilable(String), type: T.nilable(Symbol)).returns(T.attached_class) }
      def self.new(name: nil, type: nil)
      end

      sig { override.returns({name: T.nilable(String), type: T.nilable(Symbol)}) }
      def to_hash
      end

      class Type < Braintrust::Enum
        abstract!

        LLM = T.let(:llm, T.nilable(Symbol))
        SCORE = T.let(:score, T.nilable(Symbol))
        FUNCTION = T.let(:function, T.nilable(Symbol))
        EVAL = T.let(:eval, T.nilable(Symbol))
        TASK = T.let(:task, T.nilable(Symbol))
        TOOL = T.let(:tool, T.nilable(Symbol))

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end
    end
  end
end
