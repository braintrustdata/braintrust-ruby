# typed: strong

module Braintrust
  module Models
    class FetchProjectLogsEventsResponse < Braintrust::BaseModel
      sig { returns(T::Array[Braintrust::Models::ProjectLogsEvent]) }
      def events
      end

      sig do
        params(_: T::Array[Braintrust::Models::ProjectLogsEvent])
          .returns(T::Array[Braintrust::Models::ProjectLogsEvent])
      end
      def events=(_)
      end

      sig { returns(T.nilable(String)) }
      def cursor
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def cursor=(_)
      end

      sig do
        params(events: T::Array[Braintrust::Models::ProjectLogsEvent], cursor: T.nilable(String))
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
