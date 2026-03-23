# frozen_string_literal: true

module Braintrust
  module Models
    class SummarizeExperimentResponse < Braintrust::Internal::Type::BaseModel
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
      optional :metrics, -> { Braintrust::Internal::Type::HashOf[Braintrust::MetricSummary] }, nil?: true

      # @!attribute scores
      #   Summary of the experiment's scores
      #
      #   @return [Hash{Symbol=>Braintrust::Models::ScoreSummary}, nil]
      optional :scores, -> { Braintrust::Internal::Type::HashOf[Braintrust::ScoreSummary] }, nil?: true

      # @!method initialize(experiment_name:, experiment_url:, project_name:, project_url:, comparison_experiment_name: nil, metrics: nil, scores: nil)
      #   Summary of an experiment
      #
      #   @param experiment_name [String] Name of the experiment
      #
      #   @param experiment_url [String] URL to the experiment's page in the Braintrust app
      #
      #   @param project_name [String] Name of the project that the experiment belongs to
      #
      #   @param project_url [String] URL to the project's page in the Braintrust app
      #
      #   @param comparison_experiment_name [String, nil] The experiment which scores are baselined against
      #
      #   @param metrics [Hash{Symbol=>Braintrust::Models::MetricSummary}, nil] Summary of the experiment's metrics
      #
      #   @param scores [Hash{Symbol=>Braintrust::Models::ScoreSummary}, nil] Summary of the experiment's scores
    end
  end
end
