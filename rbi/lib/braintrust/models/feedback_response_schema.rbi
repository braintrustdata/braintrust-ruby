# typed: strong

module Braintrust
  module Models
    class FeedbackResponseSchema < Braintrust::Internal::Type::BaseModel
      sig { returns(Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol) }
      attr_accessor :status

      sig { params(status: Braintrust::Models::FeedbackResponseSchema::Status::OrSymbol).returns(T.attached_class) }
      def self.new(status:)
      end

      sig { override.returns({status: Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol}) }
      def to_hash
      end

      module Status
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::FeedbackResponseSchema::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol) }

        SUCCESS = T.let(:success, Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
