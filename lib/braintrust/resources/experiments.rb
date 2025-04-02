# frozen_string_literal: true

module Braintrust
  module Resources
    class Experiments
      # Create a new experiment. If there is an existing experiment in the project with
      #   the same name as the one specified in the request, will return the existing
      #   experiment unmodified
      #
      # @overload create(project_id:, base_exp_id: nil, dataset_id: nil, dataset_version: nil, description: nil, ensure_new: nil, metadata: nil, name: nil, public: nil, repo_info: nil, request_options: {})
      #
      # @param project_id [String]
      # @param base_exp_id [String, nil]
      # @param dataset_id [String, nil]
      # @param dataset_version [String, nil]
      # @param description [String, nil]
      # @param ensure_new [Boolean, nil]
      # @param metadata [Hash{Symbol=>Object, nil}, nil]
      # @param name [String, nil]
      # @param public [Boolean, nil]
      # @param repo_info [Braintrust::Models::RepoInfo, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Experiment]
      #
      # @see Braintrust::Models::ExperimentCreateParams
      def create(params)
        parsed, options = Braintrust::Models::ExperimentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/experiment",
          body: parsed,
          model: Braintrust::Models::Experiment,
          options: options
        )
      end

      # Get an experiment object by its id
      #
      # @overload retrieve(experiment_id, request_options: {})
      #
      # @param experiment_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Experiment]
      #
      # @see Braintrust::Models::ExperimentRetrieveParams
      def retrieve(experiment_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/experiment/%1$s", experiment_id],
          model: Braintrust::Models::Experiment,
          options: params[:request_options]
        )
      end

      # Partially update an experiment object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @overload update(experiment_id, base_exp_id: nil, dataset_id: nil, dataset_version: nil, description: nil, metadata: nil, name: nil, public: nil, repo_info: nil, request_options: {})
      #
      # @param experiment_id [String]
      # @param base_exp_id [String, nil]
      # @param dataset_id [String, nil]
      # @param dataset_version [String, nil]
      # @param description [String, nil]
      # @param metadata [Hash{Symbol=>Object, nil}, nil]
      # @param name [String, nil]
      # @param public [Boolean, nil]
      # @param repo_info [Braintrust::Models::RepoInfo, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Experiment]
      #
      # @see Braintrust::Models::ExperimentUpdateParams
      def update(experiment_id, params = {})
        parsed, options = Braintrust::Models::ExperimentUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/experiment/%1$s", experiment_id],
          body: parsed,
          model: Braintrust::Models::Experiment,
          options: options
        )
      end

      # List out all experiments. The experiments are sorted by creation date, with the
      #   most recently-created experiments coming first
      #
      # @overload list(ending_before: nil, experiment_name: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String]
      # @param experiment_name [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param org_name [String]
      # @param project_id [String]
      # @param project_name [String]
      # @param starting_after [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Experiment>]
      #
      # @see Braintrust::Models::ExperimentListParams
      def list(params = {})
        parsed, options = Braintrust::Models::ExperimentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/experiment",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Experiment,
          options: options
        )
      end

      # Delete an experiment object by its id
      #
      # @overload delete(experiment_id, request_options: {})
      #
      # @param experiment_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Experiment]
      #
      # @see Braintrust::Models::ExperimentDeleteParams
      def delete(experiment_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/experiment/%1$s", experiment_id],
          model: Braintrust::Models::Experiment,
          options: params[:request_options]
        )
      end

      # Log feedback for a set of experiment events
      #
      # @overload feedback(experiment_id, feedback:, request_options: {})
      #
      # @param experiment_id [String]
      # @param feedback [Array<Braintrust::Models::FeedbackExperimentItem>]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::FeedbackResponseSchema]
      #
      # @see Braintrust::Models::ExperimentFeedbackParams
      def feedback(experiment_id, params)
        parsed, options = Braintrust::Models::ExperimentFeedbackParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/experiment/%1$s/feedback", experiment_id],
          body: parsed,
          model: Braintrust::Models::FeedbackResponseSchema,
          options: options
        )
      end

      # Fetch the events in an experiment. Equivalent to the POST form of the same path,
      #   but with the parameters in the URL query rather than in the request body. For
      #   more complex queries, use the `POST /btql` endpoint.
      #
      # @overload fetch(experiment_id, limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
      #
      # @param experiment_id [String]
      # @param limit [Integer, nil]
      # @param max_root_span_id [String]
      # @param max_xact_id [String]
      # @param version [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::FetchExperimentEventsResponse]
      #
      # @see Braintrust::Models::ExperimentFetchParams
      def fetch(experiment_id, params = {})
        parsed, options = Braintrust::Models::ExperimentFetchParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/experiment/%1$s/fetch", experiment_id],
          query: parsed,
          model: Braintrust::Models::FetchExperimentEventsResponse,
          options: options
        )
      end

      # Fetch the events in an experiment. Equivalent to the GET form of the same path,
      #   but with the parameters in the request body rather than in the URL query. For
      #   more complex queries, use the `POST /btql` endpoint.
      #
      # @overload fetch_post(experiment_id, cursor: nil, limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
      #
      # @param experiment_id [String]
      # @param cursor [String, nil]
      # @param limit [Integer, nil]
      # @param max_root_span_id [String, nil]
      # @param max_xact_id [String, nil]
      # @param version [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::FetchExperimentEventsResponse]
      #
      # @see Braintrust::Models::ExperimentFetchPostParams
      def fetch_post(experiment_id, params = {})
        parsed, options = Braintrust::Models::ExperimentFetchPostParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/experiment/%1$s/fetch", experiment_id],
          body: parsed,
          model: Braintrust::Models::FetchExperimentEventsResponse,
          options: options
        )
      end

      # Insert a set of events into the experiment
      #
      # @overload insert(experiment_id, events:, request_options: {})
      #
      # @param experiment_id [String]
      # @param events [Array<Braintrust::Models::InsertExperimentEvent>]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::InsertEventsResponse]
      #
      # @see Braintrust::Models::ExperimentInsertParams
      def insert(experiment_id, params)
        parsed, options = Braintrust::Models::ExperimentInsertParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/experiment/%1$s/insert", experiment_id],
          body: parsed,
          model: Braintrust::Models::InsertEventsResponse,
          options: options
        )
      end

      # Summarize experiment
      #
      # @overload summarize(experiment_id, comparison_experiment_id: nil, summarize_scores: nil, request_options: {})
      #
      # @param experiment_id [String]
      # @param comparison_experiment_id [String]
      # @param summarize_scores [Boolean, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::SummarizeExperimentResponse]
      #
      # @see Braintrust::Models::ExperimentSummarizeParams
      def summarize(experiment_id, params = {})
        parsed, options = Braintrust::Models::ExperimentSummarizeParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/experiment/%1$s/summarize", experiment_id],
          query: parsed,
          model: Braintrust::Models::SummarizeExperimentResponse,
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
