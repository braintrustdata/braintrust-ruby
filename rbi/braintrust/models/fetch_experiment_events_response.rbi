# typed: strong

module Braintrust
  module Models
    class FetchExperimentEventsResponse < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Braintrust::FetchExperimentEventsResponse,
            Braintrust::Internal::AnyHash
          )
        end

      # A list of fetched events
      sig { returns(T::Array[Braintrust::ExperimentEvent]) }
      attr_accessor :events

      # Pagination cursor
      #
      # Pass this string directly as the `cursor` param to your next fetch request to
      # get the next page of results. Not provided if the returned result set is empty.
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      sig do
        params(
          events: T::Array[Braintrust::ExperimentEvent::OrHash],
          cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # A list of fetched events
        events:,
        # Pagination cursor
        #
        # Pass this string directly as the `cursor` param to your next fetch request to
        # get the next page of results. Not provided if the returned result set is empty.
        cursor: nil
      )
      end

      sig do
        override.returns(
          {
            events: T::Array[Braintrust::ExperimentEvent],
            cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
