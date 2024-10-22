# frozen_string_literal: true

module Braintrust
  module Resources
    class Experiments
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Create a new experiment. If there is an existing experiment in the project with
      #   the same name as the one specified in the request, will return the existing
      #   experiment unmodified
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String] :project_id Unique identifier for the project that the experiment belongs under
      #   @option params [String, nil] :base_exp_id Id of default base experiment to compare against when viewing this experiment
      #   @option params [String, nil] :dataset_id Identifier of the linked dataset, or null if the experiment is not linked to a
      #     dataset
      #   @option params [String, nil] :dataset_version Version number of the linked dataset the experiment was run against. This can be
      #     used to reproduce the experiment after the dataset has been modified.
      #   @option params [String, nil] :description Textual description of the experiment
      #   @option params [Boolean, nil] :ensure_new Normally, creating an experiment with the same name as an existing experiment
      #     will return the existing one un-modified. But if `ensure_new` is true,
      #     registration will generate a new experiment with a unique name in case of a
      #     conflict.
      #   @option params [Hash, nil] :metadata User-controlled metadata about the experiment
      #   @option params [String, nil] :name Name of the experiment. Within a project, experiment names are unique
      #   @option params [Boolean, nil] :public Whether or not the experiment is public. Public experiments can be viewed by
      #     anybody inside or outside the organization
      #   @option params [Braintrust::Models::RepoInfo, nil] :repo_info Metadata about the state of the repo when the experiment was created
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Experiment]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/experiment",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Experiment
        }
        @client.request(req, opts)
      end

      # Get an experiment object by its id
      #
      # @param experiment_id [String] Experiment id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Experiment]
      def retrieve(experiment_id, opts = {})
        req = {
          method: :get,
          path: "/v1/experiment/#{experiment_id}",
          model: Braintrust::Models::Experiment
        }
        @client.request(req, opts)
      end

      # Partially update an experiment object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @param experiment_id [String] Experiment id
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String, nil] :base_exp_id Id of default base experiment to compare against when viewing this experiment
      #   @option params [String, nil] :dataset_id Identifier of the linked dataset, or null if the experiment is not linked to a
      #     dataset
      #   @option params [String, nil] :dataset_version Version number of the linked dataset the experiment was run against. This can be
      #     used to reproduce the experiment after the dataset has been modified.
      #   @option params [String, nil] :description Textual description of the experiment
      #   @option params [Hash, nil] :metadata User-controlled metadata about the experiment
      #   @option params [String, nil] :name Name of the experiment. Within a project, experiment names are unique
      #   @option params [Boolean, nil] :public Whether or not the experiment is public. Public experiments can be viewed by
      #     anybody inside or outside the organization
      #   @option params [Braintrust::Models::RepoInfo, nil] :repo_info Metadata about the state of the repo when the experiment was created
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Experiment]
      def update(experiment_id, params = {}, opts = {})
        req = {
          method: :patch,
          path: "/v1/experiment/#{experiment_id}",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Experiment
        }
        @client.request(req, opts)
      end

      # List out all experiments. The experiments are sorted by creation date, with the
      #   most recently-created experiments coming first
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String, nil] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #   @option params [String, nil] :experiment_name Name of the experiment to search for
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :org_name Filter search results to within a particular organization
      #   @option params [String, nil] :project_id Project id
      #   @option params [String, nil] :project_name Name of the project to search for
      #   @option params [String, nil] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Experiment>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/experiment",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Experiment
        }
        @client.request(req, opts)
      end

      # Delete an experiment object by its id
      #
      # @param experiment_id [String] Experiment id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Experiment]
      def delete(experiment_id, opts = {})
        req = {
          method: :delete,
          path: "/v1/experiment/#{experiment_id}",
          model: Braintrust::Models::Experiment
        }
        @client.request(req, opts)
      end

      # Log feedback for a set of experiment events
      #
      # @param experiment_id [String] Experiment id
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [Array<Braintrust::Models::FeedbackExperimentItem>] :feedback A list of experiment feedback items
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::FeedbackResponseSchema]
      def feedback(experiment_id, params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/experiment/#{experiment_id}/feedback",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::FeedbackResponseSchema
        }
        @client.request(req, opts)
      end

      # Fetch the events in an experiment. Equivalent to the POST form of the same path,
      #   but with the parameters in the URL query rather than in the request body
      #
      # @param experiment_id [String] Experiment id
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [Integer, nil] :limit limit the number of traces fetched
      #
      #     Fetch queries may be paginated if the total result size is expected to be large
      #     (e.g. project_logs which accumulate over a long time). Note that fetch queries
      #     only support pagination in descending time order (from latest to earliest
      #     `_xact_id`. Furthermore, later pages may return rows which showed up in earlier
      #     pages, except with an earlier `_xact_id`. This happens because pagination occurs
      #     over the whole version history of the event log. You will most likely want to
      #     exclude any such duplicate, outdated rows (by `id`) from your combined result
      #     set.
      #
      #     The `limit` parameter controls the number of full traces to return. So you may
      #     end up with more individual rows than the specified limit if you are fetching
      #     events containing traces.
      #   @option params [String, nil] :max_root_span_id DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #     favor of the explicit 'cursor' returned by object fetch requests. Please prefer
      #     the 'cursor' argument going forwards.
      #
      #     Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
      #
      #     Since a paginated fetch query returns results in order from latest to earliest,
      #     the cursor for the next page can be found as the row with the minimum (earliest)
      #     value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
      #     for an overview of paginating fetch queries.
      #   @option params [String, nil] :max_xact_id DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #     favor of the explicit 'cursor' returned by object fetch requests. Please prefer
      #     the 'cursor' argument going forwards.
      #
      #     Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
      #
      #     Since a paginated fetch query returns results in order from latest to earliest,
      #     the cursor for the next page can be found as the row with the minimum (earliest)
      #     value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
      #     for an overview of paginating fetch queries.
      #   @option params [String, nil] :version Retrieve a snapshot of events from a past time
      #
      #     The version id is essentially a filter on the latest event transaction id. You
      #     can use the `max_xact_id` returned by a past fetch as the version to reproduce
      #     that exact fetch.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::FetchExperimentEventsResponse]
      def fetch(experiment_id, params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/experiment/#{experiment_id}/fetch",
          query: params,
          model: Braintrust::Models::FetchExperimentEventsResponse
        }
        @client.request(req, opts)
      end

      # Fetch the events in an experiment. Equivalent to the GET form of the same path,
      #   but with the parameters in the request body rather than in the URL query
      #
      # @param experiment_id [String] Experiment id
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String, nil] :cursor An opaque string to be used as a cursor for the next page of results, in order
      #     from latest to earliest.
      #
      #     The string can be obtained directly from the `cursor` property of the previous
      #     fetch query
      #   @option params [Array<Braintrust::Models::PathLookupFilter>, nil] :filters NOTE: This parameter is deprecated and will be removed in a future revision.
      #     Consider using the `/btql` endpoint
      #     (https://www.braintrust.dev/docs/reference/btql) for more advanced filtering.
      #
      #     A list of filters on the events to fetch. Currently, only path-lookup type
      #     filters are supported.
      #   @option params [Integer, nil] :limit limit the number of traces fetched
      #
      #     Fetch queries may be paginated if the total result size is expected to be large
      #     (e.g. project_logs which accumulate over a long time). Note that fetch queries
      #     only support pagination in descending time order (from latest to earliest
      #     `_xact_id`. Furthermore, later pages may return rows which showed up in earlier
      #     pages, except with an earlier `_xact_id`. This happens because pagination occurs
      #     over the whole version history of the event log. You will most likely want to
      #     exclude any such duplicate, outdated rows (by `id`) from your combined result
      #     set.
      #
      #     The `limit` parameter controls the number of full traces to return. So you may
      #     end up with more individual rows than the specified limit if you are fetching
      #     events containing traces.
      #   @option params [String, nil] :max_root_span_id DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #     favor of the explicit 'cursor' returned by object fetch requests. Please prefer
      #     the 'cursor' argument going forwards.
      #
      #     Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
      #
      #     Since a paginated fetch query returns results in order from latest to earliest,
      #     the cursor for the next page can be found as the row with the minimum (earliest)
      #     value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
      #     for an overview of paginating fetch queries.
      #   @option params [String, nil] :max_xact_id DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #     favor of the explicit 'cursor' returned by object fetch requests. Please prefer
      #     the 'cursor' argument going forwards.
      #
      #     Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
      #
      #     Since a paginated fetch query returns results in order from latest to earliest,
      #     the cursor for the next page can be found as the row with the minimum (earliest)
      #     value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
      #     for an overview of paginating fetch queries.
      #   @option params [String, nil] :version Retrieve a snapshot of events from a past time
      #
      #     The version id is essentially a filter on the latest event transaction id. You
      #     can use the `max_xact_id` returned by a past fetch as the version to reproduce
      #     that exact fetch.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::FetchExperimentEventsResponse]
      def fetch_post(experiment_id, params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/experiment/#{experiment_id}/fetch",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::FetchExperimentEventsResponse
        }
        @client.request(req, opts)
      end

      # Insert a set of events into the experiment
      #
      # @param experiment_id [String] Experiment id
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [Array<Braintrust::Models::InsertExperimentEventMerge, Braintrust::Models::InsertExperimentEventReplace>] :events A list of experiment events to insert
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::InsertEventsResponse]
      def insert(experiment_id, params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/experiment/#{experiment_id}/insert",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::InsertEventsResponse
        }
        @client.request(req, opts)
      end

      # Summarize experiment
      #
      # @param experiment_id [String] Experiment id
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String, nil] :comparison_experiment_id The experiment to compare against, if summarizing scores and metrics. If
      #     omitted, will fall back to the `base_exp_id` stored in the experiment metadata,
      #     and then to the most recent experiment run in the same project. Must pass
      #     `summarize_scores=true` for this id to be used
      #   @option params [Boolean, nil] :summarize_scores Whether to summarize the scores and metrics. If false (or omitted), only the
      #     metadata will be returned.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::SummarizeExperimentResponse]
      def summarize(experiment_id, params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/experiment/#{experiment_id}/summarize",
          query: params,
          model: Braintrust::Models::SummarizeExperimentResponse
        }
        @client.request(req, opts)
      end
    end
  end
end
