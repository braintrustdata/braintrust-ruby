# typed: strong

module Braintrust
  module Models
    class DatasetFeedbackParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # A list of dataset feedback items
      sig { returns(T::Array[Braintrust::Models::FeedbackDatasetItem]) }
      def feedback
      end

      sig do
        params(_: T::Array[Braintrust::Models::FeedbackDatasetItem])
          .returns(T::Array[Braintrust::Models::FeedbackDatasetItem])
      end
      def feedback=(_)
      end

      sig do
        params(
          feedback: T::Array[Braintrust::Models::FeedbackDatasetItem],
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(feedback:, request_options: {})
      end

      sig do
        override
          .returns(
            {feedback: T::Array[Braintrust::Models::FeedbackDatasetItem], request_options: Braintrust::RequestOptions}
          )
      end
      def to_hash
      end
    end
  end
end
