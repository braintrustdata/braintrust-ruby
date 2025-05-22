# frozen_string_literal: true

module Braintrust
  module Resources
    class ProjectScores
      # Create a new project_score. If there is an existing project_score in the project
      # with the same name as the one specified in the request, will return the existing
      # project_score unmodified
      #
      # @overload create(name:, project_id:, score_type:, categories: nil, config: nil, description: nil, request_options: {})
      #
      # @param name [String] Name of the project score
      #
      # @param project_id [String] Unique identifier for the project that the project score belongs under
      #
      # @param score_type [Symbol, Braintrust::Models::ProjectScoreType] The type of the configured score
      #
      # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil] For categorical-type project scores, the list of all categories
      #
      # @param config [Braintrust::Models::ProjectScoreConfig, nil]
      #
      # @param description [String, nil] Textual description of the project score
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      # @see Braintrust::Models::ProjectScoreCreateParams
      def create(params)
        parsed, options = Braintrust::ProjectScoreCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/project_score",
          body: parsed,
          model: Braintrust::ProjectScore,
          options: options
        )
      end

      # Get a project_score object by its id
      #
      # @overload retrieve(project_score_id, request_options: {})
      #
      # @param project_score_id [String] ProjectScore id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      # @see Braintrust::Models::ProjectScoreRetrieveParams
      def retrieve(project_score_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/project_score/%1$s", project_score_id],
          model: Braintrust::ProjectScore,
          options: params[:request_options]
        )
      end

      # Partially update a project_score object. Specify the fields to update in the
      # payload. Any object-type fields will be deep-merged with existing content.
      # Currently we do not support removing fields or setting them to null.
      #
      # @overload update(project_score_id, categories: nil, config: nil, description: nil, name: nil, score_type: nil, request_options: {})
      #
      # @param project_score_id [String] ProjectScore id
      #
      # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil] For categorical-type project scores, the list of all categories
      #
      # @param config [Braintrust::Models::ProjectScoreConfig, nil]
      #
      # @param description [String, nil] Textual description of the project score
      #
      # @param name [String, nil] Name of the project score
      #
      # @param score_type [Symbol, Braintrust::Models::ProjectScoreType, nil] The type of the configured score
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      # @see Braintrust::Models::ProjectScoreUpdateParams
      def update(project_score_id, params = {})
        parsed, options = Braintrust::ProjectScoreUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/project_score/%1$s", project_score_id],
          body: parsed,
          model: Braintrust::ProjectScore,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ProjectScoreListParams} for more details.
      #
      # List out all project_scores. The project_scores are sorted by creation date,
      # with the most recently-created project_scores coming first
      #
      # @overload list(ending_before: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, project_score_name: nil, score_type: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String] Pagination cursor id.
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
      # @param project_score_name [String] Name of the project_score to search for
      #
      # @param score_type [Symbol, Braintrust::Models::ProjectScoreType, Array<Symbol, Braintrust::Models::ProjectScoreType>] The type of the configured score
      #
      # @param starting_after [String] Pagination cursor id.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::ProjectScore>]
      #
      # @see Braintrust::Models::ProjectScoreListParams
      def list(params = {})
        parsed, options = Braintrust::ProjectScoreListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/project_score",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::ProjectScore,
          options: options
        )
      end

      # Delete a project_score object by its id
      #
      # @overload delete(project_score_id, request_options: {})
      #
      # @param project_score_id [String] ProjectScore id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      # @see Braintrust::Models::ProjectScoreDeleteParams
      def delete(project_score_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/project_score/%1$s", project_score_id],
          model: Braintrust::ProjectScore,
          options: params[:request_options]
        )
      end

      # Create or replace project_score. If there is an existing project_score in the
      # project with the same name as the one specified in the request, will replace the
      # existing project_score with the provided fields
      #
      # @overload replace(name:, project_id:, score_type:, categories: nil, config: nil, description: nil, request_options: {})
      #
      # @param name [String] Name of the project score
      #
      # @param project_id [String] Unique identifier for the project that the project score belongs under
      #
      # @param score_type [Symbol, Braintrust::Models::ProjectScoreType] The type of the configured score
      #
      # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil] For categorical-type project scores, the list of all categories
      #
      # @param config [Braintrust::Models::ProjectScoreConfig, nil]
      #
      # @param description [String, nil] Textual description of the project score
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      # @see Braintrust::Models::ProjectScoreReplaceParams
      def replace(params)
        parsed, options = Braintrust::ProjectScoreReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/project_score",
          body: parsed,
          model: Braintrust::ProjectScore,
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
