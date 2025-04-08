# typed: strong

module Braintrust
  module Models
    class DatasetInsertParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # A list of dataset events to insert
      sig { returns(T::Array[Braintrust::Models::InsertDatasetEvent]) }
      attr_accessor :events

      sig do
        params(
          events: T::Array[T.any(Braintrust::Models::InsertDatasetEvent, Braintrust::Internal::AnyHash)],
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(events:, request_options: {}); end

      sig do
        override
          .returns(
            {events: T::Array[Braintrust::Models::InsertDatasetEvent], request_options: Braintrust::RequestOptions}
          )
      end
      def to_hash; end
    end
  end
end
