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
          repo_info: T.nilable(T.any(Braintrust::Models::RepoInfo, Braintrust::Util::AnyHash)),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::Experiment)
      end
      def create(
        # Unique identifier for the project that the experiment belongs under
        project_id:,
        # Id of default base experiment to compare against when viewing this experiment
        base_exp_id: nil,
        # Identifier of the linked dataset, or null if the experiment is not linked to a
        #   dataset
        dataset_id: nil,
        # Version number of the linked dataset the experiment was run against. This can be
        #   used to reproduce the experiment after the dataset has been modified.
        dataset_version: nil,
        # Textual description of the experiment
        description: nil,
        # Normally, creating an experiment with the same name as an existing experiment
        #   will return the existing one un-modified. But if `ensure_new` is true,
        #   registration will generate a new experiment with a unique name in case of a
        #   conflict.
        ensure_new: nil,
        # User-controlled metadata about the experiment
        metadata: nil,
        # Name of the experiment. Within a project, experiment names are unique
        name: nil,
        # Whether or not the experiment is public. Public experiments can be viewed by
        #   anybody inside or outside the organization
        public: nil,
        # Metadata about the state of the repo when the experiment was created
        repo_info: nil,
        request_options: {}
      )
      end

      # Get an experiment object by its id
      sig do
        params(
          experiment_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::Experiment)
      end
      def retrieve(
        # Experiment id
        experiment_id,
        request_options: {}
      )
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
          repo_info: T.nilable(T.any(Braintrust::Models::RepoInfo, Braintrust::Util::AnyHash)),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::Experiment)
      end
      def update(
        # Experiment id
        experiment_id,
        # Id of default base experiment to compare against when viewing this experiment
        base_exp_id: nil,
        # Identifier of the linked dataset, or null if the experiment is not linked to a
        #   dataset
        dataset_id: nil,
        # Version number of the linked dataset the experiment was run against. This can be
        #   used to reproduce the experiment after the dataset has been modified.
        dataset_version: nil,
        # Textual description of the experiment
        description: nil,
        # User-controlled metadata about the experiment
        metadata: nil,
        # Name of the experiment. Within a project, experiment names are unique
        name: nil,
        # Whether or not the experiment is public. Public experiments can be viewed by
        #   anybody inside or outside the organization
        public: nil,
        # Metadata about the state of the repo when the experiment was created
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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::Experiment])
      end
      def list(
        # Pagination cursor id.
        #
        #   For example, if the initial item in the last page you fetched had an id of
        #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        #   pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Name of the experiment to search for
        experiment_name: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        #   IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Filter search results to within a particular organization
        org_name: nil,
        # Project id
        project_id: nil,
        # Name of the project to search for
        project_name: nil,
        # Pagination cursor id.
        #
        #   For example, if the final item in the last page you fetched had an id of `foo`,
        #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        #   `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      )
      end

      # Delete an experiment object by its id
      sig do
        params(
          experiment_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::Experiment)
      end
      def delete(
        # Experiment id
        experiment_id,
        request_options: {}
      )
      end

      # Log feedback for a set of experiment events
      sig do
        params(
          experiment_id: String,
          feedback: T::Array[T.any(Braintrust::Models::FeedbackExperimentItem, Braintrust::Util::AnyHash)],
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::FeedbackResponseSchema)
      end
      def feedback(
        # Experiment id
        experiment_id,
        # A list of experiment feedback items
        feedback:,
        request_options: {}
      )
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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::FetchExperimentEventsResponse)
      end
      def fetch(
        # Experiment id
        experiment_id,
        # limit the number of traces fetched
        #
        #   Fetch queries may be paginated if the total result size is expected to be large
        #   (e.g. project_logs which accumulate over a long time). Note that fetch queries
        #   only support pagination in descending time order (from latest to earliest
        #   `_xact_id`. Furthermore, later pages may return rows which showed up in earlier
        #   pages, except with an earlier `_xact_id`. This happens because pagination occurs
        #   over the whole version history of the event log. You will most likely want to
        #   exclude any such duplicate, outdated rows (by `id`) from your combined result
        #   set.
        #
        #   The `limit` parameter controls the number of full traces to return. So you may
        #   end up with more individual rows than the specified limit if you are fetching
        #   events containing traces.
        limit: nil,
        # DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
        #   favor of the explicit 'cursor' returned by object fetch requests. Please prefer
        #   the 'cursor' argument going forwards.
        #
        #   Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
        #
        #   Since a paginated fetch query returns results in order from latest to earliest,
        #   the cursor for the next page can be found as the row with the minimum (earliest)
        #   value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
        #   for an overview of paginating fetch queries.
        max_root_span_id: nil,
        # DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
        #   favor of the explicit 'cursor' returned by object fetch requests. Please prefer
        #   the 'cursor' argument going forwards.
        #
        #   Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
        #
        #   Since a paginated fetch query returns results in order from latest to earliest,
        #   the cursor for the next page can be found as the row with the minimum (earliest)
        #   value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
        #   for an overview of paginating fetch queries.
        max_xact_id: nil,
        # Retrieve a snapshot of events from a past time
        #
        #   The version id is essentially a filter on the latest event transaction id. You
        #   can use the `max_xact_id` returned by a past fetch as the version to reproduce
        #   that exact fetch.
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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::FetchExperimentEventsResponse)
      end
      def fetch_post(
        # Experiment id
        experiment_id,
        # An opaque string to be used as a cursor for the next page of results, in order
        #   from latest to earliest.
        #
        #   The string can be obtained directly from the `cursor` property of the previous
        #   fetch query
        cursor: nil,
        # limit the number of traces fetched
        #
        #   Fetch queries may be paginated if the total result size is expected to be large
        #   (e.g. project_logs which accumulate over a long time). Note that fetch queries
        #   only support pagination in descending time order (from latest to earliest
        #   `_xact_id`. Furthermore, later pages may return rows which showed up in earlier
        #   pages, except with an earlier `_xact_id`. This happens because pagination occurs
        #   over the whole version history of the event log. You will most likely want to
        #   exclude any such duplicate, outdated rows (by `id`) from your combined result
        #   set.
        #
        #   The `limit` parameter controls the number of full traces to return. So you may
        #   end up with more individual rows than the specified limit if you are fetching
        #   events containing traces.
        limit: nil,
        # DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
        #   favor of the explicit 'cursor' returned by object fetch requests. Please prefer
        #   the 'cursor' argument going forwards.
        #
        #   Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
        #
        #   Since a paginated fetch query returns results in order from latest to earliest,
        #   the cursor for the next page can be found as the row with the minimum (earliest)
        #   value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
        #   for an overview of paginating fetch queries.
        max_root_span_id: nil,
        # DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
        #   favor of the explicit 'cursor' returned by object fetch requests. Please prefer
        #   the 'cursor' argument going forwards.
        #
        #   Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
        #
        #   Since a paginated fetch query returns results in order from latest to earliest,
        #   the cursor for the next page can be found as the row with the minimum (earliest)
        #   value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
        #   for an overview of paginating fetch queries.
        max_xact_id: nil,
        # Retrieve a snapshot of events from a past time
        #
        #   The version id is essentially a filter on the latest event transaction id. You
        #   can use the `max_xact_id` returned by a past fetch as the version to reproduce
        #   that exact fetch.
        version: nil,
        request_options: {}
      )
      end

      # Insert a set of events into the experiment
      sig do
        params(
          experiment_id: String,
          events: T::Array[T.any(Braintrust::Models::InsertExperimentEvent, Braintrust::Util::AnyHash)],
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::InsertEventsResponse)
      end
      def insert(
        # Experiment id
        experiment_id,
        # A list of experiment events to insert
        events:,
        request_options: {}
      )
      end

      # Summarize experiment
      sig do
        params(
          experiment_id: String,
          comparison_experiment_id: String,
          summarize_scores: T.nilable(T::Boolean),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
        )
          .returns(Braintrust::Models::SummarizeExperimentResponse)
      end
      def summarize(
        # Experiment id
        experiment_id,
        # The experiment to compare against, if summarizing scores and metrics. If
        #   omitted, will fall back to the `base_exp_id` stored in the experiment metadata,
        #   and then to the most recent experiment run in the same project. Must pass
        #   `summarize_scores=true` for this id to be used
        comparison_experiment_id: nil,
        # Whether to summarize the scores and metrics. If false (or omitted), only the
        #   metadata will be returned.
        summarize_scores: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
