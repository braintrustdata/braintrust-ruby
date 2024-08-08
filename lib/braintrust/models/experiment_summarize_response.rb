# frozen_string_literal: true

module Braintrust
  module Models
    class ExperimentSummarizeResponse < BaseModel
      # @!attribute [rw] experiment_name
      #   Name of the experiment
      #   @return [String]
      required :experiment_name, String

      # @!attribute [rw] experiment_url
      #   URL to the experiment's page in the Braintrust app
      #   @return [String]
      required :experiment_url, String

      # @!attribute [rw] project_name
      #   Name of the project that the experiment belongs to
      #   @return [String]
      required :project_name, String

      # @!attribute [rw] project_url
      #   URL to the project's page in the Braintrust app
      #   @return [String]
      required :project_url, String

      # @!attribute [rw] comparison_experiment_name
      #   The experiment which scores are baselined against
      #   @return [String]
      optional :comparison_experiment_name, String

      # @!attribute [rw] metrics
      #   Summary of the experiment's metrics
      #   @return [Hash]
      optional :metrics, Hash

      # @!attribute [rw] scores
      #   Summary of the experiment's scores
      #   @return [Hash]
      optional :scores, Hash

      class Metric < BaseModel
        # @!attribute [rw] improvements
        #   Number of improvements in the metric
        #   @return [Integer]
        required :improvements, Integer

        # @!attribute [rw] metric
        #   Average metric across all examples
        #   @return [Float]
        required :metric, Float

        # @!attribute [rw] name_
        #   Name of the metric
        #   @return [String]
        required :name_, String

        # @!attribute [rw] regressions
        #   Number of regressions in the metric
        #   @return [Integer]
        required :regressions, Integer

        # @!attribute [rw] unit
        #   Unit label for the metric
        #   @return [String]
        required :unit, String

        # @!attribute [rw] diff
        #   Difference in metric between the current and comparison experiment
        #   @return [Float]
        optional :diff, Float
      end

      class Score < BaseModel
        # @!attribute [rw] improvements
        #   Number of improvements in the score
        #   @return [Integer]
        required :improvements, Integer

        # @!attribute [rw] name_
        #   Name of the score
        #   @return [String]
        required :name_, String

        # @!attribute [rw] regressions
        #   Number of regressions in the score
        #   @return [Integer]
        required :regressions, Integer

        # @!attribute [rw] score
        #   Average score across all examples
        #   @return [Float]
        required :score, Float

        # @!attribute [rw] diff
        #   Difference in score between the current and comparison experiment
        #   @return [Float]
        optional :diff, Float
      end
    end
  end
end
