# typed: strong

module Braintrust
  module Models
    class FetchProjectLogsEventsResponse < Braintrust::BaseModel
      # A list of fetched events
      sig { returns(T::Array[Braintrust::Models::ProjectLogsEvent]) }
      attr_accessor :events

      # Pagination cursor
      #
      #   Pass this string directly as the `cursor` param to your next fetch request to
      #   get the next page of results. Not provided if the returned result set is empty.
      sig { returns(T.nilable(String)) }
      attr_accessor :cursor

      sig do
        params(
          events: T::Array[T.any(Braintrust::Models::ProjectLogsEvent, Braintrust::Util::AnyHash)],
          cursor: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(events:, cursor: nil)
      end

      sig { override.returns({events: T::Array[Braintrust::Models::ProjectLogsEvent], cursor: T.nilable(String)}) }
      def to_hash
      end
    end
  end
end
