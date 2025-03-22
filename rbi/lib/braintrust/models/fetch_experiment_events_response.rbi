# typed: strong

module Braintrust
  module Models
    class FetchExperimentEventsResponse < Braintrust::BaseModel
      # A list of fetched events
      sig { returns(T::Array[Braintrust::Models::ExperimentEvent]) }
      def events
      end

      sig do
        params(_: T::Array[Braintrust::Models::ExperimentEvent])
          .returns(T::Array[Braintrust::Models::ExperimentEvent])
      end
      def events=(_)
      end

      # Pagination cursor
      #
      #   Pass this string directly as the `cursor` param to your next fetch request to
      #   get the next page of results. Not provided if the returned result set is empty.
      sig { returns(T.nilable(String)) }
      def cursor
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def cursor=(_)
      end

      sig do
        params(
          events: T::Array[T.any(Braintrust::Models::ExperimentEvent, Braintrust::Util::AnyHash)],
          cursor: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(events:, cursor: nil)
      end

      sig { override.returns({events: T::Array[Braintrust::Models::ExperimentEvent], cursor: T.nilable(String)}) }
      def to_hash
      end
    end
  end
end
