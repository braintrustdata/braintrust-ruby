# typed: strong

module Braintrust
  module Models
    class ExperimentInsertParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # A list of experiment events to insert
      sig { returns(T::Array[Braintrust::Models::InsertExperimentEvent]) }
      attr_accessor :events

      sig do
        params(
          events: T::Array[T.any(Braintrust::Models::InsertExperimentEvent, Braintrust::Internal::AnyHash)],
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        # A list of experiment events to insert
        events:,
        request_options: {}
      ); end
      sig do
        override
          .returns(
            {events: T::Array[Braintrust::Models::InsertExperimentEvent], request_options: Braintrust::RequestOptions}
          )
      end
      def to_hash; end
    end
  end
end
