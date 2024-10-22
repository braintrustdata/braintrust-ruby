# frozen_string_literal: true

module Braintrust
  module Models
    class SummarizeExperimentResponse < BaseModel
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

      # @!parse
      #   # Create a new instance of SummarizeExperimentResponse from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :experiment_name Name of the experiment
      #   #   @option data [String] :experiment_url URL to the experiment's page in the Braintrust app
      #   #   @option data [String] :project_name Name of the project that the experiment belongs to
      #   #   @option data [String] :project_url URL to the project's page in the Braintrust app
      #   #   @option data [String, nil] :comparison_experiment_name The experiment which scores are baselined against
      #   #   @option data [Hash, nil] :metrics Summary of the experiment's metrics
      #   #   @option data [Hash, nil] :scores Summary of the experiment's scores
      #   def initialize(data = {}) = super
    end
  end
end
