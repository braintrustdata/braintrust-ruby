# typed: strong

module Braintrust
  module Models
    class FeedbackResponseSchema < Braintrust::BaseModel
      sig { returns(Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol) }
      def status
      end

      sig do
        params(_: Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol)
          .returns(Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol)
      end
      def status=(_)
      end

      sig { params(status: Braintrust::Models::FeedbackResponseSchema::Status::OrSymbol).returns(T.attached_class) }
      def self.new(status:)
      end

      sig { override.returns({status: Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol}) }
      def to_hash
      end

      module Status
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::FeedbackResponseSchema::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol) }

        SUCCESS = T.let(:success, Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol)

        class << self
          sig { override.returns(T::Array[Braintrust::Models::FeedbackResponseSchema::Status::TaggedSymbol]) }
          def values
          end
        end
      end
    end
  end
end
