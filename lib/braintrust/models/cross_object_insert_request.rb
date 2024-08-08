# frozen_string_literal: true

module Braintrust
  module Models
    class CrossObjectInsertRequest < BaseModel
      # @!attribute [rw] dataset
      #   A mapping from dataset id to a set of log events and feedback items to insert
      #   @return [Hash]
      optional :dataset, Hash

      # @!attribute [rw] experiment
      #   A mapping from experiment id to a set of log events and feedback items to insert
      #   @return [Hash]
      optional :experiment, Hash

      # @!attribute [rw] project_logs
      #   A mapping from project id to a set of log events and feedback items to insert
      #   @return [Hash]
      optional :project_logs, Hash

      class Dataset < BaseModel
        # @!attribute [rw] events
        #   A list of dataset events to insert
        #   @return [Array<Braintrust::Models::InsertDatasetEventMerge|Braintrust::Models::InsertDatasetEventReplace>]
        optional :events, Braintrust::ArrayOf.new(Braintrust::Unknown)

        # @!attribute [rw] feedback
        #   A list of dataset feedback items
        #   @return [Array<Braintrust::Models::FeedbackDatasetItem>]
        optional :feedback, Braintrust::ArrayOf.new(-> { Braintrust::Models::FeedbackDatasetItem })
      end

      class Experiment < BaseModel
        # @!attribute [rw] events
        #   A list of experiment events to insert
        #   @return [Array<Braintrust::Models::InsertExperimentEventMerge|Braintrust::Models::InsertExperimentEventReplace>]
        optional :events, Braintrust::ArrayOf.new(Braintrust::Unknown)

        # @!attribute [rw] feedback
        #   A list of experiment feedback items
        #   @return [Array<Braintrust::Models::FeedbackExperimentItem>]
        optional :feedback, Braintrust::ArrayOf.new(-> { Braintrust::Models::FeedbackExperimentItem })
      end

      class ProjectLog < BaseModel
        # @!attribute [rw] events
        #   A list of project logs events to insert
        #   @return [Array<Braintrust::Models::InsertProjectLogsEventMerge|Braintrust::Models::InsertProjectLogsEventReplace>]
        optional :events, Braintrust::ArrayOf.new(Braintrust::Unknown)

        # @!attribute [rw] feedback
        #   A list of project logs feedback items
        #   @return [Array<Braintrust::Models::FeedbackProjectLogsItem>]
        optional :feedback, Braintrust::ArrayOf.new(-> { Braintrust::Models::FeedbackProjectLogsItem })
      end
    end
  end
end
