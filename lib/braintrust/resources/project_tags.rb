# frozen_string_literal: true

module Braintrust
  module Resources
    class ProjectTags
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Create a new project_tag. If there is an existing project_tag in the project
      #   with the same name as the one specified in the request, will return the existing
      #   project_tag unmodified
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the project tag
      #   @option params [String] :project_id Unique identifier for the project that the project tag belongs under
      #   @option params [String, nil] :color Color of the tag for the UI
      #   @option params [String, nil] :description Textual description of the project tag
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::ProjectTag]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/project_tag",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::ProjectTag
        }
        @client.request(req, opts)
      end

      # Get a project_tag object by its id
      #
      # @param project_tag_id [String] ProjectTag id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::ProjectTag]
      def retrieve(project_tag_id, opts = {})
        req = {
          method: :get,
          path: "/v1/project_tag/#{project_tag_id}",
          model: Braintrust::Models::ProjectTag
        }
        @client.request(req, opts)
      end

      # Partially update a project_tag object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
      #
      # @param project_tag_id [String] ProjectTag id
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :color Color of the tag for the UI
      #   @option params [String, nil] :description Textual description of the project tag
      #   @option params [String, nil] :name Name of the project tag
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::ProjectTag]
      def update(project_tag_id, params = {}, opts = {})
        req = {
          method: :patch,
          path: "/v1/project_tag/#{project_tag_id}",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::ProjectTag
        }
        @client.request(req, opts)
      end

      # List out all project_tags. The project_tags are sorted by creation date, with
      #   the most recently-created project_tags coming first
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :org_name Filter search results to within a particular organization
      #   @option params [String, nil] :project_id Project id
      #   @option params [String, nil] :project_name Name of the project to search for
      #   @option params [String, nil] :project_tag_name Name of the project_tag to search for
      #   @option params [String, nil] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::ProjectTag>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/project_tag",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::ProjectTag
        }
        @client.request(req, opts)
      end

      # Delete a project_tag object by its id
      #
      # @param project_tag_id [String] ProjectTag id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::ProjectTag]
      def delete(project_tag_id, opts = {})
        req = {
          method: :delete,
          path: "/v1/project_tag/#{project_tag_id}",
          model: Braintrust::Models::ProjectTag
        }
        @client.request(req, opts)
      end

      # Create or replace project_tag. If there is an existing project_tag in the
      #   project with the same name as the one specified in the request, will replace the
      #   existing project_tag with the provided fields
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the project tag
      #   @option params [String] :project_id Unique identifier for the project that the project tag belongs under
      #   @option params [String, nil] :color Color of the tag for the UI
      #   @option params [String, nil] :description Textual description of the project tag
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::ProjectTag]
      def replace(params = {}, opts = {})
        req = {
          method: :put,
          path: "/v1/project_tag",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::ProjectTag
        }
        @client.request(req, opts)
      end
    end
  end
end
