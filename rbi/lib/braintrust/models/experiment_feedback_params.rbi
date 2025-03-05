# typed: strong

module Braintrust
  module Models
    class ExperimentFeedbackParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T::Array[Braintrust::Models::FeedbackExperimentItem]) }
      def feedback
      end

      sig do
        params(_: T::Array[Braintrust::Models::FeedbackExperimentItem])
          .returns(T::Array[Braintrust::Models::FeedbackExperimentItem])
      end
      def feedback=(_)
      end

      sig do
        params(
          feedback: T::Array[Braintrust::Models::FeedbackExperimentItem],
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(feedback:, request_options: {})
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
