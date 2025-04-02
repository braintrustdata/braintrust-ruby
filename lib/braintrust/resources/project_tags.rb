# frozen_string_literal: true

module Braintrust
  module Resources
    class ProjectTags
      # Create a new project_tag. If there is an existing project_tag in the project
      #   with the same name as the one specified in the request, will return the existing
      #   project_tag unmodified
      #
      # @param params [Braintrust::Models::ProjectTagCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the project tag
      #
      #   @option params [String] :project_id Unique identifier for the project that the project tag belongs under
      #
      #   @option params [String, nil] :color Color of the tag for the UI
      #
      #   @option params [String, nil] :description Textual description of the project tag
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ProjectTag]
      def create(params)
        parsed, options = Braintrust::Models::ProjectTagCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/project_tag",
          body: parsed,
          model: Braintrust::Models::ProjectTag,
          options: options
        )
      end

      # Get a project_tag object by its id
      #
      # @param project_tag_id [String] ProjectTag id
      #
      # @param params [Braintrust::Models::ProjectTagRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ProjectTag]
      def retrieve(project_tag_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/project_tag/%1$s", project_tag_id],
          model: Braintrust::Models::ProjectTag,
          options: params[:request_options]
        )
      end

      # Partially update a project_tag object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @param project_tag_id [String] ProjectTag id
      #
      # @param params [Braintrust::Models::ProjectTagUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String, nil] :color Color of the tag for the UI
      #
      #   @option params [String, nil] :description Textual description of the project tag
      #
      #   @option params [String, nil] :name Name of the project tag
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ProjectTag]
      def update(project_tag_id, params = {})
        parsed, options = Braintrust::Models::ProjectTagUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/project_tag/%1$s", project_tag_id],
          body: parsed,
          model: Braintrust::Models::ProjectTag,
          options: options
        )
      end

      # List out all project_tags. The project_tags are sorted by creation date, with
      #   the most recently-created project_tags coming first
      #
      # @param params [Braintrust::Models::ProjectTagListParams, Hash{Symbol=>Object}] .
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
      #   @option params [String] :project_tag_name Name of the project_tag to search for
      #
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::ProjectTag>]
      def list(params = {})
        parsed, options = Braintrust::Models::ProjectTagListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/project_tag",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::ProjectTag,
          options: options
        )
      end

      # Delete a project_tag object by its id
      #
      # @param project_tag_id [String] ProjectTag id
      #
      # @param params [Braintrust::Models::ProjectTagDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ProjectTag]
      def delete(project_tag_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/project_tag/%1$s", project_tag_id],
          model: Braintrust::Models::ProjectTag,
          options: params[:request_options]
        )
      end

      # Create or replace project_tag. If there is an existing project_tag in the
      #   project with the same name as the one specified in the request, will replace the
      #   existing project_tag with the provided fields
      #
      # @param params [Braintrust::Models::ProjectTagReplaceParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the project tag
      #
      #   @option params [String] :project_id Unique identifier for the project that the project tag belongs under
      #
      #   @option params [String, nil] :color Color of the tag for the UI
      #
      #   @option params [String, nil] :description Textual description of the project tag
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ProjectTag]
      def replace(params)
        parsed, options = Braintrust::Models::ProjectTagReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/project_tag",
          body: parsed,
          model: Braintrust::Models::ProjectTag,
          options: options
        )
      end

      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
