# typed: strong

module Braintrust
  module Resources
    class Evals
      sig do
        params(
          data: T.any(
            Braintrust::Models::EvalCreateParams::Data::DatasetID,
            Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName,
            Braintrust::Models::EvalCreateParams::Data::DatasetRows
          ),
          project_id: String,
          scores: T::Array[
          T.any(
            Braintrust::Models::EvalCreateParams::Score::FunctionID,
            Braintrust::Models::EvalCreateParams::Score::ProjectSlug,
            Braintrust::Models::EvalCreateParams::Score::GlobalFunction,
            Braintrust::Models::EvalCreateParams::Score::PromptSessionID,
            Braintrust::Models::EvalCreateParams::Score::InlineCode,
            Braintrust::Models::EvalCreateParams::Score::InlinePrompt
          )
          ],
          task: T.any(
            Braintrust::Models::EvalCreateParams::Task::FunctionID,
            Braintrust::Models::EvalCreateParams::Task::ProjectSlug,
            Braintrust::Models::EvalCreateParams::Task::GlobalFunction,
            Braintrust::Models::EvalCreateParams::Task::PromptSessionID,
            Braintrust::Models::EvalCreateParams::Task::InlineCode,
            Braintrust::Models::EvalCreateParams::Task::InlinePrompt
          ),
          base_experiment_id: T.nilable(String),
          base_experiment_name: T.nilable(String),
          experiment_name: String,
          git_metadata_settings: T.nilable(Braintrust::Models::EvalCreateParams::GitMetadataSettings),
          is_public: T.nilable(T::Boolean),
          max_concurrency: T.nilable(Float),
          metadata: T::Hash[Symbol, T.nilable(T.anything)],
          parent: T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String),
          repo_info: T.nilable(Braintrust::Models::RepoInfo),
          stream: T::Boolean,
          timeout: T.nilable(Float),
          trial_count: T.nilable(Float),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::SummarizeExperimentResponse)
      end
      def create(
        data:,
        project_id:,
        scores:,
        task:,
        base_experiment_id: nil,
        base_experiment_name: nil,
        experiment_name: nil,
        git_metadata_settings: nil,
        is_public: nil,
        max_concurrency: nil,
        metadata: nil,
        parent: nil,
        repo_info: nil,
        stream: nil,
        timeout: nil,
        trial_count: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
