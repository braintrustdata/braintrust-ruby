# typed: strong

module Braintrust
  module Models
    class CrossObjectInsertResponse < Braintrust::BaseModel
      # A mapping from dataset id to row ids for inserted `events`
      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse])) }
      attr_accessor :dataset

      # A mapping from experiment id to row ids for inserted `events`
      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse])) }
      attr_accessor :experiment

      # A mapping from project id to row ids for inserted `events`
      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::InsertEventsResponse])) }
      attr_accessor :project_logs

      sig do
        params(
          dataset: T.nilable(T::Hash[Symbol, T.any(Braintrust::Models::InsertEventsResponse, Braintrust::Util::AnyHash)]),
          experiment: T.nilable(T::Hash[Symbol, T.any(Braintrust::Models::InsertEventsResponse, Braintrust::Util::AnyHash)]),
          project_logs: T.nilable(T::Hash[Symbol, T.any(Braintrust::Models::InsertEventsResponse, Braintrust::Util::AnyHash)])
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
