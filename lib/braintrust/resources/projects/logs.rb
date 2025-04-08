# frozen_string_literal: true

module Braintrust
  module Resources
    class Projects
      class Logs
        # Log feedback for a set of project logs events
        #
        # @overload feedback(project_id, feedback:, request_options: {})
        #
        # @param project_id [String]
        # @param feedback [Array<Braintrust::Models::FeedbackProjectLogsItem>]
        # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Braintrust::Models::FeedbackResponseSchema]
        #
        # @see Braintrust::Models::Projects::LogFeedbackParams
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
        # path, but with the parameters in the URL query rather than in the request body.
        # For more complex queries, use the `POST /btql` endpoint.
        #
        # @overload fetch(project_id, limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
        #
        # @param project_id [String]
        # @param limit [Integer, nil]
        # @param max_root_span_id [String]
        # @param max_xact_id [String]
        # @param version [String]
        # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Braintrust::Models::FetchProjectLogsEventsResponse]
        #
        # @see Braintrust::Models::Projects::LogFetchParams
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
        # but with the parameters in the request body rather than in the URL query. For
        # more complex queries, use the `POST /btql` endpoint.
        #
        # @overload fetch_post(project_id, cursor: nil, limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
        #
        # @param project_id [String]
        # @param cursor [String, nil]
        # @param limit [Integer, nil]
        # @param max_root_span_id [String, nil]
        # @param max_xact_id [String, nil]
        # @param version [String, nil]
        # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Braintrust::Models::FetchProjectLogsEventsResponse]
        #
        # @see Braintrust::Models::Projects::LogFetchPostParams
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
        # @overload insert(project_id, events:, request_options: {})
        #
        # @param project_id [String]
        # @param events [Array<Braintrust::Models::InsertProjectLogsEvent>]
        # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Braintrust::Models::InsertEventsResponse]
        #
        # @see Braintrust::Models::Projects::LogInsertParams
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

        # @api private
        #
        # @param client [Braintrust::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
