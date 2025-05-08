# typed: strong

module Braintrust
  module Models
    class DatasetInsertParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # A list of dataset events to insert
      sig { returns(T::Array[Braintrust::InsertDatasetEvent]) }
      attr_accessor :events

      sig do
        params(
          events: T::Array[Braintrust::InsertDatasetEvent::OrHash],
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A list of dataset events to insert
        events:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            events: T::Array[Braintrust::InsertDatasetEvent],
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
