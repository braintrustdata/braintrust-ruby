# typed: strong

module Braintrust
  module Resources
    class Projects
      class Logs
        # Log feedback for a set of project logs events
        sig do
          params(
            project_id: String,
            feedback: T::Array[Braintrust::Models::FeedbackProjectLogsItem],
            request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Braintrust::Models::FeedbackResponseSchema)
        end
        def feedback(project_id, feedback:, request_options: {})
        end

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
            request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Braintrust::Models::FetchProjectLogsEventsResponse)
        end
        def fetch(
          project_id,
          limit: nil,
          max_root_span_id: nil,
          max_xact_id: nil,
          version: nil,
          request_options: {}
        )
        end

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
            request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Braintrust::Models::FetchProjectLogsEventsResponse)
        end
        def fetch_post(
          project_id,
          cursor: nil,
          limit: nil,
          max_root_span_id: nil,
          max_xact_id: nil,
          version: nil,
          request_options: {}
        )
        end

        # Insert a set of events into the project logs
        sig do
          params(
            project_id: String,
            events: T::Array[Braintrust::Models::InsertProjectLogsEvent],
            request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Braintrust::Models::InsertEventsResponse)
        end
        def insert(project_id, events:, request_options: {})
        end

        sig { params(client: Braintrust::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
