# frozen_string_literal: true

module Braintrust
  module Resources
    class ProjectScores
      def initialize(client:)
        @client = client
      end

      # Create a new project_score. If there is an existing project_score in the project
      #   with the same name as the one specified in the request, will return the existing
      #   project_score unmodified
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the project score
      # @option params [String] :project_id Unique identifier for the project that the project score belongs under
      # @option params [Symbol] :score_type The type of the configured score
      # @option params [Array<Categories::UnnamedTypeWithunionParent19>|Array<String>|Categories::UnnamedTypeWithunionParent20|Hash] :categories For categorical-type project scores, the list of all categories
      # @option params [String] :description Textual description of the project score
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ProjectScore]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/project_score"
        req[:body] = params
        req[:model] = Braintrust::Models::ProjectScore
        @client.request(req, opts)
      end

      # Get a project_score object by its id
      # 
      # @param project_score_id [String] ProjectScore id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ProjectScore]
      def retrieve(project_score_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/project_score/#{project_score_id}"
        req[:model] = Braintrust::Models::ProjectScore
        @client.request(req, opts)
      end

      # Partially update a project_score object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      # 
      # @param project_score_id [String] ProjectScore id
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [Array<Categories::UnnamedTypeWithunionParent21>|Array<String>|Categories::UnnamedTypeWithunionParent22|Hash] :categories For categorical-type project scores, the list of all categories
      # @option params [String] :description Textual description of the project score
      # @option params [String] :name Name of the project score
      # @option params [Symbol] :score_type The type of the configured score
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ProjectScore]
      def update(project_score_id, params = {}, opts = {})
        req = {}
        req[:method] = :patch
        req[:path] = "/v1/project_score/#{project_score_id}"
        req[:body] = params
        req[:model] = Braintrust::Models::ProjectScore
        @client.request(req, opts)
      end

      # List out all project_scores. The project_scores are sorted by creation date,
      #   with the most recently-created project_scores coming first
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :ending_before Pagination cursor id.
      # 
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      # @option params [Array<String>|String] :ids Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      # @option params [Integer] :limit Limit the number of objects to return
      # @option params [String] :org_name Filter search results to within a particular organization
      # @option params [String] :project_name Name of the project to search for
      # @option params [String] :project_score_name Name of the project_score to search for
      # @option params [String] :starting_after Pagination cursor id.
      # 
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::ListObjects<Braintrust::Models::ProjectScore>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/project_score"
        req[:query] = params
        req[:page] = Braintrust::ListObjects
        req[:model] = Braintrust::Models::ProjectScore
        @client.request(req, opts)
      end

      # Delete a project_score object by its id
      # 
      # @param project_score_id [String] ProjectScore id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ProjectScore]
      def delete(project_score_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/project_score/#{project_score_id}"
        req[:model] = Braintrust::Models::ProjectScore
        @client.request(req, opts)
      end

      # Create or replace project_score. If there is an existing project_score in the
      #   project with the same name as the one specified in the request, will replace the
      #   existing project_score with the provided fields
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the project score
      # @option params [String] :project_id Unique identifier for the project that the project score belongs under
      # @option params [Symbol] :score_type The type of the configured score
      # @option params [Array<Categories::UnnamedTypeWithunionParent23>|Array<String>|Categories::UnnamedTypeWithunionParent24|Hash] :categories For categorical-type project scores, the list of all categories
      # @option params [String] :description Textual description of the project score
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ProjectScore]
      def replace(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/v1/project_score"
        req[:body] = params
        req[:model] = Braintrust::Models::ProjectScore
        @client.request(req, opts)
      end
    end
  end
end
