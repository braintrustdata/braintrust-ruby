# typed: strong

module Braintrust
  module Models
    class DatasetInsertParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # A list of dataset events to insert
      sig { returns(T::Array[Braintrust::Models::InsertDatasetEvent]) }
      def events
      end

      sig do
        params(_: T::Array[Braintrust::Models::InsertDatasetEvent])
          .returns(T::Array[Braintrust::Models::InsertDatasetEvent])
      end
      def events=(_)
      end

      sig do
        params(
          events: T::Array[Braintrust::Models::InsertDatasetEvent],
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(events:, request_options: {})
      end

      sig do
        override
          .returns(
            {events: T::Array[Braintrust::Models::InsertDatasetEvent], request_options: Braintrust::RequestOptions}
          )
      end
      def to_hash
      end
    end
  end
end
