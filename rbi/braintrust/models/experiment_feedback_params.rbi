# typed: strong

module Braintrust
  module Models
    class ExperimentFeedbackParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # A list of experiment feedback items
      sig { returns(T::Array[Braintrust::FeedbackExperimentItem]) }
      attr_accessor :feedback

      sig do
        params(
          feedback: T::Array[Braintrust::FeedbackExperimentItem::OrHash],
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A list of experiment feedback items
        feedback:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            feedback: T::Array[Braintrust::FeedbackExperimentItem],
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
