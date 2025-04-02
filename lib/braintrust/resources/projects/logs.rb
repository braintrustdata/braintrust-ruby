# frozen_string_literal: true

module Braintrust
  module Resources
    class Projects
      class Logs
        # Log feedback for a set of project logs events
        #
        # @param project_id [String] Project id
        #
        # @param params [Braintrust::Models::Projects::LogFeedbackParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Array<Braintrust::Models::FeedbackProjectLogsItem>] :feedback A list of project logs feedback items
        #
        #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Braintrust::Models::FeedbackResponseSchema]
        def feedback(project_id, params)
          parsed, options = Braintrust::Models::Projects::LogFeedbackParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/project_logs/%1$s/feedback", project_id],
            body: parsed,
            model: Braintrust::Models::FeedbackResponseSchema,
            options: options
          )
        end

        # Fetch the events in a project logs. Equivalent to the POST form of the same
        #   path, but with the parameters in the URL query rather than in the request body.
        #   For more complex queries, use the `POST /btql` endpoint.
        #
        # @param project_id [String] Project id
        #
        # @param params [Braintrust::Models::Projects::LogFetchParams, Hash{Symbol=>Object}] .
        #
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
        #
        #   @option params [String] :max_root_span_id DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
        #     favor of the explicit 'cursor' returned by object fetch requests. Please prefer
        #     the 'cursor' argument going forwards.
        #
        #     Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
        #
        #     Since a paginated fetch query returns results in order from latest to earliest,
        #     the cursor for the next page can be found as the row with the minimum (earliest)
        #     value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
        #     for an overview of paginating fetch queries.
        #
        #   @option params [String] :max_xact_id DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
        #     favor of the explicit 'cursor' returned by object fetch requests. Please prefer
        #     the 'cursor' argument going forwards.
        #
        #     Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
        #
        #     Since a paginated fetch query returns results in order from latest to earliest,
        #     the cursor for the next page can be found as the row with the minimum (earliest)
        #     value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
        #     for an overview of paginating fetch queries.
        #
        #   @option params [String] :version Retrieve a snapshot of events from a past time
        #
        #     The version id is essentially a filter on the latest event transaction id. You
        #     can use the `max_xact_id` returned by a past fetch as the version to reproduce
        #     that exact fetch.
        #
        #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Braintrust::Models::FetchProjectLogsEventsResponse]
        def fetch(project_id, params = {})
          parsed, options = Braintrust::Models::Projects::LogFetchParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/project_logs/%1$s/fetch", project_id],
            query: parsed,
            model: Braintrust::Models::FetchProjectLogsEventsResponse,
            options: options
          )
        end

        # Fetch the events in a project logs. Equivalent to the GET form of the same path,
        #   but with the parameters in the request body rather than in the URL query. For
        #   more complex queries, use the `POST /btql` endpoint.
        #
        # @param project_id [String] Project id
        #
        # @param params [Braintrust::Models::Projects::LogFetchPostParams, Hash{Symbol=>Object}] .
        #
        #   @option params [String, nil] :cursor An opaque string to be used as a cursor for the next page of results, in order
        #     from latest to earliest.
        #
        #     The string can be obtained directly from the `cursor` property of the previous
        #     fetch query
        #
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
        #
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
        #
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
        #
        #   @option params [String, nil] :version Retrieve a snapshot of events from a past time
        #
        #     The version id is essentially a filter on the latest event transaction id. You
        #     can use the `max_xact_id` returned by a past fetch as the version to reproduce
        #     that exact fetch.
        #
        #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Braintrust::Models::FetchProjectLogsEventsResponse]
        def fetch_post(project_id, params = {})
          parsed, options = Braintrust::Models::Projects::LogFetchPostParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/project_logs/%1$s/fetch", project_id],
            body: parsed,
            model: Braintrust::Models::FetchProjectLogsEventsResponse,
            options: options
          )
        end

        # Insert a set of events into the project logs
        #
        # @param project_id [String] Project id
        #
        # @param params [Braintrust::Models::Projects::LogInsertParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Array<Braintrust::Models::InsertProjectLogsEvent>] :events A list of project logs events to insert
        #
        #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Braintrust::Models::InsertEventsResponse]
        def insert(project_id, params)
          parsed, options = Braintrust::Models::Projects::LogInsertParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/project_logs/%1$s/insert", project_id],
            body: parsed,
            model: Braintrust::Models::InsertEventsResponse,
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
end
