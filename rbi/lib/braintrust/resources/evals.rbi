# typed: strong

module Braintrust
  module Resources
    class Evals
      # Launch an evaluation. This is the API-equivalent of the `Eval` function that is
      #   built into the Braintrust SDK. In the Eval API, you provide pointers to a
      #   dataset, task function, and scoring functions. The API will then run the
      #   evaluation, create an experiment, and return the results along with a link to
      #   the experiment. To learn more about evals, see the
      #   [Evals guide](https://www.braintrust.dev/docs/guides/evals).
      sig do
        params(
          data: T.any(
            Braintrust::Models::EvalCreateParams::Data::DatasetID,
            Braintrust::Internal::AnyHash,
            Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName,
            Braintrust::Models::EvalCreateParams::Data::DatasetRows
          ),
          project_id: String,
          scores: T::Array[
            T.any(
              Braintrust::Models::EvalCreateParams::Score::FunctionID,
              Braintrust::Internal::AnyHash,
              Braintrust::Models::EvalCreateParams::Score::ProjectSlug,
              Braintrust::Models::EvalCreateParams::Score::GlobalFunction,
              Braintrust::Models::EvalCreateParams::Score::PromptSessionID,
              Braintrust::Models::EvalCreateParams::Score::InlineCode,
              Braintrust::Models::EvalCreateParams::Score::InlinePrompt
            )
          ],
          task: T.any(
            Braintrust::Models::EvalCreateParams::Task::FunctionID,
            Braintrust::Internal::AnyHash,
            Braintrust::Models::EvalCreateParams::Task::ProjectSlug,
            Braintrust::Models::EvalCreateParams::Task::GlobalFunction,
            Braintrust::Models::EvalCreateParams::Task::PromptSessionID,
            Braintrust::Models::EvalCreateParams::Task::InlineCode,
            Braintrust::Models::EvalCreateParams::Task::InlinePrompt
          ),
          base_experiment_id: T.nilable(String),
          base_experiment_name: T.nilable(String),
          experiment_name: String,
          git_metadata_settings: T.nilable(T.any(Braintrust::Models::EvalCreateParams::GitMetadataSettings, Braintrust::Internal::AnyHash)),
          is_public: T.nilable(T::Boolean),
          max_concurrency: T.nilable(Float),
          metadata: T::Hash[Symbol, T.nilable(T.anything)],
          parent: T.any(
            Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct,
            Braintrust::Internal::AnyHash,
            String
          ),
          repo_info: T.nilable(T.any(Braintrust::Models::RepoInfo, Braintrust::Internal::AnyHash)),
          stream: T::Boolean,
          timeout: T.nilable(Float),
          trial_count: T.nilable(Float),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::SummarizeExperimentResponse)
      end
      def create(
        # The dataset to use
        data:,
        # Unique identifier for the project to run the eval in
        project_id:,
        # The functions to score the eval on
        scores:,
        # The function to evaluate
        task:,
        # An optional experiment id to use as a base. If specified, the new experiment
        #   will be summarized and compared to this experiment.
        base_experiment_id: nil,
        # An optional experiment name to use as a base. If specified, the new experiment
        #   will be summarized and compared to this experiment.
        base_experiment_name: nil,
        # An optional name for the experiment created by this eval. If it conflicts with
        #   an existing experiment, it will be suffixed with a unique identifier.
        experiment_name: nil,
        # Optional settings for collecting git metadata. By default, will collect all git
        #   metadata fields allowed in org-level settings.
        git_metadata_settings: nil,
        # Whether the experiment should be public. Defaults to false.
        is_public: nil,
        # The maximum number of tasks/scorers that will be run concurrently. Defaults to
        #   undefined, in which case there is no max concurrency.
        max_concurrency: nil,
        # Optional experiment-level metadata to store about the evaluation. You can later
        #   use this to slice & dice across experiments.
        metadata: nil,
        # Options for tracing the evaluation
        parent: nil,
        # Metadata about the state of the repo when the experiment was created
        repo_info: nil,
        # Whether to stream the results of the eval. If true, the request will return two
        #   events: one to indicate the experiment has started, and another upon completion.
        #   If false, the request will return the evaluation's summary upon completion.
        stream: nil,
        # The maximum duration, in milliseconds, to run the evaluation. Defaults to
        #   undefined, in which case there is no timeout.
        timeout: nil,
        # The number of times to run the evaluator per input. This is useful for
        #   evaluating applications that have non-deterministic behavior and gives you both
        #   a stronger aggregate measure and a sense of the variance in the results.
        trial_count: nil,
        request_options: {}
      ); end
      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:); end
    end
  end
end
