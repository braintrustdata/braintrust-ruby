# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#summarize
    class ExperimentSummarizeParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute comparison_experiment_id
      #   The experiment to compare against, if summarizing scores and metrics. If
      #   omitted, will fall back to the `base_exp_id` stored in the experiment metadata,
      #   and then to the most recent experiment run in the same project. Must pass
      #   `summarize_scores=true` for this id to be used
      #
      #   @return [String, nil]
      optional :comparison_experiment_id, String

      # @!attribute summarize_scores
      #   Whether to summarize the scores and metrics. If false (or omitted), only the
      #   metadata will be returned.
      #
      #   @return [Boolean, nil]
      optional :summarize_scores, Braintrust::Internal::Type::Boolean, nil?: true

      # @!method initialize(comparison_experiment_id: nil, summarize_scores: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::ExperimentSummarizeParams} for more details.
      #
      #   @param comparison_experiment_id [String] The experiment to compare against, if summarizing scores and metrics. If omitted
      #
      #   @param summarize_scores [Boolean, nil] Whether to summarize the scores and metrics. If false (or omitted), only the met
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
