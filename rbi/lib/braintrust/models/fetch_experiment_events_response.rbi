# typed: strong

module Braintrust
  module Models
    class FetchExperimentEventsResponse < Braintrust::BaseModel
      sig { returns(T::Array[Braintrust::Models::ExperimentEvent]) }
      def events
      end

      sig do
        params(_: T::Array[Braintrust::Models::ExperimentEvent])
          .returns(T::Array[Braintrust::Models::ExperimentEvent])
      end
      def events=(_)
      end

      sig { returns(T.nilable(String)) }
      def cursor
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def cursor=(_)
      end

      sig { params(events: T::Array[Braintrust::Models::ExperimentEvent], cursor: T.nilable(String)).void }
      def initialize(events:, cursor: nil)
      end

      sig { override.returns({events: T::Array[Braintrust::Models::ExperimentEvent], cursor: T.nilable(String)}) }
      def to_hash
      end
    end
  end
end
