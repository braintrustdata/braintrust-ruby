# frozen_string_literal: true

module Braintrust
  module Resources
    class Projects
      # @return [Braintrust::Resources::Projects::Logs]
      attr_reader :logs

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ProjectCreateParams} for more details.
      #
      # Create a new project. If there is an existing project with the same name as the
      # one specified in the request, will return the existing project unmodified
      #
      # @overload create(name:, org_name: nil, request_options: {})
      #
      # @param name [String] Name of the project
      #
      # @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
      # ...
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload retrieve(project_id, request_options: {})
      #
      # @param project_id [String] Project id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ProjectUpdateParams} for more details.
      #
      # Partially update a project object. Specify the fields to update in the payload.
      # Any object-type fields will be deep-merged with existing content. Currently we
      # do not support removing fields or setting them to null.
      #
      # @overload update(project_id, name: nil, settings: nil, request_options: {})
      #
      # @param project_id [String] Project id
      #
      # @param name [String, nil] Name of the project
      #
      # @param settings [Braintrust::Models::ProjectSettings, nil] Project settings. Patch operations replace all settings, so make sure you includ
      # ...
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ProjectListParams} for more details.
      #
      # List out all projects. The projects are sorted by creation date, with the most
      # recently-created projects coming first
      #
      # @overload list(ending_before: nil, ids: nil, limit: nil, org_name: nil, project_name: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String] Pagination cursor id. ...
      #
      # @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      # ...
      #
      # @param limit [Integer, nil] Limit the number of objects to return
      #
      # @param org_name [String] Filter search results to within a particular organization
      #
      # @param project_name [String] Name of the project to search for
      #
      # @param starting_after [String] Pagination cursor id. ...
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::Project>]
      #
      # @see Braintrust::Models::ProjectListParams
      def list(params = {})
        parsed, options = Braintrust::Models::ProjectListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/project",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Models::Project,
          options: options
        )
      end

      # Delete a project object by its id
      #
      # @overload delete(project_id, request_options: {})
      #
      # @param project_id [String] Project id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
