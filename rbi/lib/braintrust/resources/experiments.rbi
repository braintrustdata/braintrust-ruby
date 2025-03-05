# typed: strong

module Braintrust
  module Resources
    class Experiments
      sig do
        params(
          project_id: String,
          base_exp_id: T.nilable(String),
          dataset_id: T.nilable(String),
          dataset_version: T.nilable(String),
          description: T.nilable(String),
          ensure_new: T.nilable(T::Boolean),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          public: T.nilable(T::Boolean),
          repo_info: T.nilable(Braintrust::Models::RepoInfo),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Experiment)
      end
      def create(
        project_id:,
        base_exp_id: nil,
        dataset_id: nil,
        dataset_version: nil,
        description: nil,
        ensure_new: nil,
        metadata: nil,
        name: nil,
        public: nil,
        repo_info: nil,
        request_options: {}
      )
      end

      sig do
        params(
          experiment_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Experiment)
      end
      def retrieve(experiment_id, request_options: {})
      end

      sig do
        params(
          experiment_id: String,
          base_exp_id: T.nilable(String),
          dataset_id: T.nilable(String),
          dataset_version: T.nilable(String),
          description: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          public: T.nilable(T::Boolean),
          repo_info: T.nilable(Braintrust::Models::RepoInfo),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Experiment)
      end
      def update(
        experiment_id,
        base_exp_id: nil,
        dataset_id: nil,
        dataset_version: nil,
        description: nil,
        metadata: nil,
        name: nil,
        public: nil,
        repo_info: nil,
        request_options: {}
      )
      end

      sig do
        params(
          ending_before: String,
          experiment_name: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_id: String,
          project_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::Experiment])
      end
      def list(
        ending_before: nil,
        experiment_name: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        project_id: nil,
        project_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        params(
          experiment_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Experiment)
      end
      def delete(experiment_id, request_options: {})
      end

      sig do
        params(
          experiment_id: String,
          feedback: T::Array[Braintrust::Models::FeedbackExperimentItem],
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::FeedbackResponseSchema)
      end
      def feedback(experiment_id, feedback:, request_options: {})
      end

      sig do
        params(
          experiment_id: String,
          limit: T.nilable(Integer),
          max_root_span_id: String,
          max_xact_id: String,
          version: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::FetchExperimentEventsResponse)
      end
      def fetch(
        experiment_id,
        limit: nil,
        max_root_span_id: nil,
        max_xact_id: nil,
        version: nil,
        request_options: {}
      )
      end

      sig do
        params(
          experiment_id: String,
          cursor: T.nilable(String),
          limit: T.nilable(Integer),
          max_root_span_id: T.nilable(String),
          max_xact_id: T.nilable(String),
          version: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::FetchExperimentEventsResponse)
      end
      def fetch_post(
        experiment_id,
        cursor: nil,
        limit: nil,
        max_root_span_id: nil,
        max_xact_id: nil,
        version: nil,
        request_options: {}
      )
      end

      sig do
        params(
          experiment_id: String,
          events: T::Array[Braintrust::Models::InsertExperimentEvent],
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::InsertEventsResponse)
      end
      def insert(experiment_id, events:, request_options: {})
      end

      sig do
        params(
          experiment_id: String,
          comparison_experiment_id: String,
          summarize_scores: T.nilable(T::Boolean),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::SummarizeExperimentResponse)
      end
      def summarize(experiment_id, comparison_experiment_id: nil, summarize_scores: nil, request_options: {})
      end

      sig { params(client: Braintrust::Client).void }
      def initialize(client:)
      end
    end
  end
end
