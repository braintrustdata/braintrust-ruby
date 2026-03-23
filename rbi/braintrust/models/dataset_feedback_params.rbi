# typed: strong

module Braintrust
  module Models
    class DatasetFeedbackParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Braintrust::DatasetFeedbackParams,
            Braintrust::Internal::AnyHash
          )
        end

      # A list of dataset feedback items
      sig { returns(T::Array[Braintrust::FeedbackDatasetItem]) }
      attr_accessor :feedback

      sig do
        params(
          feedback: T::Array[Braintrust::FeedbackDatasetItem::OrHash],
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A list of dataset feedback items
        feedback:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            feedback: T::Array[Braintrust::FeedbackDatasetItem],
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
