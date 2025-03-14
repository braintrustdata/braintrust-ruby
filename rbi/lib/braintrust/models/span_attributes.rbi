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
    end
  end
end
