# typed: strong

module Braintrust
  module Models
    class CrossObjectInsertResponse < Braintrust::BaseModel
      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse])) }
      def dataset
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse]))
          .returns(T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse]))
      end
      def dataset=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse])) }
      def experiment
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse]))
          .returns(T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse]))
      end
      def experiment=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse])) }
      def project_logs
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse]))
          .returns(T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse]))
      end
      def project_logs=(_)
      end

      sig do
        params(
          dataset: T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse]),
          experiment: T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse]),
          project_logs: T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse])
        )
          .returns(T.attached_class)
      end
      def self.new(dataset: nil, experiment: nil, project_logs: nil)
      end

      sig do
        override
          .returns(
            {
              dataset: T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse]),
              experiment: T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse]),
              project_logs: T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse])
            }
          )
      end
      def to_hash
      end
    end
  end
end
