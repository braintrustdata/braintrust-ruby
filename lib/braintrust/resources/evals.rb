# frozen_string_literal: true

module Braintrust
  module Resources
    class Evals
      # Launch an evaluation. This is the API-equivalent of the `Eval` function that is
      #   built into the Braintrust SDK. In the Eval API, you provide pointers to a
      #   dataset, task function, and scoring functions. The API will then run the
      #   evaluation, create an experiment, and return the results along with a link to
      #   the experiment. To learn more about evals, see the
      #   [Evals guide](https://www.braintrust.dev/docs/guides/evals).
      #
      # @param params [Braintrust::Models::EvalCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::Models::EvalCreateParams::Data::DatasetID, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName, Braintrust::Models::EvalCreateParams::Data::DatasetRows] :data The dataset to use
      #
      #   @option params [String] :project_id Unique identifier for the project to run the eval in
      #
      #   @option params [Array<Braintrust::Models::EvalCreateParams::Score::FunctionID, Braintrust::Models::EvalCreateParams::Score::ProjectSlug, Braintrust::Models::EvalCreateParams::Score::GlobalFunction, Braintrust::Models::EvalCreateParams::Score::PromptSessionID, Braintrust::Models::EvalCreateParams::Score::InlineCode, Braintrust::Models::EvalCreateParams::Score::InlinePrompt>] :scores The functions to score the eval on
      #
      #   @option params [Braintrust::Models::EvalCreateParams::Task::FunctionID, Braintrust::Models::EvalCreateParams::Task::ProjectSlug, Braintrust::Models::EvalCreateParams::Task::GlobalFunction, Braintrust::Models::EvalCreateParams::Task::PromptSessionID, Braintrust::Models::EvalCreateParams::Task::InlineCode, Braintrust::Models::EvalCreateParams::Task::InlinePrompt] :task The function to evaluate
      #
      #   @option params [String, nil] :base_experiment_id An optional experiment id to use as a base. If specified, the new experiment
      #     will be summarized and compared to this experiment.
      #
      #   @option params [String, nil] :base_experiment_name An optional experiment name to use as a base. If specified, the new experiment
      #     will be summarized and compared to this experiment.
      #
      #   @option params [String] :experiment_name An optional name for the experiment created by this eval. If it conflicts with
      #     an existing experiment, it will be suffixed with a unique identifier.
      #
      #   @option params [Braintrust::Models::EvalCreateParams::GitMetadataSettings, nil] :git_metadata_settings Optional settings for collecting git metadata. By default, will collect all git
      #     metadata fields allowed in org-level settings.
      #
      #   @option params [Boolean, nil] :is_public Whether the experiment should be public. Defaults to false.
      #
      #   @option params [Float, nil] :max_concurrency The maximum number of tasks/scorers that will be run concurrently. Defaults to
      #     undefined, in which case there is no max concurrency.
      #
      #   @option params [Hash{Symbol=>Object, nil}] :metadata Optional experiment-level metadata to store about the evaluation. You can later
      #     use this to slice & dice across experiments.
      #
      #   @option params [Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String] :parent Options for tracing the evaluation
      #
      #   @option params [Braintrust::Models::RepoInfo, nil] :repo_info Metadata about the state of the repo when the experiment was created
      #
      #   @option params [Boolean] :stream Whether to stream the results of the eval. If true, the request will return two
      #     events: one to indicate the experiment has started, and another upon completion.
      #     If false, the request will return the evaluation's summary upon completion.
      #
      #   @option params [Float, nil] :timeout The maximum duration, in milliseconds, to run the evaluation. Defaults to
      #     undefined, in which case there is no timeout.
      #
      #   @option params [Float, nil] :trial_count The number of times to run the evaluator per input. This is useful for
      #     evaluating applications that have non-deterministic behavior and gives you both
      #     a stronger aggregate measure and a sense of the variance in the results.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::SummarizeExperimentResponse]
      def create(params)
        parsed, options = Braintrust::Models::EvalCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/eval",
          body: parsed,
          model: Braintrust::Models::SummarizeExperimentResponse,
          options: options
        )
      end

      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
