# frozen_string_literal: true

module Braintrust
  module Resources
    class Evals
      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::EvalCreateParams} for more details.
      #
      # Launch an evaluation. This is the API-equivalent of the `Eval` function that is
      # built into the Braintrust SDK. In the Eval API, you provide pointers to a
      # dataset, task function, and scoring functions. The API will then run the
      # evaluation, create an experiment, and return the results along with a link to
      # the experiment. To learn more about evals, see the
      # [Evals guide](https://www.braintrust.dev/docs/guides/evals).
      #
      # @overload create(data:, project_id:, scores:, task:, base_experiment_id: nil, base_experiment_name: nil, experiment_name: nil, git_metadata_settings: nil, is_public: nil, max_concurrency: nil, metadata: nil, parent: nil, repo_info: nil, stream: nil, timeout: nil, trial_count: nil, request_options: {})
      #
      # @param data [Braintrust::Models::EvalCreateParams::Data::DatasetID, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName, Braintrust::Models::EvalCreateParams::Data::DatasetRows] The dataset to use
      #
      # @param project_id [String] Unique identifier for the project to run the eval in
      #
      # @param scores [Array<Braintrust::Models::EvalCreateParams::Score::FunctionID, Braintrust::Models::EvalCreateParams::Score::ProjectSlug, Braintrust::Models::EvalCreateParams::Score::GlobalFunction, Braintrust::Models::EvalCreateParams::Score::PromptSessionID, Braintrust::Models::EvalCreateParams::Score::InlineCode, Braintrust::Models::EvalCreateParams::Score::InlinePrompt>] The functions to score the eval on
      #
      # @param task [Braintrust::Models::EvalCreateParams::Task::FunctionID, Braintrust::Models::EvalCreateParams::Task::ProjectSlug, Braintrust::Models::EvalCreateParams::Task::GlobalFunction, Braintrust::Models::EvalCreateParams::Task::PromptSessionID, Braintrust::Models::EvalCreateParams::Task::InlineCode, Braintrust::Models::EvalCreateParams::Task::InlinePrompt] The function to evaluate
      #
      # @param base_experiment_id [String, nil] An optional experiment id to use as a base. If specified, the new experiment wil
      # ...
      #
      # @param base_experiment_name [String, nil] An optional experiment name to use as a base. If specified, the new experiment w
      # ...
      #
      # @param experiment_name [String] An optional name for the experiment created by this eval. If it conflicts with a
      # ...
      #
      # @param git_metadata_settings [Braintrust::Models::EvalCreateParams::GitMetadataSettings, nil] Optional settings for collecting git metadata. By default, will collect all git
      # ...
      #
      # @param is_public [Boolean, nil] Whether the experiment should be public. Defaults to false.
      #
      # @param max_concurrency [Float, nil] The maximum number of tasks/scorers that will be run concurrently. Defaults to u
      # ...
      #
      # @param metadata [Hash{Symbol=>Object, nil}] Optional experiment-level metadata to store about the evaluation. You can later
      # ...
      #
      # @param parent [Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String] Options for tracing the evaluation
      #
      # @param repo_info [Braintrust::Models::RepoInfo, nil] Metadata about the state of the repo when the experiment was created
      #
      # @param stream [Boolean] Whether to stream the results of the eval. If true, the request will return two
      # ...
      #
      # @param timeout [Float, nil] The maximum duration, in milliseconds, to run the evaluation. Defaults to undefi
      # ...
      #
      # @param trial_count [Float, nil] The number of times to run the evaluator per input. This is useful for evaluatin
      # ...
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::SummarizeExperimentResponse]
      #
      # @see Braintrust::Models::EvalCreateParams
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

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
