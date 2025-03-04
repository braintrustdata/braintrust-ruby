# frozen_string_literal: true

module Braintrust
  module Models
    class CrossObjectInsertResponse < Braintrust::BaseModel
      # @!attribute dataset
      #   A mapping from dataset id to row ids for inserted `events`
      #
      #   @return [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil]
      optional :dataset, -> { Braintrust::HashOf[Braintrust::Models::InsertEventsResponse] }, nil?: true

      # @!attribute experiment
      #   A mapping from experiment id to row ids for inserted `events`
      #
      #   @return [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil]
      optional :experiment, -> { Braintrust::HashOf[Braintrust::Models::InsertEventsResponse] }, nil?: true

      # @!attribute project_logs
      #   A mapping from project id to row ids for inserted `events`
      #
      #   @return [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil]
      optional :project_logs, -> { Braintrust::HashOf[Braintrust::Models::InsertEventsResponse] }, nil?: true

      # @!parse
      #   # @param dataset [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil]
      #   # @param experiment [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil]
      #   # @param project_logs [Hash{Symbol=>Braintrust::Models::InsertEventsResponse}, nil]
      #   #
      #   def initialize(dataset: nil, experiment: nil, project_logs: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
