# frozen_string_literal: true

module Braintrust
  module Resources
    class Datasets
      # Create a new dataset. If there is an existing dataset in the project with the
      #   same name as the one specified in the request, will return the existing dataset
      #   unmodified
      #
      # @param params [Braintrust::Models::DatasetCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the dataset. Within a project, dataset names are unique
      #
      #   @option params [String] :project_id Unique identifier for the project that the dataset belongs under
      #
      #   @option params [String, nil] :description Textual description of the dataset
      #
      #   @option params [Hash{Symbol=>Object, nil}, nil] :metadata User-controlled metadata about the dataset
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Dataset]
      #
      def create(params)
        parsed, options = Braintrust::Models::DatasetCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/dataset",
          body: parsed,
          model: Braintrust::Models::Dataset,
          options: options
        )
      end

      # Get a dataset object by its id
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Braintrust::Models::DatasetRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Dataset]
      #
      def retrieve(dataset_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/dataset/%0s", dataset_id],
          model: Braintrust::Models::Dataset,
          options: params[:request_options]
        )
      end

      # Partially update a dataset object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Braintrust::Models::DatasetUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String, nil] :description Textual description of the dataset
      #
      #   @option params [Hash{Symbol=>Object, nil}, nil] :metadata User-controlled metadata about the dataset
      #
      #   @option params [String, nil] :name Name of the dataset. Within a project, dataset names are unique
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Dataset]
      #
      def update(dataset_id, params = {})
        parsed, options = Braintrust::Models::DatasetUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/dataset/%0s", dataset_id],
          body: parsed,
          model: Braintrust::Models::Dataset,
          options: options
        )
      end

      # List out all datasets. The datasets are sorted by creation date, with the most
      #   recently-created datasets coming first
      #
      # @param params [Braintrust::Models::DatasetListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :dataset_name Name of the dataset to search for
      #
      #   @option params [String] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #
      #   @option params [String, Array<String>] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #
      #   @option params [String] :org_name Filter search results to within a particular organization
      #
      #   @option params [String] :project_id Project id
      #
      #   @option params [String] :project_name Name of the project to search for
      #
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Dataset>]
      #
      def list(params = {})
        parsed, options = Braintrust::Models::DatasetListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/dataset",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Dataset,
          options: options
        )
      end

      # Delete a dataset object by its id
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Braintrust::Models::DatasetDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Dataset]
      #
      def delete(dataset_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/dataset/%0s", dataset_id],
          model: Braintrust::Models::Dataset,
          options: params[:request_options]
        )
      end

      # Log feedback for a set of dataset events
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Braintrust::Models::DatasetFeedbackParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Array<Braintrust::Models::FeedbackDatasetItem>] :feedback A list of dataset feedback items
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::FeedbackResponseSchema]
      #
      def feedback(dataset_id, params)
        parsed, options = Braintrust::Models::DatasetFeedbackParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/dataset/%0s/feedback", dataset_id],
          body: parsed,
          model: Braintrust::Models::FeedbackResponseSchema,
          options: options
        )
      end

      # Fetch the events in a dataset. Equivalent to the POST form of the same path, but
      #   with the parameters in the URL query rather than in the request body. For more
      #   complex queries, use the `POST /btql` endpoint.
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Braintrust::Models::DatasetFetchParams, Hash{Symbol=>Object}] .
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
      # @return [Braintrust::Models::FetchDatasetEventsResponse]
      #
      def fetch(dataset_id, params = {})
        parsed, options = Braintrust::Models::DatasetFetchParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/dataset/%0s/fetch", dataset_id],
          query: parsed,
          model: Braintrust::Models::FetchDatasetEventsResponse,
          options: options
        )
      end

      # Fetch the events in a dataset. Equivalent to the GET form of the same path, but
      #   with the parameters in the request body rather than in the URL query. For more
      #   complex queries, use the `POST /btql` endpoint.
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Braintrust::Models::DatasetFetchPostParams, Hash{Symbol=>Object}] .
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
      # @return [Braintrust::Models::FetchDatasetEventsResponse]
      #
      def fetch_post(dataset_id, params = {})
        parsed, options = Braintrust::Models::DatasetFetchPostParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/dataset/%0s/fetch", dataset_id],
          body: parsed,
          model: Braintrust::Models::FetchDatasetEventsResponse,
          options: options
        )
      end

      # Insert a set of events into the dataset
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Braintrust::Models::DatasetInsertParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Array<Braintrust::Models::InsertDatasetEvent>] :events A list of dataset events to insert
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::InsertEventsResponse]
      #
      def insert(dataset_id, params)
        parsed, options = Braintrust::Models::DatasetInsertParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/dataset/%0s/insert", dataset_id],
          body: parsed,
          model: Braintrust::Models::InsertEventsResponse,
          options: options
        )
      end

      # Summarize dataset
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Braintrust::Models::DatasetSummarizeParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Boolean, nil] :summarize_data Whether to summarize the data. If false (or omitted), only the metadata will be
      #     returned.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::SummarizeDatasetResponse]
      #
      def summarize(dataset_id, params = {})
        parsed, options = Braintrust::Models::DatasetSummarizeParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/dataset/%0s/summarize", dataset_id],
          query: parsed,
          model: Braintrust::Models::SummarizeDatasetResponse,
          options: options
        )
      end

      # @param client [Braintrust::Client]
      #
      def initialize(client:)
        @client = client
      end
    end
  end
end
