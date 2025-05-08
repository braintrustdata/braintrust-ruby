# typed: strong

module Braintrust
  module Models
    class FeedbackResponseSchema < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      sig { returns(Braintrust::FeedbackResponseSchema::Status::TaggedSymbol) }
      attr_accessor :status

      sig do
        params(
          status: Braintrust::FeedbackResponseSchema::Status::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(status:)
      end

      sig do
        override.returns(
          { status: Braintrust::FeedbackResponseSchema::Status::TaggedSymbol }
        )
      end
      def to_hash
      end

      module Status
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Braintrust::FeedbackResponseSchema::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUCCESS =
          T.let(
            :success,
            Braintrust::FeedbackResponseSchema::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Braintrust::FeedbackResponseSchema::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
