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

      sig { params(status: Symbol).returns(T.attached_class) }
      def self.new(status:)
      end

      sig { override.returns({status: Symbol}) }
      def to_hash
      end

      class Status < Braintrust::Enum
        abstract!

        Value = type_template(:out) { {fixed: Symbol} }

        SUCCESS = :success
      end
    end
  end
end
