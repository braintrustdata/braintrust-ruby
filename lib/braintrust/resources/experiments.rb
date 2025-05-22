# frozen_string_literal: true

module Braintrust
  module Resources
    class Experiments
      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ExperimentCreateParams} for more details.
      #
      # Create a new experiment. If there is an existing experiment in the project with
      # the same name as the one specified in the request, will return the existing
      # experiment unmodified
      #
      # @overload create(project_id:, base_exp_id: nil, dataset_id: nil, dataset_version: nil, description: nil, ensure_new: nil, metadata: nil, name: nil, public: nil, repo_info: nil, request_options: {})
      #
      # @param project_id [String] Unique identifier for the project that the experiment belongs under
      #
      # @param base_exp_id [String, nil] Id of default base experiment to compare against when viewing this experiment
      #
      # @param dataset_id [String, nil] Identifier of the linked dataset, or null if the experiment is not linked to a d
      #
      # @param dataset_version [String, nil] Version number of the linked dataset the experiment was run against. This can be
      #
      # @param description [String, nil] Textual description of the experiment
      #
      # @param ensure_new [Boolean, nil] Normally, creating an experiment with the same name as an existing experiment wi
      #
      # @param metadata [Hash{Symbol=>Object, nil}, nil] User-controlled metadata about the experiment
      #
      # @param name [String, nil] Name of the experiment. Within a project, experiment names are unique
      #
      # @param public [Boolean, nil] Whether or not the experiment is public. Public experiments can be viewed by any
      #
      # @param repo_info [Braintrust::Models::RepoInfo, nil] Metadata about the state of the repo when the experiment was created
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Experiment]
      #
      # @see Braintrust::Models::ExperimentCreateParams
      def create(params)
        parsed, options = Braintrust::ExperimentCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/experiment",
          body: parsed,
          model: Braintrust::Experiment,
          options: options
        )
      end

      # Get an experiment object by its id
      #
      # @overload retrieve(experiment_id, request_options: {})
      #
      # @param experiment_id [String] Experiment id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Experiment]
      #
      # @see Braintrust::Models::ExperimentRetrieveParams
      def retrieve(experiment_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/experiment/%1$s", experiment_id],
          model: Braintrust::Experiment,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ExperimentUpdateParams} for more details.
      #
      # Partially update an experiment object. Specify the fields to update in the
      # payload. Any object-type fields will be deep-merged with existing content.
      # Currently we do not support removing fields or setting them to null.
      #
      # @overload update(experiment_id, base_exp_id: nil, dataset_id: nil, dataset_version: nil, description: nil, metadata: nil, name: nil, public: nil, repo_info: nil, request_options: {})
      #
      # @param experiment_id [String] Experiment id
      #
      # @param base_exp_id [String, nil] Id of default base experiment to compare against when viewing this experiment
      #
      # @param dataset_id [String, nil] Identifier of the linked dataset, or null if the experiment is not linked to a d
      #
      # @param dataset_version [String, nil] Version number of the linked dataset the experiment was run against. This can be
      #
      # @param description [String, nil] Textual description of the experiment
      #
      # @param metadata [Hash{Symbol=>Object, nil}, nil] User-controlled metadata about the experiment
      #
      # @param name [String, nil] Name of the experiment. Within a project, experiment names are unique
      #
      # @param public [Boolean, nil] Whether or not the experiment is public. Public experiments can be viewed by any
      #
      # @param repo_info [Braintrust::Models::RepoInfo, nil] Metadata about the state of the repo when the experiment was created
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Experiment]
      #
      # @see Braintrust::Models::ExperimentUpdateParams
      def update(experiment_id, params = {})
        parsed, options = Braintrust::ExperimentUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/experiment/%1$s", experiment_id],
          body: parsed,
          model: Braintrust::Experiment,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ExperimentListParams} for more details.
      #
      # List out all experiments. The experiments are sorted by creation date, with the
      # most recently-created experiments coming first
      #
      # @overload list(ending_before: nil, experiment_name: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String] Pagination cursor id.
      #
      # @param experiment_name [String] Name of the experiment to search for
      #
      # @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      #
      # @param limit [Integer, nil] Limit the number of objects to return
      #
      # @param org_name [String] Filter search results to within a particular organization
      #
      # @param project_id [String] Project id
      #
      # @param project_name [String] Name of the project to search for
      #
      # @param starting_after [String] Pagination cursor id.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::Experiment>]
      #
      # @see Braintrust::Models::ExperimentListParams
      def list(params = {})
        parsed, options = Braintrust::ExperimentListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/experiment",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Experiment,
          options: options
        )
      end

      # Delete an experiment object by its id
      #
      # @overload delete(experiment_id, request_options: {})
      #
      # @param experiment_id [String] Experiment id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Experiment]
      #
      # @see Braintrust::Models::ExperimentDeleteParams
      def delete(experiment_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/experiment/%1$s", experiment_id],
          model: Braintrust::Experiment,
          options: params[:request_options]
        )
      end

      # Log feedback for a set of experiment events
      #
      # @overload feedback(experiment_id, feedback:, request_options: {})
      #
      # @param experiment_id [String] Experiment id
      #
      # @param feedback [Array<Braintrust::Models::FeedbackExperimentItem>] A list of experiment feedback items
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::FeedbackResponseSchema]
      #
      # @see Braintrust::Models::ExperimentFeedbackParams
      def feedback(experiment_id, params)
        parsed, options = Braintrust::ExperimentFeedbackParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/experiment/%1$s/feedback", experiment_id],
          body: parsed,
          model: Braintrust::FeedbackResponseSchema,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ExperimentFetchParams} for more details.
      #
      # Fetch the events in an experiment. Equivalent to the POST form of the same path,
      # but with the parameters in the URL query rather than in the request body. For
      # more complex queries, use the `POST /btql` endpoint.
      #
      # @overload fetch(experiment_id, limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
      #
      # @param experiment_id [String] Experiment id
      #
      # @param limit [Integer, nil] limit the number of traces fetched
      #
      # @param max_root_span_id [String] DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #
      # @param max_xact_id [String] DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #
      # @param version [String] Retrieve a snapshot of events from a past time
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::FetchExperimentEventsResponse]
      #
      # @see Braintrust::Models::ExperimentFetchParams
      def fetch(experiment_id, params = {})
        parsed, options = Braintrust::ExperimentFetchParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/experiment/%1$s/fetch", experiment_id],
          query: parsed,
          model: Braintrust::FetchExperimentEventsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ExperimentFetchPostParams} for more details.
      #
      # Fetch the events in an experiment. Equivalent to the GET form of the same path,
      # but with the parameters in the request body rather than in the URL query. For
      # more complex queries, use the `POST /btql` endpoint.
      #
      # @overload fetch_post(experiment_id, cursor: nil, limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
      #
      # @param experiment_id [String] Experiment id
      #
      # @param cursor [String, nil] An opaque string to be used as a cursor for the next page of results, in order f
      #
      # @param limit [Integer, nil] limit the number of traces fetched
      #
      # @param max_root_span_id [String, nil] DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #
      # @param max_xact_id [String, nil] DEPRECATION NOTICE: The manually-constructed pagination cursor is deprecated in
      #
      # @param version [String, nil] Retrieve a snapshot of events from a past time
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::FetchExperimentEventsResponse]
      #
      # @see Braintrust::Models::ExperimentFetchPostParams
      def fetch_post(experiment_id, params = {})
        parsed, options = Braintrust::ExperimentFetchPostParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/experiment/%1$s/fetch", experiment_id],
          body: parsed,
          model: Braintrust::FetchExperimentEventsResponse,
          options: options
        )
      end

      # Insert a set of events into the experiment
      #
      # @overload insert(experiment_id, events:, request_options: {})
      #
      # @param experiment_id [String] Experiment id
      #
      # @param events [Array<Braintrust::Models::InsertExperimentEvent>] A list of experiment events to insert
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::InsertEventsResponse]
      #
      # @see Braintrust::Models::ExperimentInsertParams
      def insert(experiment_id, params)
        parsed, options = Braintrust::ExperimentInsertParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/experiment/%1$s/insert", experiment_id],
          body: parsed,
          model: Braintrust::InsertEventsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ExperimentSummarizeParams} for more details.
      #
      # Summarize experiment
      #
      # @overload summarize(experiment_id, comparison_experiment_id: nil, summarize_scores: nil, request_options: {})
      #
      # @param experiment_id [String] Experiment id
      #
      # @param comparison_experiment_id [String] The experiment to compare against, if summarizing scores and metrics. If omitted
      #
      # @param summarize_scores [Boolean, nil] Whether to summarize the scores and metrics. If false (or omitted), only the met
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::SummarizeExperimentResponse]
      #
      # @see Braintrust::Models::ExperimentSummarizeParams
      def summarize(experiment_id, params = {})
        parsed, options = Braintrust::ExperimentSummarizeParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/experiment/%1$s/summarize", experiment_id],
          query: parsed,
          model: Braintrust::SummarizeExperimentResponse,
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
