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
      # @param name [String]
      # @param project_id [String]
      # @param score_type [Symbol, Braintrust::Models::ProjectScoreType]
      # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      # @param config [Braintrust::Models::ProjectScoreConfig, nil]
      # @param description [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      # @see Braintrust::Models::ProjectScoreCreateParams
      def create(params)
        parsed, options = Braintrust::Models::ProjectScoreCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/project_score",
          body: parsed,
          model: Braintrust::Models::ProjectScore,
          options: options
        )
      end

      # Get a project_score object by its id
      #
      # @overload retrieve(project_score_id, request_options: {})
      #
      # @param project_score_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      # @see Braintrust::Models::ProjectScoreRetrieveParams
      def retrieve(project_score_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/project_score/%1$s", project_score_id],
          model: Braintrust::Models::ProjectScore,
          options: params[:request_options]
        )
      end

      # Partially update a project_score object. Specify the fields to update in the
      # payload. Any object-type fields will be deep-merged with existing content.
      # Currently we do not support removing fields or setting them to null.
      #
      # @overload update(project_score_id, categories: nil, config: nil, description: nil, name: nil, score_type: nil, request_options: {})
      #
      # @param project_score_id [String]
      # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      # @param config [Braintrust::Models::ProjectScoreConfig, nil]
      # @param description [String, nil]
      # @param name [String, nil]
      # @param score_type [Symbol, Braintrust::Models::ProjectScoreType, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      # @see Braintrust::Models::ProjectScoreUpdateParams
      def update(project_score_id, params = {})
        parsed, options = Braintrust::Models::ProjectScoreUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/project_score/%1$s", project_score_id],
          body: parsed,
          model: Braintrust::Models::ProjectScore,
          options: options
        )
      end

      # List out all project_scores. The project_scores are sorted by creation date,
      # with the most recently-created project_scores coming first
      #
      # @overload list(ending_before: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, project_score_name: nil, score_type: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param org_name [String]
      # @param project_id [String]
      # @param project_name [String]
      # @param project_score_name [String]
      # @param score_type [Symbol, Braintrust::Models::ProjectScoreType, Array<Symbol, Braintrust::Models::ProjectScoreType>]
      # @param starting_after [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::ProjectScore>]
      #
      # @see Braintrust::Models::ProjectScoreListParams
      def list(params = {})
        parsed, options = Braintrust::Models::ProjectScoreListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/project_score",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Models::ProjectScore,
          options: options
        )
      end

      # Delete a project_score object by its id
      #
      # @overload delete(project_score_id, request_options: {})
      #
      # @param project_score_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      # @see Braintrust::Models::ProjectScoreDeleteParams
      def delete(project_score_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/project_score/%1$s", project_score_id],
          model: Braintrust::Models::ProjectScore,
          options: params[:request_options]
        )
      end

      # Create or replace project_score. If there is an existing project_score in the
      # project with the same name as the one specified in the request, will replace the
      # existing project_score with the provided fields
      #
      # @overload replace(name:, project_id:, score_type:, categories: nil, config: nil, description: nil, request_options: {})
      #
      # @param name [String]
      # @param project_id [String]
      # @param score_type [Symbol, Braintrust::Models::ProjectScoreType]
      # @param categories [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, nil]
      # @param config [Braintrust::Models::ProjectScoreConfig, nil]
      # @param description [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      # @see Braintrust::Models::ProjectScoreReplaceParams
      def replace(params)
        parsed, options = Braintrust::Models::ProjectScoreReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/project_score",
          body: parsed,
          model: Braintrust::Models::ProjectScore,
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
