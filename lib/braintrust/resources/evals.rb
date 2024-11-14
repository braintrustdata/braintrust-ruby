# frozen_string_literal: true

module Braintrust
  module Resources
    class Evals
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Launch an evaluation. This is the API-equivalent of the `Eval` function that is
      #   built into the Braintrust SDK. In the Eval API, you provide pointers to a
      #   dataset, task function, and scoring functions. The API will then run the
      #   evaluation, create an experiment, and return the results along with a link to
      #   the experiment. To learn more about evals, see the
      #   [Evals guide](https://www.braintrust.dev/docs/guides/evals).
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [Data::UnnamedTypeWithunionParent40, Data::UnnamedTypeWithunionParent41] :data The dataset to use
      #   @option params [String] :project_id Unique identifier for the project to run the eval in
      #   @option params [Array<Score::UnnamedTypeWithunionParent42, Score::UnnamedTypeWithunionParent43, Score::UnnamedTypeWithunionParent44, Score::UnnamedTypeWithunionParent45, Score::UnnamedTypeWithunionParent46, Score::UnnamedTypeWithunionParent47>] :scores The functions to score the eval on
      #   @option params [Task::UnnamedTypeWithunionParent48, Task::UnnamedTypeWithunionParent49, Task::UnnamedTypeWithunionParent50, Task::UnnamedTypeWithunionParent51, Task::UnnamedTypeWithunionParent52, Task::UnnamedTypeWithunionParent53] :task The function to evaluate
      #   @option params [String, nil] :base_experiment_id An optional experiment id to use as a base. If specified, the new experiment
      #     will be summarized and compared to this experiment.
      #   @option params [String, nil] :base_experiment_name An optional experiment name to use as a base. If specified, the new experiment
      #     will be summarized and compared to this experiment.
      #   @option params [String, nil] :experiment_name An optional name for the experiment created by this eval. If it conflicts with
      #     an existing experiment, it will be suffixed with a unique identifier.
      #   @option params [GitMetadataSettings, nil] :git_metadata_settings Optional settings for collecting git metadata. By default, will collect all git
      #     metadata fields allowed in org-level settings.
      #   @option params [Boolean, nil] :is_public Whether the experiment should be public. Defaults to false.
      #   @option params [Float, nil] :max_concurrency The maximum number of tasks/scorers that will be run concurrently. Defaults to
      #     undefined, in which case there is no max concurrency.
      #   @option params [Hash, nil] :metadata Optional experiment-level metadata to store about the evaluation. You can later
      #     use this to slice & dice across experiments.
      #   @option params [Braintrust::Models::RepoInfo, nil] :repo_info Metadata about the state of the repo when the experiment was created
      #   @option params [Boolean, nil] :stream Whether to stream the results of the eval. If true, the request will return two
      #     events: one to indicate the experiment has started, and another upon completion.
      #     If false, the request will return the evaluation's summary upon completion.
      #   @option params [Float, nil] :timeout The maximum duration, in milliseconds, to run the evaluation. Defaults to
      #     undefined, in which case there is no timeout.
      #   @option params [Float, nil] :trial_count The number of times to run the evaluator per input. This is useful for
      #     evaluating applications that have non-deterministic behavior and gives you both
      #     a stronger aggregate measure and a sense of the variance in the results.
      #
      # @param opts [Hash{Symbol => Object}, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::SummarizeExperimentResponse]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/eval",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::SummarizeExperimentResponse
        }
        @client.request(req, opts)
      end
    end
  end
end
