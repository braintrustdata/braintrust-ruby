# frozen_string_literal: true

module Braintrust
  module Resources
    class ProjectTags
      # Create a new project_tag. If there is an existing project_tag in the project
      # with the same name as the one specified in the request, will return the existing
      # project_tag unmodified
      #
      # @overload create(name:, project_id:, color: nil, description: nil, request_options: {})
      #
      # @param name [String] Name of the project tag
      #
      # @param project_id [String] Unique identifier for the project that the project tag belongs under
      #
      # @param color [String, nil] Color of the tag for the UI
      #
      # @param description [String, nil] Textual description of the project tag
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::ProjectTag]
      #
      # @see Braintrust::Models::ProjectTagCreateParams
      def create(params)
        parsed, options = Braintrust::ProjectTagCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/project_tag",
          body: parsed,
          model: Braintrust::ProjectTag,
          options: options
        )
      end

      # Get a project_tag object by its id
      #
      # @overload retrieve(project_tag_id, request_options: {})
      #
      # @param project_tag_id [String] ProjectTag id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::ProjectTag]
      #
      # @see Braintrust::Models::ProjectTagRetrieveParams
      def retrieve(project_tag_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/project_tag/%1$s", project_tag_id],
          model: Braintrust::ProjectTag,
          options: params[:request_options]
        )
      end

      # Partially update a project_tag object. Specify the fields to update in the
      # payload. Any object-type fields will be deep-merged with existing content.
      # Currently we do not support removing fields or setting them to null.
      #
      # @overload update(project_tag_id, color: nil, description: nil, name: nil, request_options: {})
      #
      # @param project_tag_id [String] ProjectTag id
      #
      # @param color [String, nil] Color of the tag for the UI
      #
      # @param description [String, nil] Textual description of the project tag
      #
      # @param name [String, nil] Name of the project tag
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::ProjectTag]
      #
      # @see Braintrust::Models::ProjectTagUpdateParams
      def update(project_tag_id, params = {})
        parsed, options = Braintrust::ProjectTagUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/project_tag/%1$s", project_tag_id],
          body: parsed,
          model: Braintrust::ProjectTag,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ProjectTagListParams} for more details.
      #
      # List out all project_tags. The project_tags are sorted by creation date, with
      # the most recently-created project_tags coming first
      #
      # @overload list(ending_before: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, project_tag_name: nil, starting_after: nil, request_options: {})
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
      # @param project_tag_name [String] Name of the project_tag to search for
      #
      # @param starting_after [String] Pagination cursor id.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::ProjectTag>]
      #
      # @see Braintrust::Models::ProjectTagListParams
      def list(params = {})
        parsed, options = Braintrust::ProjectTagListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/project_tag",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::ProjectTag,
          options: options
        )
      end

      # Delete a project_tag object by its id
      #
      # @overload delete(project_tag_id, request_options: {})
      #
      # @param project_tag_id [String] ProjectTag id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::ProjectTag]
      #
      # @see Braintrust::Models::ProjectTagDeleteParams
      def delete(project_tag_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/project_tag/%1$s", project_tag_id],
          model: Braintrust::ProjectTag,
          options: params[:request_options]
        )
      end

      # Create or replace project_tag. If there is an existing project_tag in the
      # project with the same name as the one specified in the request, will replace the
      # existing project_tag with the provided fields
      #
      # @overload replace(name:, project_id:, color: nil, description: nil, request_options: {})
      #
      # @param name [String] Name of the project tag
      #
      # @param project_id [String] Unique identifier for the project that the project tag belongs under
      #
      # @param color [String, nil] Color of the tag for the UI
      #
      # @param description [String, nil] Textual description of the project tag
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::ProjectTag]
      #
      # @see Braintrust::Models::ProjectTagReplaceParams
      def replace(params)
        parsed, options = Braintrust::ProjectTagReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/project_tag",
          body: parsed,
          model: Braintrust::ProjectTag,
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
