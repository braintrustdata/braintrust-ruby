# typed: strong

module Braintrust
  module Models
    class ExperimentInsertParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Braintrust::ExperimentInsertParams,
            Braintrust::Internal::AnyHash
          )
        end

      # A list of experiment events to insert
      sig { returns(T::Array[Braintrust::InsertExperimentEvent]) }
      attr_accessor :events

      sig do
        params(
          events: T::Array[Braintrust::InsertExperimentEvent::OrHash],
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # A list of experiment events to insert
        events:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            events: T::Array[Braintrust::InsertExperimentEvent],
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
