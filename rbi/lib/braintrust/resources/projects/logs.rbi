# typed: strong

module Braintrust
  module Resources
    class Projects
      class Logs
        # Log feedback for a set of project logs events
        sig do
          params(
            project_id: String,
            feedback: T::Array[T.any(Braintrust::Models::FeedbackProjectLogsItem, Braintrust::Internal::AnyHash)],
            request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
          )
            .returns(Braintrust::Models::FeedbackResponseSchema)
        end
        def feedback(
          # Project id
          project_id,
          # A list of project logs feedback items
          feedback:,
          request_options: {}
        ); end
        # Fetch the events in a project logs. Equivalent to the POST form of the same
        #   path, but with the parameters in the URL query rather than in the request body.
        #   For more complex queries, use the `POST /btql` endpoint.
        sig do
          params(
            project_id: String,
            limit: T.nilable(Integer),
            max_root_span_id: String,
            max_xact_id: String,
            version: String,
            request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
          )
            .returns(Braintrust::Models::FetchProjectLogsEventsResponse)
        end
        def fetch(
          # Project id
          project_id,
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
        ); end
        # Fetch the events in a project logs. Equivalent to the GET form of the same path,
        #   but with the parameters in the request body rather than in the URL query. For
        #   more complex queries, use the `POST /btql` endpoint.
        sig do
          params(
            project_id: String,
            cursor: T.nilable(String),
            limit: T.nilable(Integer),
            max_root_span_id: T.nilable(String),
            max_xact_id: T.nilable(String),
            version: T.nilable(String),
            request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
          )
            .returns(Braintrust::Models::FetchProjectLogsEventsResponse)
        end
        def fetch_post(
          # Project id
          project_id,
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
        ); end
        # Insert a set of events into the project logs
        sig do
          params(
            project_id: String,
            events: T::Array[T.any(Braintrust::Models::InsertProjectLogsEvent, Braintrust::Internal::AnyHash)],
            request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
          )
            .returns(Braintrust::Models::InsertEventsResponse)
        end
        def insert(
          # Project id
          project_id,
          # A list of project logs events to insert
          events:,
          request_options: {}
        ); end
        # @api private
        sig { params(client: Braintrust::Client).returns(T.attached_class) }
        def self.new(client:); end
      end
    end
  end
end
