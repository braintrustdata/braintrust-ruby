# frozen_string_literal: true

module Braintrust
  module Models
    class CrossObjectInsertResponse < Braintrust::Internal::Type::BaseModel
      # @!attribute dataset
      #   A mapping from dataset id to row ids for inserted `events`
      #
      #   @return [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil]
      optional :dataset,
               -> { Braintrust::Internal::Type::HashOf[Braintrust::Models::InsertEventsResponse] },
               nil?: true

      # @!attribute experiment
      #   A mapping from experiment id to row ids for inserted `events`
      #
      #   @return [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil]
      optional :experiment,
               -> { Braintrust::Internal::Type::HashOf[Braintrust::Models::InsertEventsResponse] },
               nil?: true

      # @!attribute project_logs
      #   A mapping from project id to row ids for inserted `events`
      #
      #   @return [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil]
      optional :project_logs,
               -> { Braintrust::Internal::Type::HashOf[Braintrust::Models::InsertEventsResponse] },
               nil?: true

      # @!method initialize(dataset: nil, experiment: nil, project_logs: nil)
      #   @param dataset [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil] A mapping from dataset id to row ids for inserted `events`
      #
      #   @param experiment [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil] A mapping from experiment id to row ids for inserted `events`
      #
      #   @param project_logs [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil] A mapping from project id to row ids for inserted `events`
    end
  end
end
