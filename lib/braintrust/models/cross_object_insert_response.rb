# frozen_string_literal: true

module Braintrust
  module Models
    class CrossObjectInsertResponse < BaseModel
      # @!attribute [rw] dataset
      #   A mapping from dataset id to row ids for inserted `events`
      #   @return [Hash]
      optional :dataset, Hash

      # @!attribute [rw] experiment
      #   A mapping from experiment id to row ids for inserted `events`
      #   @return [Hash]
      optional :experiment, Hash

      # @!attribute [rw] project_logs
      #   A mapping from project id to row ids for inserted `events`
      #   @return [Hash]
      optional :project_logs, Hash
    end
  end
end
