# frozen_string_literal: true

module Braintrust
  module Resources
    class Dataset
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
      #   do not support removing fields or setting them to null. As a workaround, you may
      #   retrieve the full object with `GET /dataset/{id}` and then replace it with
      #   `PUT /dataset`.
      # 
      # @param dataset_id [String] Dataset id
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the dataset. Within a project, dataset names are unique
      # @option params [String] :description Textual description of the dataset
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
      # @option params [Array<Feedback>] :feedback A list of dataset feedback items
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [NilClass]
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
      # @option params [Integer] :limit Fetch queries may be paginated if the total result size is expected to be large
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
      # @option params [String] :max_root_span_id Together, `max_xact_id` and `max_root_span_id` form a cursor for paginating
      #   event fetches. Given a previous fetch with a list of rows, you can determine
      #   `max_root_span_id` as the maximum of the `root_span_id` field over all rows. See
      #   the documentation for `limit` for an overview of paginating fetch queries.
      # @option params [Integer] :max_xact_id Together, `max_xact_id` and `max_root_span_id` form a cursor for paginating
      #   event fetches. Given a previous fetch with a list of rows, you can determine
      #   `max_xact_id` as the maximum of the `_xact_id` field over all rows. See the
      #   documentation for `limit` for an overview of paginating fetch queries.
      # @option params [Integer] :version You may specify a version id to retrieve a snapshot of the events from a past
      #   time. The version id is essentially a filter on the latest event transaction id.
      #   You can use the `max_xact_id` returned by a past fetch as the version to
      #   reproduce that exact fetch.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::DatasetFetchResponse]
      def fetch(dataset_id, params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/dataset/#{dataset_id}/fetch"
        req[:query] = params
        req[:model] = Braintrust::Models::DatasetFetchResponse
        @client.request(req, opts)
      end

      # Fetch the events in a dataset. Equivalent to the GET form of the same path, but
      #   with the parameters in the request body rather than in the URL query
      # 
      # @param dataset_id [String] Dataset id
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [Array<Filter>] :filters A list of filters on the events to fetch. Currently, only path-lookup type
      #   filters are supported, but we may add more in the future
      # @option params [Integer] :limit Fetch queries may be paginated if the total result size is expected to be large
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
      # @option params [String] :max_root_span_id Together, `max_xact_id` and `max_root_span_id` form a cursor for paginating
      #   event fetches. Given a previous fetch with a list of rows, you can determine
      #   `max_root_span_id` as the maximum of the `root_span_id` field over all rows. See
      #   the documentation for `limit` for an overview of paginating fetch queries.
      # @option params [Integer] :max_xact_id Together, `max_xact_id` and `max_root_span_id` form a cursor for paginating
      #   event fetches. Given a previous fetch with a list of rows, you can determine
      #   `max_xact_id` as the maximum of the `_xact_id` field over all rows. See the
      #   documentation for `limit` for an overview of paginating fetch queries.
      # @option params [Integer] :version You may specify a version id to retrieve a snapshot of the events from a past
      #   time. The version id is essentially a filter on the latest event transaction id.
      #   You can use the `max_xact_id` returned by a past fetch as the version to
      #   reproduce that exact fetch.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::DatasetFetchPostResponse]
      def fetch_post(dataset_id, params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/dataset/#{dataset_id}/fetch"
        req[:body] = params
        req[:model] = Braintrust::Models::DatasetFetchPostResponse
        @client.request(req, opts)
      end

      # Insert a set of events into the dataset
      # 
      # @param dataset_id [String] Dataset id
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [Array<Event::UnnamedTypeWithunionParent4,Event::UnnamedTypeWithunionParent5>] :events A list of dataset events to insert
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::DatasetInsertResponse]
      def insert(dataset_id, params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/dataset/#{dataset_id}/insert"
        req[:body] = params
        req[:model] = Braintrust::Models::DatasetInsertResponse
        @client.request(req, opts)
      end

      # Create or replace a new dataset. If there is an existing dataset in the project
      #   with the same name as the one specified in the request, will replace the
      #   existing dataset with the provided fields
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the dataset. Within a project, dataset names are unique
      # @option params [String] :description Textual description of the dataset
      # @option params [String] :project_id Unique identifier for the project that the dataset belongs under
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::Dataset]
      def replace(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/v1/dataset"
        req[:body] = params
        req[:model] = Braintrust::Models::Dataset
        @client.request(req, opts)
      end
    end
  end
end
