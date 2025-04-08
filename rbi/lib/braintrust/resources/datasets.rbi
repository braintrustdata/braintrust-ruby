# typed: strong

module Braintrust
  module Resources
    class Datasets
      # Create a new dataset. If there is an existing dataset in the project with the
      # same name as the one specified in the request, will return the existing dataset
      # unmodified
      sig do
        params(
          name: String,
          project_id: String,
          description: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Dataset)
      end
      def create(
        # Name of the dataset. Within a project, dataset names are unique
        name:,
        # Unique identifier for the project that the dataset belongs under
        project_id:,
        # Textual description of the dataset
        description: nil,
        # User-controlled metadata about the dataset
        metadata: nil,
        request_options: {}
      ); end
      # Get a dataset object by its id
      sig do
        params(
          dataset_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Dataset)
      end
      def retrieve(
        # Dataset id
        dataset_id,
        request_options: {}
      ); end
      # Partially update a dataset object. Specify the fields to update in the payload.
      # Any object-type fields will be deep-merged with existing content. Currently we
      # do not support removing fields or setting them to null.
      sig do
        params(
          dataset_id: String,
          description: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Dataset)
      end
      def update(
        # Dataset id
        dataset_id,
        # Textual description of the dataset
        description: nil,
        # User-controlled metadata about the dataset
        metadata: nil,
        # Name of the dataset. Within a project, dataset names are unique
        name: nil,
        request_options: {}
      ); end
      # List out all datasets. The datasets are sorted by creation date, with the most
      # recently-created datasets coming first
      sig do
        params(
          dataset_name: String,
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_id: String,
          project_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Internal::ListObjects[Braintrust::Models::Dataset])
      end
      def list(
        # Name of the dataset to search for
        dataset_name: nil,
        # Pagination cursor id.
        #
        # For example, if the initial item in the last page you fetched had an id of
        # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        # pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        # IDs, include the query param multiple times
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
        # For example, if the final item in the last page you fetched had an id of `foo`,
        # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        # `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      ); end
      # Delete a dataset object by its id
      sig do
        params(
          dataset_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Dataset)
      end
      def delete(
        # Dataset id
        dataset_id,
        request_options: {}
      ); end
      # Log feedback for a set of dataset events
      sig do
        params(
          dataset_id: String,
          feedback: T::Array[T.any(Braintrust::Models::FeedbackDatasetItem, Braintrust::Internal::AnyHash)],
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::FeedbackResponseSchema)
      end
      def feedback(
        # Dataset id
        dataset_id,
        # A list of dataset feedback items
        feedback:,
        request_options: {}
      ); end
      # Fetch the events in a dataset. Equivalent to the POST form of the same path, but
      # with the parameters in the URL query rather than in the request body. For more
      # complex queries, use the `POST /btql` endpoint.
      sig do
        params(
          dataset_id: String,
          limit: T.nilable(Integer),
          max_root_span_id: String,
          max_xact_id: String,
          version: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::FetchDatasetEventsResponse)
      end
      def fetch(
        # Dataset id
        dataset_id,
        # limit the number of traces fetched
        #
        # Fetch queries may be paginated if the total result size is expected to be large
        # (e.g. project_logs which accumulate over a long time). Note that fetch queries
        # only support pagination in descending time order (from latest to earliest
        # `_xact_id`. Furthermore, later pages may return rows which showed up in earlier
        # pages, except with an earlier `_xact_id`. This happens because pagination occurs
        # over the whole version history of the event log. You will most likely want to
        # exclude any such duplicate, outdated rows (by `id`) from your combined result
        # set.
        #
        # The `limit` parameter controls the number of full traces to return. So you may
        # end up with more individual rows than the specified limit if you are fetching
        # events containing traces.
        limit: nil,
        # DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
        # favor of the explicit 'cursor' returned by object fetch requests. Please prefer
        # the 'cursor' argument going forwards.
        #
        # Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
        #
        # Since a paginated fetch query returns results in order from latest to earliest,
        # the cursor for the next page can be found as the row with the minimum (earliest)
        # value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
        # for an overview of paginating fetch queries.
        max_root_span_id: nil,
        # DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
        # favor of the explicit 'cursor' returned by object fetch requests. Please prefer
        # the 'cursor' argument going forwards.
        #
        # Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
        #
        # Since a paginated fetch query returns results in order from latest to earliest,
        # the cursor for the next page can be found as the row with the minimum (earliest)
        # value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
        # for an overview of paginating fetch queries.
        max_xact_id: nil,
        # Retrieve a snapshot of events from a past time
        #
        # The version id is essentially a filter on the latest event transaction id. You
        # can use the `max_xact_id` returned by a past fetch as the version to reproduce
        # that exact fetch.
        version: nil,
        request_options: {}
      ); end
      # Fetch the events in a dataset. Equivalent to the GET form of the same path, but
      # with the parameters in the request body rather than in the URL query. For more
      # complex queries, use the `POST /btql` endpoint.
      sig do
        params(
          dataset_id: String,
          cursor: T.nilable(String),
          limit: T.nilable(Integer),
          max_root_span_id: T.nilable(String),
          max_xact_id: T.nilable(String),
          version: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::FetchDatasetEventsResponse)
      end
      def fetch_post(
        # Dataset id
        dataset_id,
        # An opaque string to be used as a cursor for the next page of results, in order
        # from latest to earliest.
        #
        # The string can be obtained directly from the `cursor` property of the previous
        # fetch query
        cursor: nil,
        # limit the number of traces fetched
        #
        # Fetch queries may be paginated if the total result size is expected to be large
        # (e.g. project_logs which accumulate over a long time). Note that fetch queries
        # only support pagination in descending time order (from latest to earliest
        # `_xact_id`. Furthermore, later pages may return rows which showed up in earlier
        # pages, except with an earlier `_xact_id`. This happens because pagination occurs
        # over the whole version history of the event log. You will most likely want to
        # exclude any such duplicate, outdated rows (by `id`) from your combined result
        # set.
        #
        # The `limit` parameter controls the number of full traces to return. So you may
        # end up with more individual rows than the specified limit if you are fetching
        # events containing traces.
        limit: nil,
        # DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
        # favor of the explicit 'cursor' returned by object fetch requests. Please prefer
        # the 'cursor' argument going forwards.
        #
        # Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
        #
        # Since a paginated fetch query returns results in order from latest to earliest,
        # the cursor for the next page can be found as the row with the minimum (earliest)
        # value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
        # for an overview of paginating fetch queries.
        max_root_span_id: nil,
        # DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
        # favor of the explicit 'cursor' returned by object fetch requests. Please prefer
        # the 'cursor' argument going forwards.
        #
        # Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
        #
        # Since a paginated fetch query returns results in order from latest to earliest,
        # the cursor for the next page can be found as the row with the minimum (earliest)
        # value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
        # for an overview of paginating fetch queries.
        max_xact_id: nil,
        # Retrieve a snapshot of events from a past time
        #
        # The version id is essentially a filter on the latest event transaction id. You
        # can use the `max_xact_id` returned by a past fetch as the version to reproduce
        # that exact fetch.
        version: nil,
        request_options: {}
      ); end
      # Insert a set of events into the dataset
      sig do
        params(
          dataset_id: String,
          events: T::Array[T.any(Braintrust::Models::InsertDatasetEvent, Braintrust::Internal::AnyHash)],
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::InsertEventsResponse)
      end
      def insert(
        # Dataset id
        dataset_id,
        # A list of dataset events to insert
        events:,
        request_options: {}
      ); end
      # Summarize dataset
      sig do
        params(
          dataset_id: String,
          summarize_data: T.nilable(T::Boolean),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::SummarizeDatasetResponse)
      end
      def summarize(
        # Dataset id
        dataset_id,
        # Whether to summarize the data. If false (or omitted), only the metadata will be
        # returned.
        summarize_data: nil,
        request_options: {}
      ); end
      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:); end
    end
  end
end
