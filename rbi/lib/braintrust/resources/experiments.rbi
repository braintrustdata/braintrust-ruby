# typed: strong

module Braintrust
  module Resources
    class Experiments
      # Create a new experiment. If there is an existing experiment in the project with
      #   the same name as the one specified in the request, will return the existing
      #   experiment unmodified
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

      # Get an experiment object by its id
      sig do
        params(
          experiment_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Experiment)
      end
      def retrieve(experiment_id, request_options: {})
      end

      # Partially update an experiment object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
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

      # List out all experiments. The experiments are sorted by creation date, with the
      #   most recently-created experiments coming first
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

      # Delete an experiment object by its id
      sig do
        params(
          experiment_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Experiment)
      end
      def delete(experiment_id, request_options: {})
      end

      # Log feedback for a set of experiment events
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

      # Fetch the events in an experiment. Equivalent to the POST form of the same path,
      #   but with the parameters in the URL query rather than in the request body. For
      #   more complex queries, use the `POST /btql` endpoint.
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

      # Fetch the events in an experiment. Equivalent to the GET form of the same path,
      #   but with the parameters in the request body rather than in the URL query. For
      #   more complex queries, use the `POST /btql` endpoint.
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

      # Insert a set of events into the experiment
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

      # Summarize experiment
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

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
