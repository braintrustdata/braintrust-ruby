# frozen_string_literal: true

module Braintrust
  module Resources
    class Roles
      # Create a new role. If there is an existing role with the same name as the one
      #   specified in the request, will return the existing role unmodified
      #
      # @param params [Braintrust::Models::RoleCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the role
      #
      #   @option params [String, nil] :description Textual description of the role
      #
      #   @option params [Array<Braintrust::Models::RoleCreateParams::MemberPermission>, nil] :member_permissions (permission, restrict_object_type) tuples which belong to this role
      #
      #   @option params [Array<String>, nil] :member_roles Ids of the roles this role inherits from
      #
      #     An inheriting role has all the permissions contained in its member roles, as
      #     well as all of their inherited permissions
      #
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the role belongs in.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Role]
      def create(params)
        parsed, options = Braintrust::Models::RoleCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/role",
          body: parsed,
          model: Braintrust::Models::Role,
          options: options
        )
      end

      # Get a role object by its id
      #
      # @param role_id [String] Role id
      #
      # @param params [Braintrust::Models::RoleRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Role]
      def retrieve(role_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/role/%0s", role_id],
          model: Braintrust::Models::Role,
          options: params[:request_options]
        )
      end

      # Partially update a role object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      #
      # @param role_id [String] Role id
      #
      # @param params [Braintrust::Models::RoleUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Array<Braintrust::Models::RoleUpdateParams::AddMemberPermission>, nil] :add_member_permissions A list of permissions to add to the role
      #
      #   @option params [Array<String>, nil] :add_member_roles A list of role IDs to add to the role's inheriting-from set
      #
      #   @option params [String, nil] :description Textual description of the role
      #
      #   @option params [String, nil] :name Name of the role
      #
      #   @option params [Array<Braintrust::Models::RoleUpdateParams::RemoveMemberPermission>, nil] :remove_member_permissions A list of permissions to remove from the role
      #
      #   @option params [Array<String>, nil] :remove_member_roles A list of role IDs to remove from the role's inheriting-from set
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Role]
      def update(role_id, params = {})
        parsed, options = Braintrust::Models::RoleUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/role/%0s", role_id],
          body: parsed,
          model: Braintrust::Models::Role,
          options: options
        )
      end

      # List out all roles. The roles are sorted by creation date, with the most
      #   recently-created roles coming first
      #
      # @param params [Braintrust::Models::RoleListParams, Hash{Symbol=>Object}] .
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
      #   @option params [String] :role_name Name of the role to search for
      #
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Role>]
      def list(params = {})
        parsed, options = Braintrust::Models::RoleListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/role",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Role,
          options: options
        )
      end

      # Delete a role object by its id
      #
      # @param role_id [String] Role id
      #
      # @param params [Braintrust::Models::RoleDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Role]
      def delete(role_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/role/%0s", role_id],
          model: Braintrust::Models::Role,
          options: params[:request_options]
        )
      end

      # Create or replace role. If there is an existing role with the same name as the
      #   one specified in the request, will replace the existing role with the provided
      #   fields
      #
      # @param params [Braintrust::Models::RoleReplaceParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the role
      #
      #   @option params [String, nil] :description Textual description of the role
      #
      #   @option params [Array<Braintrust::Models::RoleReplaceParams::MemberPermission>, nil] :member_permissions (permission, restrict_object_type) tuples which belong to this role
      #
      #   @option params [Array<String>, nil] :member_roles Ids of the roles this role inherits from
      #
      #     An inheriting role has all the permissions contained in its member roles, as
      #     well as all of their inherited permissions
      #
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the role belongs in.
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Role]
      def replace(params)
        parsed, options = Braintrust::Models::RoleReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/role",
          body: parsed,
          model: Braintrust::Models::Role,
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
