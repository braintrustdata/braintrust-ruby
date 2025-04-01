# typed: strong

module Braintrust
  module Models
    class ExperimentFeedbackParams < Braintrust::BaseModel
      extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # A list of experiment feedback items
      sig { returns(T::Array[Braintrust::Models::FeedbackExperimentItem]) }
      attr_accessor :feedback

      sig do
        params(
          feedback: T::Array[T.any(Braintrust::Models::FeedbackExperimentItem, Braintrust::Util::AnyHash)],
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(feedback:, request_options: {})
      end

      sig do
        override
          .returns(
            {feedback: T::Array[Braintrust::Models::FeedbackExperimentItem], request_options: Braintrust::RequestOptions}
          )
      end
      def to_hash
      end
    end
  end
end
