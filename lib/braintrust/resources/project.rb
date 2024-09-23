# frozen_string_literal: true

module Braintrust
  module Resources
    class Project
      # @return [Braintrust::Resources::Project::Logs]
      attr_reader :logs

      def initialize(client:)
        @client = client
        @logs = Braintrust::Resources::Project::Logs.new(client: client)
      end

      # Create a new project. If there is an existing project with the same name as the
      #   one specified in the request, will return the existing project unmodified
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the project
      # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the project belongs in.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ProjectModel]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/project"
        req[:body] = params
        req[:model] = Braintrust::Models::ProjectModel
        @client.request(req, opts)
      end

      # Get a project object by its id
      # 
      # @param project_id [String] Project id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ProjectModel]
      def retrieve(project_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/project/#{project_id}"
        req[:model] = Braintrust::Models::ProjectModel
        @client.request(req, opts)
      end

      # Partially update a project object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      # 
      # @param project_id [String] Project id
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the project
      # @option params [Settings] :settings Project settings. Patch operations replace all settings, so make sure you
      #   include all settings you want to keep.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ProjectModel]
      def update(project_id, params = {}, opts = {})
        req = {}
        req[:method] = :patch
        req[:path] = "/v1/project/#{project_id}"
        req[:body] = params
        req[:model] = Braintrust::Models::ProjectModel
        @client.request(req, opts)
      end

      # List out all projects. The projects are sorted by creation date, with the most
      #   recently-created projects coming first
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
      # @option params [String] :starting_after Pagination cursor id.
      # 
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::ListObjects<Braintrust::Models::ProjectModel>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/project"
        req[:query] = params
        req[:page] = Braintrust::ListObjects
        req[:model] = Braintrust::Models::ProjectModel
        @client.request(req, opts)
      end

      # Delete a project object by its id
      # 
      # @param project_id [String] Project id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ProjectModel]
      def delete(project_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/project/#{project_id}"
        req[:model] = Braintrust::Models::ProjectModel
        @client.request(req, opts)
      end
    end
  end
end
