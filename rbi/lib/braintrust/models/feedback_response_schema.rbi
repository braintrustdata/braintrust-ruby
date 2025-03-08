# typed: strong

module Braintrust
  module Models
    class FeedbackResponseSchema < Braintrust::BaseModel
      sig { returns(Symbol) }
      def status
      end

      sig { params(_: Symbol).returns(Symbol) }
      def status=(_)
      end

      sig { params(status: Symbol).void }
      def initialize(status:)
      end

      sig { override.returns({status: Symbol}) }
      def to_hash
      end

      class Status < Braintrust::Enum
        abstract!

        SUCCESS = :success

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end
    end
  end
end
