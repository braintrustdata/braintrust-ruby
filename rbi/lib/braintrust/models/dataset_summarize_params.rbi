# typed: strong

module Braintrust
  module Models
    class DatasetSummarizeParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # Whether to summarize the data. If false (or omitted), only the metadata will be
      #   returned.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :summarize_data

      sig do
        params(
          summarize_data: T.nilable(T::Boolean),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(summarize_data: nil, request_options: {})
      end

      sig do
        override.returns({summarize_data: T.nilable(T::Boolean), request_options: Braintrust::RequestOptions})
      end
      def to_hash
      end
    end
  end
end
