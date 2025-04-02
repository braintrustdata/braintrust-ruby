# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#summarize
    class ExperimentSummarizeParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute [r] comparison_experiment_id
      #   The experiment to compare against, if summarizing scores and metrics. If
      #     omitted, will fall back to the `base_exp_id` stored in the experiment metadata,
      #     and then to the most recent experiment run in the same project. Must pass
      #     `summarize_scores=true` for this id to be used
      #
      #   @return [String, nil]
      optional :comparison_experiment_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :comparison_experiment_id

      # @!attribute summarize_scores
      #   Whether to summarize the scores and metrics. If false (or omitted), only the
      #     metadata will be returned.
      #
      #   @return [Boolean, nil]
      optional :summarize_scores, Braintrust::BooleanModel, nil?: true

      # @!parse
      #   # @param comparison_experiment_id [String]
      #   # @param summarize_scores [Boolean, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(comparison_experiment_id: nil, summarize_scores: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
