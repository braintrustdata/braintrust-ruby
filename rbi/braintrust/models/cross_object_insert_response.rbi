# typed: strong

module Braintrust
  module Models
    class CrossObjectInsertResponse < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Braintrust::CrossObjectInsertResponse,
            Braintrust::Internal::AnyHash
          )
        end

      # A mapping from dataset id to row ids for inserted `events`
      sig do
        returns(T.nilable(T::Hash[Symbol, Braintrust::InsertEventsResponse]))
      end
      attr_accessor :dataset

      # A mapping from experiment id to row ids for inserted `events`
      sig do
        returns(T.nilable(T::Hash[Symbol, Braintrust::InsertEventsResponse]))
      end
      attr_accessor :experiment

      # A mapping from project id to row ids for inserted `events`
      sig do
        returns(T.nilable(T::Hash[Symbol, Braintrust::InsertEventsResponse]))
      end
      attr_accessor :project_logs

      sig do
        params(
          dataset:
            T.nilable(
              T::Hash[Symbol, Braintrust::InsertEventsResponse::OrHash]
            ),
          experiment:
            T.nilable(
              T::Hash[Symbol, Braintrust::InsertEventsResponse::OrHash]
            ),
          project_logs:
            T.nilable(T::Hash[Symbol, Braintrust::InsertEventsResponse::OrHash])
        ).returns(T.attached_class)
      end
      def self.new(
        # A mapping from dataset id to row ids for inserted `events`
        dataset: nil,
        # A mapping from experiment id to row ids for inserted `events`
        experiment: nil,
        # A mapping from project id to row ids for inserted `events`
        project_logs: nil
      )
      end

      sig do
        override.returns(
          {
            dataset:
              T.nilable(T::Hash[Symbol, Braintrust::InsertEventsResponse]),
            experiment:
              T.nilable(T::Hash[Symbol, Braintrust::InsertEventsResponse]),
            project_logs:
              T.nilable(T::Hash[Symbol, Braintrust::InsertEventsResponse])
          }
        )
      end
      def to_hash
      end
    end
  end
end
