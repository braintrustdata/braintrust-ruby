# typed: strong

module Braintrust
  module Models
    class DatasetFeedbackParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # A list of dataset feedback items
      sig { returns(T::Array[Braintrust::Models::FeedbackDatasetItem]) }
      attr_accessor :feedback

      sig do
        params(
          feedback: T::Array[T.any(Braintrust::Models::FeedbackDatasetItem, Braintrust::Internal::AnyHash)],
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        # A list of dataset feedback items
        feedback:,
        request_options: {}
      ); end
      sig do
        override
          .returns(
            {feedback: T::Array[Braintrust::Models::FeedbackDatasetItem], request_options: Braintrust::RequestOptions}
          )
      end
      def to_hash; end
    end
  end
end
