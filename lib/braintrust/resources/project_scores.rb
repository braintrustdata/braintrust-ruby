# frozen_string_literal: true

module Braintrust
  module Resources
    class ProjectScores
      # Create a new project_score. If there is an existing project_score in the project
      #   with the same name as the one specified in the request, will return the existing
      #   project_score unmodified
      #
      # @param params [Braintrust::Models::ProjectScoreCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the project score
      #
      #   @option params [String] :project_id Unique identifier for the project that the project score belongs under
      #
      #   @option params [Symbol, Braintrust::Models::ProjectScoreCreateParams::ScoreType] :score_type The type of the configured score
      #
      #   @option params [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScoreCreateParams::Categories::NullableVariant, nil] :categories For categorical-type project scores, the list of all categories
      #
      #   @option params [Braintrust::Models::ProjectScoreConfig, nil] :config
      #
      #   @option params [String, nil] :description Textual description of the project score
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ProjectScore]
      #
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
      # @param project_score_id [String] ProjectScore id
      #
      # @param params [Braintrust::Models::ProjectScoreRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      def retrieve(project_score_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/project_score/%0s", project_score_id],
          model: Braintrust::Models::ProjectScore,
          options: params[:request_options]
        )
      end

      # Partially update a project_score object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @param project_score_id [String] ProjectScore id
      #
      # @param params [Braintrust::Models::ProjectScoreUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScoreUpdateParams::Categories::NullableVariant, nil] :categories For categorical-type project scores, the list of all categories
      #
      #   @option params [Braintrust::Models::ProjectScoreConfig, nil] :config
      #
      #   @option params [String, nil] :description Textual description of the project score
      #
      #   @option params [String, nil] :name Name of the project score
      #
      #   @option params [Symbol, Braintrust::Models::ProjectScoreUpdateParams::ScoreType, nil] :score_type The type of the configured score
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      def update(project_score_id, params = {})
        parsed, options = Braintrust::Models::ProjectScoreUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/project_score/%0s", project_score_id],
          body: parsed,
          model: Braintrust::Models::ProjectScore,
          options: options
        )
      end

      # List out all project_scores. The project_scores are sorted by creation date,
      #   with the most recently-created project_scores coming first
      #
      # @param params [Braintrust::Models::ProjectScoreListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #
      #   @option params [String, Array<String>] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #
      #   @option params [String] :org_name Filter search results to within a particular organization
      #
      #   @option params [String] :project_id Project id
      #
      #   @option params [String] :project_name Name of the project to search for
      #
      #   @option params [String] :project_score_name Name of the project_score to search for
      #
      #   @option params [Symbol, Braintrust::Models::ProjectScoreListParams::ScoreType::ProjectScoreType, Array<Symbol, Braintrust::Models::ProjectScoreListParams::ScoreType::UnionMember1>] :score_type The type of the configured score
      #
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::ProjectScore>]
      #
      def list(params = {})
        parsed, options = Braintrust::Models::ProjectScoreListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/project_score",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::ProjectScore,
          options: options
        )
      end

      # Delete a project_score object by its id
      #
      # @param project_score_id [String] ProjectScore id
      #
      # @param params [Braintrust::Models::ProjectScoreDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ProjectScore]
      #
      def delete(project_score_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/project_score/%0s", project_score_id],
          model: Braintrust::Models::ProjectScore,
          options: params[:request_options]
        )
      end

      # Create or replace project_score. If there is an existing project_score in the
      #   project with the same name as the one specified in the request, will replace the
      #   existing project_score with the provided fields
      #
      # @param params [Braintrust::Models::ProjectScoreReplaceParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the project score
      #
      #   @option params [String] :project_id Unique identifier for the project that the project score belongs under
      #
      #   @option params [Symbol, Braintrust::Models::ProjectScoreReplaceParams::ScoreType] :score_type The type of the configured score
      #
      #   @option params [Array<Braintrust::Models::ProjectScoreCategory>, Hash{Symbol=>Float}, Array<String>, Braintrust::Models::ProjectScoreReplaceParams::Categories::NullableVariant, nil] :categories For categorical-type project scores, the list of all categories
      #
      #   @option params [Braintrust::Models::ProjectScoreConfig, nil] :config
      #
      #   @option params [String, nil] :description Textual description of the project score
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ProjectScore]
      #
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

      # @param client [Braintrust::Client]
      #
      def initialize(client:)
        @client = client
      end
    end
  end
end
