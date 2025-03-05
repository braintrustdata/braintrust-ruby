# typed: strong

module Braintrust
  module Models
    class FetchDatasetEventsResponse < Braintrust::BaseModel
      sig { returns(T::Array[Braintrust::Models::DatasetEvent]) }
      def events
      end

      sig { params(_: T::Array[Braintrust::Models::DatasetEvent]).returns(T::Array[Braintrust::Models::DatasetEvent]) }
      def events=(_)
      end

      sig { returns(T.nilable(String)) }
      def cursor
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def cursor=(_)
      end

      sig { params(events: T::Array[Braintrust::Models::DatasetEvent], cursor: T.nilable(String)).void }
      def initialize(events:, cursor: nil)
      end

      sig { override.returns({events: T::Array[Braintrust::Models::DatasetEvent], cursor: T.nilable(String)}) }
      def to_hash
      end
    end
  end
end
