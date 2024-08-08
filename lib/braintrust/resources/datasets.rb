# frozen_string_literal: true

module Braintrust
  module Resources
    class Datasets
      def initialize(client:)
        @client = client
      end

      # Create a new dataset. If there is an existing dataset in the project with the
      #   same name as the one specified in the request, will return the existing dataset
      #   unmodified
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the dataset. Within a project, dataset names are unique
      # @option params [String] :description Textual description of the dataset
      # @option params [String] :project_id Unique identifier for the project that the dataset belongs under
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Dataset]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/dataset"
        req[:body] = params
        req[:model] = Braintrust::Models::Dataset
        @client.request(req, opts)
      end

      # Get a dataset object by its id
      #
      # @param dataset_id [String] Dataset id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Dataset]
      def retrieve(dataset_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/dataset/#{dataset_id}"
        req[:model] = Braintrust::Models::Dataset
        @client.request(req, opts)
      end

      # Partially update a dataset object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :description Textual description of the dataset
      # @option params [Hash] :metadata User-controlled metadata about the dataset
      # @option params [String] :name Name of the dataset. Within a project, dataset names are unique
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Dataset]
      def update(dataset_id, params = {}, opts = {})
        req = {}
        req[:method] = :patch
        req[:path] = "/v1/dataset/#{dataset_id}"
        req[:body] = params
        req[:model] = Braintrust::Models::Dataset
        @client.request(req, opts)
      end

      # List out all datasets. The datasets are sorted by creation date, with the most
      #   recently-created datasets coming first
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :dataset_name Name of the dataset to search for
      # @option params [String] :ending_before Pagination cursor id.
      #
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      # @option params [Array<String>|String] :ids Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      # @option params [Integer] :limit Limit the number of objects to return
      # @option params [String] :org_name Filter search results to within a particular organization
      # @option params [String] :project_id Project id
      # @option params [String] :project_name Name of the project to search for
      # @option params [String] :starting_after Pagination cursor id.
      #
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Dataset>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/dataset"
        req[:query] = params
        req[:page] = Braintrust::ListObjects
        req[:model] = Braintrust::Models::Dataset
        @client.request(req, opts)
      end

      # Delete a dataset object by its id
      #
      # @param dataset_id [String] Dataset id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Dataset]
      def delete(dataset_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/dataset/#{dataset_id}"
        req[:model] = Braintrust::Models::Dataset
        @client.request(req, opts)
      end

      # Log feedback for a set of dataset events
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Array<Braintrust::Models::FeedbackDatasetItem>] :feedback A list of dataset feedback items
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [nil]
      def feedback(dataset_id, params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/dataset/#{dataset_id}/feedback"
        req[:body] = params
        req[:model] = NilClass
        @client.request(req, opts)
      end

      # Fetch the events in a dataset. Equivalent to the POST form of the same path, but
      #   with the parameters in the URL query rather than in the request body
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Integer] :limit limit the number of traces fetched
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
      # @option params [String] :max_root_span_id DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #   favor of the explicit 'cursor' returned by object fetch requests. Please prefer
      #   the 'cursor' argument going forwards.
      #
      #   Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
      #
      #   Since a paginated fetch query returns results in order from latest to earliest,
      #   the cursor for the next page can be found as the row with the minimum (earliest)
      #   value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
      #   for an overview of paginating fetch queries.
      # @option params [String] :max_xact_id DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #   favor of the explicit 'cursor' returned by object fetch requests. Please prefer
      #   the 'cursor' argument going forwards.
      #
      #   Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
      #
      #   Since a paginated fetch query returns results in order from latest to earliest,
      #   the cursor for the next page can be found as the row with the minimum (earliest)
      #   value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
      #   for an overview of paginating fetch queries.
      # @option params [String] :version Retrieve a snapshot of events from a past time
      #
      #   The version id is essentially a filter on the latest event transaction id. You
      #   can use the `max_xact_id` returned by a past fetch as the version to reproduce
      #   that exact fetch.
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::FetchDatasetEventsResponse]
      def fetch(dataset_id, params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/dataset/#{dataset_id}/fetch"
        req[:query] = params
        req[:model] = Braintrust::Models::FetchDatasetEventsResponse
        @client.request(req, opts)
      end

      # Fetch the events in a dataset. Equivalent to the GET form of the same path, but
      #   with the parameters in the request body rather than in the URL query
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :cursor An opaque string to be used as a cursor for the next page of results, in order
      #   from latest to earliest.
      #
      #   The string can be obtained directly from the `cursor` property of the previous
      #   fetch query
      # @option params [Array<Braintrust::Models::PathLookupFilter>] :filters A list of filters on the events to fetch. Currently, only path-lookup type
      #   filters are supported, but we may add more in the future
      # @option params [Integer] :limit limit the number of traces fetched
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
      # @option params [String] :max_root_span_id DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #   favor of the explicit 'cursor' returned by object fetch requests. Please prefer
      #   the 'cursor' argument going forwards.
      #
      #   Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
      #
      #   Since a paginated fetch query returns results in order from latest to earliest,
      #   the cursor for the next page can be found as the row with the minimum (earliest)
      #   value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
      #   for an overview of paginating fetch queries.
      # @option params [String] :max_xact_id DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #   favor of the explicit 'cursor' returned by object fetch requests. Please prefer
      #   the 'cursor' argument going forwards.
      #
      #   Together, `max_xact_id` and `max_root_span_id` form a pagination cursor
      #
      #   Since a paginated fetch query returns results in order from latest to earliest,
      #   the cursor for the next page can be found as the row with the minimum (earliest)
      #   value of the tuple `(_xact_id, root_span_id)`. See the documentation of `limit`
      #   for an overview of paginating fetch queries.
      # @option params [String] :version Retrieve a snapshot of events from a past time
      #
      #   The version id is essentially a filter on the latest event transaction id. You
      #   can use the `max_xact_id` returned by a past fetch as the version to reproduce
      #   that exact fetch.
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::FetchDatasetEventsResponse]
      def fetch_post(dataset_id, params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/dataset/#{dataset_id}/fetch"
        req[:body] = params
        req[:model] = Braintrust::Models::FetchDatasetEventsResponse
        @client.request(req, opts)
      end

      # Insert a set of events into the dataset
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Array<Braintrust::Models::InsertDatasetEventMerge|Braintrust::Models::InsertDatasetEventReplace>] :events A list of dataset events to insert
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::InsertEventsResponse]
      def insert(dataset_id, params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/dataset/#{dataset_id}/insert"
        req[:body] = params
        req[:model] = Braintrust::Models::InsertEventsResponse
        @client.request(req, opts)
      end

      # Summarize dataset
      #
      # @param dataset_id [String] Dataset id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Boolean] :summarize_data Whether to summarize the data. If false (or omitted), only the metadata will be
      #   returned.
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::SummarizeDatasetResponse]
      def summarize(dataset_id, params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/dataset/#{dataset_id}/summarize"
        req[:query] = params
        req[:model] = Braintrust::Models::SummarizeDatasetResponse
        @client.request(req, opts)
      end
    end
  end
end
