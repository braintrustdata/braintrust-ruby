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
      # @overload create(data:, project_id:, scores:, task:, base_experiment_id: nil, base_experiment_name: nil, experiment_name: nil, git_metadata_settings: nil, is_public: nil, max_concurrency: nil, metadata: nil, parent: nil, repo_info: nil, stream: nil, timeout: nil, trial_count: nil, request_options: {})
      #
      # @param data [Braintrust::Models::EvalCreateParams::Data::DatasetID, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName, Braintrust::Models::EvalCreateParams::Data::DatasetRows]
      # @param project_id [String]
      # @param scores [Array<Braintrust::Models::EvalCreateParams::Score::FunctionID, Braintrust::Models::EvalCreateParams::Score::ProjectSlug, Braintrust::Models::EvalCreateParams::Score::GlobalFunction, Braintrust::Models::EvalCreateParams::Score::PromptSessionID, Braintrust::Models::EvalCreateParams::Score::InlineCode, Braintrust::Models::EvalCreateParams::Score::InlinePrompt>]
      # @param task [Braintrust::Models::EvalCreateParams::Task::FunctionID, Braintrust::Models::EvalCreateParams::Task::ProjectSlug, Braintrust::Models::EvalCreateParams::Task::GlobalFunction, Braintrust::Models::EvalCreateParams::Task::PromptSessionID, Braintrust::Models::EvalCreateParams::Task::InlineCode, Braintrust::Models::EvalCreateParams::Task::InlinePrompt]
      # @param base_experiment_id [String, nil]
      # @param base_experiment_name [String, nil]
      # @param experiment_name [String]
      # @param git_metadata_settings [Braintrust::Models::EvalCreateParams::GitMetadataSettings, nil]
      # @param is_public [Boolean, nil]
      # @param max_concurrency [Float, nil]
      # @param metadata [Hash{Symbol=>Object, nil}]
      # @param parent [Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String]
      # @param repo_info [Braintrust::Models::RepoInfo, nil]
      # @param stream [Boolean]
      # @param timeout [Float, nil]
      # @param trial_count [Float, nil]
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
