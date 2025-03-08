# typed: strong

module Braintrust
  module Models
    class ChatCompletionContentPartText < Braintrust::BaseModel
      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { returns(T.nilable(String)) }
      def text
      end

      sig { params(_: String).returns(String) }
      def text=(_)
      end

      sig { params(type: Symbol, text: String).returns(T.attached_class) }
      def self.new(type:, text: nil)
      end

      sig { override.returns({type: Symbol, text: String}) }
      def to_hash
      end

      class Type < Braintrust::Enum
        abstract!

        TEXT = :text

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end
    end
  end
end
