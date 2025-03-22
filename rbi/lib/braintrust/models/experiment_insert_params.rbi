# typed: strong

module Braintrust
  module Models
    class ExperimentInsertParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # A list of experiment events to insert
      sig { returns(T::Array[Braintrust::Models::InsertExperimentEvent]) }
      def events
      end

      sig do
        params(_: T::Array[Braintrust::Models::InsertExperimentEvent])
          .returns(T::Array[Braintrust::Models::InsertExperimentEvent])
      end
      def events=(_)
      end

      sig do
        params(
          events: T::Array[T.any(Braintrust::Models::InsertExperimentEvent, Braintrust::Util::AnyHash)],
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(events:, request_options: {})
      end

      sig do
        override
          .returns(
            {events: T::Array[Braintrust::Models::InsertExperimentEvent], request_options: Braintrust::RequestOptions}
          )
      end
      def to_hash
      end
    end
  end
end
