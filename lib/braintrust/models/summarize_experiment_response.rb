# frozen_string_literal: true

module Braintrust
  module Models
    class SummarizeExperimentResponse < Braintrust::BaseModel
      # @!attribute experiment_name
      #   Name of the experiment
      #
      #   @return [String]
      required :experiment_name, String

      # @!attribute experiment_url
      #   URL to the experiment's page in the Braintrust app
      #
      #   @return [String]
      required :experiment_url, String

      # @!attribute project_name
      #   Name of the project that the experiment belongs to
      #
      #   @return [String]
      required :project_name, String

      # @!attribute project_url
      #   URL to the project's page in the Braintrust app
      #
      #   @return [String]
      required :project_url, String

      # @!attribute comparison_experiment_name
      #   The experiment which scores are baselined against
      #
      #   @return [String, nil]
      optional :comparison_experiment_name, String, nil?: true

      # @!attribute metrics
      #   Summary of the experiment's metrics
      #
      #   @return [Hash{Symbol=>Braintrust::Models::MetricSummary}, nil]
      optional :metrics, -> { Braintrust::HashOf[Braintrust::Models::MetricSummary] }, nil?: true

      # @!attribute scores
      #   Summary of the experiment's scores
      #
      #   @return [Hash{Symbol=>Braintrust::Models::ScoreSummary}, nil]
      optional :scores, -> { Braintrust::HashOf[Braintrust::Models::ScoreSummary] }, nil?: true

      # @!parse
      #   # Summary of an experiment
      #   #
      #   # @param experiment_name [String]
      #   # @param experiment_url [String]
      #   # @param project_name [String]
      #   # @param project_url [String]
      #   # @param comparison_experiment_name [String, nil]
      #   # @param metrics [Hash{Symbol=>Braintrust::Models::MetricSummary}, nil]
      #   # @param scores [Hash{Symbol=>Braintrust::Models::ScoreSummary}, nil]
      #   #
      #   def initialize(
      #     experiment_name:,
      #     experiment_url:,
      #     project_name:,
      #     project_url:,
      #     comparison_experiment_name: nil,
      #     metrics: nil,
      #     scores: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
