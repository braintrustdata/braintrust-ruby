# typed: strong

module Braintrust
  module Resources
    class Datasets
      # Create a new dataset. If there is an existing dataset in the project with the
      #   same name as the one specified in the request, will return the existing dataset
      #   unmodified
      sig do
        params(
          name: String,
          project_id: String,
          description: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Dataset)
      end
      def create(name:, project_id:, description: nil, metadata: nil, request_options: {})
      end

      # Get a dataset object by its id
      sig do
        params(
          dataset_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Dataset)
      end
      def retrieve(dataset_id, request_options: {})
      end

      # Partially update a dataset object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      sig do
        params(
          dataset_id: String,
          description: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Dataset)
      end
      def update(dataset_id, description: nil, metadata: nil, name: nil, request_options: {})
      end

      # List out all datasets. The datasets are sorted by creation date, with the most
      #   recently-created datasets coming first
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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::Dataset])
      end
      def list(
        dataset_name: nil,
        ending_before: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        project_id: nil,
        project_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      # Delete a dataset object by its id
      sig do
        params(
          dataset_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Dataset)
      end
      def delete(dataset_id, request_options: {})
      end

      # Log feedback for a set of dataset events
      sig do
        params(
          dataset_id: String,
          feedback: T::Array[Braintrust::Models::FeedbackDatasetItem],
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::FeedbackResponseSchema)
      end
      def feedback(dataset_id, feedback:, request_options: {})
      end

      # Fetch the events in a dataset. Equivalent to the POST form of the same path, but
      #   with the parameters in the URL query rather than in the request body. For more
      #   complex queries, use the `POST /btql` endpoint.
      sig do
        params(
          dataset_id: String,
          limit: T.nilable(Integer),
          max_root_span_id: String,
          max_xact_id: String,
          version: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::FetchDatasetEventsResponse)
      end
      def fetch(
        dataset_id,
        limit: nil,
        max_root_span_id: nil,
        max_xact_id: nil,
        version: nil,
        request_options: {}
      )
      end

      # Fetch the events in a dataset. Equivalent to the GET form of the same path, but
      #   with the parameters in the request body rather than in the URL query. For more
      #   complex queries, use the `POST /btql` endpoint.
      sig do
        params(
          dataset_id: String,
          cursor: T.nilable(String),
          limit: T.nilable(Integer),
          max_root_span_id: T.nilable(String),
          max_xact_id: T.nilable(String),
          version: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::FetchDatasetEventsResponse)
      end
      def fetch_post(
        dataset_id,
        cursor: nil,
        limit: nil,
        max_root_span_id: nil,
        max_xact_id: nil,
        version: nil,
        request_options: {}
      )
      end

      # Insert a set of events into the dataset
      sig do
        params(
          dataset_id: String,
          events: T::Array[Braintrust::Models::InsertDatasetEvent],
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::InsertEventsResponse)
      end
      def insert(dataset_id, events:, request_options: {})
      end

      # Summarize dataset
      sig do
        params(
          dataset_id: String,
          summarize_data: T.nilable(T::Boolean),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::SummarizeDatasetResponse)
      end
      def summarize(dataset_id, summarize_data: nil, request_options: {})
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
