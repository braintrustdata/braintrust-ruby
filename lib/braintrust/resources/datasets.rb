# frozen_string_literal: true

module Braintrust
  module Resources
    class Datasets
      # Create a new dataset. If there is an existing dataset in the project with the
      # same name as the one specified in the request, will return the existing dataset
      # unmodified
      #
      # @overload create(name:, project_id:, description: nil, metadata: nil, request_options: {})
      #
      # @param name [String]
      # @param project_id [String]
      # @param description [String, nil]
      # @param metadata [Hash{Symbol=>Object, nil}, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Dataset]
      #
      # @see Braintrust::Models::DatasetCreateParams
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
      # @overload retrieve(dataset_id, request_options: {})
      #
      # @param dataset_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Dataset]
      #
      # @see Braintrust::Models::DatasetRetrieveParams
      def retrieve(dataset_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/dataset/%1$s", dataset_id],
          model: Braintrust::Models::Dataset,
          options: params[:request_options]
        )
      end

      # Partially update a dataset object. Specify the fields to update in the payload.
      # Any object-type fields will be deep-merged with existing content. Currently we
      # do not support removing fields or setting them to null.
      #
      # @overload update(dataset_id, description: nil, metadata: nil, name: nil, request_options: {})
      #
      # @param dataset_id [String]
      # @param description [String, nil]
      # @param metadata [Hash{Symbol=>Object, nil}, nil]
      # @param name [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Dataset]
      #
      # @see Braintrust::Models::DatasetUpdateParams
      def update(dataset_id, params = {})
        parsed, options = Braintrust::Models::DatasetUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/dataset/%1$s", dataset_id],
          body: parsed,
          model: Braintrust::Models::Dataset,
          options: options
        )
      end

      # List out all datasets. The datasets are sorted by creation date, with the most
      # recently-created datasets coming first
      #
      # @overload list(dataset_name: nil, ending_before: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, starting_after: nil, request_options: {})
      #
      # @param dataset_name [String]
      # @param ending_before [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param org_name [String]
      # @param project_id [String]
      # @param project_name [String]
      # @param starting_after [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::Dataset>]
      #
      # @see Braintrust::Models::DatasetListParams
      def list(params = {})
        parsed, options = Braintrust::Models::DatasetListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/dataset",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Models::Dataset,
          options: options
        )
      end

      # Delete a dataset object by its id
      #
      # @overload delete(dataset_id, request_options: {})
      #
      # @param dataset_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Dataset]
      #
      # @see Braintrust::Models::DatasetDeleteParams
      def delete(dataset_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/dataset/%1$s", dataset_id],
          model: Braintrust::Models::Dataset,
          options: params[:request_options]
        )
      end

      # Log feedback for a set of dataset events
      #
      # @overload feedback(dataset_id, feedback:, request_options: {})
      #
      # @param dataset_id [String]
      # @param feedback [Array<Braintrust::Models::FeedbackDatasetItem>]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::FeedbackResponseSchema]
      #
      # @see Braintrust::Models::DatasetFeedbackParams
      def feedback(dataset_id, params)
        parsed, options = Braintrust::Models::DatasetFeedbackParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/dataset/%1$s/feedback", dataset_id],
          body: parsed,
          model: Braintrust::Models::FeedbackResponseSchema,
          options: options
        )
      end

      # Fetch the events in a dataset. Equivalent to the POST form of the same path, but
      # with the parameters in the URL query rather than in the request body. For more
      # complex queries, use the `POST /btql` endpoint.
      #
      # @overload fetch(dataset_id, limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
      #
      # @param dataset_id [String]
      # @param limit [Integer, nil]
      # @param max_root_span_id [String]
      # @param max_xact_id [String]
      # @param version [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::FetchDatasetEventsResponse]
      #
      # @see Braintrust::Models::DatasetFetchParams
      def fetch(dataset_id, params = {})
        parsed, options = Braintrust::Models::DatasetFetchParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/dataset/%1$s/fetch", dataset_id],
          query: parsed,
          model: Braintrust::Models::FetchDatasetEventsResponse,
          options: options
        )
      end

      # Fetch the events in a dataset. Equivalent to the GET form of the same path, but
      # with the parameters in the request body rather than in the URL query. For more
      # complex queries, use the `POST /btql` endpoint.
      #
      # @overload fetch_post(dataset_id, cursor: nil, limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
      #
      # @param dataset_id [String]
      # @param cursor [String, nil]
      # @param limit [Integer, nil]
      # @param max_root_span_id [String, nil]
      # @param max_xact_id [String, nil]
      # @param version [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::FetchDatasetEventsResponse]
      #
      # @see Braintrust::Models::DatasetFetchPostParams
      def fetch_post(dataset_id, params = {})
        parsed, options = Braintrust::Models::DatasetFetchPostParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/dataset/%1$s/fetch", dataset_id],
          body: parsed,
          model: Braintrust::Models::FetchDatasetEventsResponse,
          options: options
        )
      end

      # Insert a set of events into the dataset
      #
      # @overload insert(dataset_id, events:, request_options: {})
      #
      # @param dataset_id [String]
      # @param events [Array<Braintrust::Models::InsertDatasetEvent>]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::InsertEventsResponse]
      #
      # @see Braintrust::Models::DatasetInsertParams
      def insert(dataset_id, params)
        parsed, options = Braintrust::Models::DatasetInsertParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/dataset/%1$s/insert", dataset_id],
          body: parsed,
          model: Braintrust::Models::InsertEventsResponse,
          options: options
        )
      end

      # Summarize dataset
      #
      # @overload summarize(dataset_id, summarize_data: nil, request_options: {})
      #
      # @param dataset_id [String]
      # @param summarize_data [Boolean, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::SummarizeDatasetResponse]
      #
      # @see Braintrust::Models::DatasetSummarizeParams
      def summarize(dataset_id, params = {})
        parsed, options = Braintrust::Models::DatasetSummarizeParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/dataset/%1$s/summarize", dataset_id],
          query: parsed,
          model: Braintrust::Models::SummarizeDatasetResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
