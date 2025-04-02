# frozen_string_literal: true

module Braintrust
  module Resources
    class Projects
      # @return [Braintrust::Resources::Projects::Logs]
      attr_reader :logs

      # Create a new project. If there is an existing project with the same name as the
      #   one specified in the request, will return the existing project unmodified
      #
      # @param params [Braintrust::Models::ProjectCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the project
      #
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the project belongs in.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Project]
      #
      # @see Braintrust::Models::ProjectCreateParams
      def create(params)
        parsed, options = Braintrust::Models::ProjectCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/project",
          body: parsed,
          model: Braintrust::Models::Project,
          options: options
        )
      end

      # Get a project object by its id
      #
      # @param project_id [String] Project id
      #
      # @param params [Braintrust::Models::ProjectRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Project]
      #
      # @see Braintrust::Models::ProjectRetrieveParams
      def retrieve(project_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/project/%1$s", project_id],
          model: Braintrust::Models::Project,
          options: params[:request_options]
        )
      end

      # Partially update a project object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param project_id [String] Project id
      #
      # @param params [Braintrust::Models::ProjectUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String, nil] :name Name of the project
      #
      #   @option params [Braintrust::Models::ProjectSettings, nil] :settings Project settings. Patch operations replace all settings, so make sure you
      #     include all settings you want to keep.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Project]
      #
      # @see Braintrust::Models::ProjectUpdateParams
      def update(project_id, params = {})
        parsed, options = Braintrust::Models::ProjectUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/project/%1$s", project_id],
          body: parsed,
          model: Braintrust::Models::Project,
          options: options
        )
      end

      # List out all projects. The projects are sorted by creation date, with the most
      #   recently-created projects coming first
      #
      # @param params [Braintrust::Models::ProjectListParams, Hash{Symbol=>Object}] .
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
      #   @option params [String] :project_name Name of the project to search for
      #
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Project>]
      #
      # @see Braintrust::Models::ProjectListParams
      def list(params = {})
        parsed, options = Braintrust::Models::ProjectListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/project",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Project,
          options: options
        )
      end

      # Delete a project object by its id
      #
      # @param project_id [String] Project id
      #
      # @param params [Braintrust::Models::ProjectDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Project]
      #
      # @see Braintrust::Models::ProjectDeleteParams
      def delete(project_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/project/%1$s", project_id],
          model: Braintrust::Models::Project,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
        @logs = Braintrust::Resources::Projects::Logs.new(client: client)
      end
    end
  end
end
