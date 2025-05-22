# frozen_string_literal: true

module Braintrust
  module Resources
    class Roles
      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::RoleCreateParams} for more details.
      #
      # Create a new role. If there is an existing role with the same name as the one
      # specified in the request, will return the existing role unmodified
      #
      # @overload create(name:, description: nil, member_permissions: nil, member_roles: nil, org_name: nil, request_options: {})
      #
      # @param name [String] Name of the role
      #
      # @param description [String, nil] Textual description of the role
      #
      # @param member_permissions [Array<Braintrust::Models::RoleCreateParams::MemberPermission>, nil] (permission, restrict_object_type) tuples which belong to this role
      #
      # @param member_roles [Array<String>, nil] Ids of the roles this role inherits from
      #
      # @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Role]
      #
      # @see Braintrust::Models::RoleCreateParams
      def create(params)
        parsed, options = Braintrust::RoleCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/role",
          body: parsed,
          model: Braintrust::Role,
          options: options
        )
      end

      # Get a role object by its id
      #
      # @overload retrieve(role_id, request_options: {})
      #
      # @param role_id [String] Role id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Role]
      #
      # @see Braintrust::Models::RoleRetrieveParams
      def retrieve(role_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/role/%1$s", role_id],
          model: Braintrust::Role,
          options: params[:request_options]
        )
      end

      # Partially update a role object. Specify the fields to update in the payload. Any
      # object-type fields will be deep-merged with existing content. Currently we do
      # not support removing fields or setting them to null.
      #
      # @overload update(role_id, add_member_permissions: nil, add_member_roles: nil, description: nil, name: nil, remove_member_permissions: nil, remove_member_roles: nil, request_options: {})
      #
      # @param role_id [String] Role id
      #
      # @param add_member_permissions [Array<Braintrust::Models::RoleUpdateParams::AddMemberPermission>, nil] A list of permissions to add to the role
      #
      # @param add_member_roles [Array<String>, nil] A list of role IDs to add to the role's inheriting-from set
      #
      # @param description [String, nil] Textual description of the role
      #
      # @param name [String, nil] Name of the role
      #
      # @param remove_member_permissions [Array<Braintrust::Models::RoleUpdateParams::RemoveMemberPermission>, nil] A list of permissions to remove from the role
      #
      # @param remove_member_roles [Array<String>, nil] A list of role IDs to remove from the role's inheriting-from set
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Role]
      #
      # @see Braintrust::Models::RoleUpdateParams
      def update(role_id, params = {})
        parsed, options = Braintrust::RoleUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/role/%1$s", role_id],
          body: parsed,
          model: Braintrust::Role,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::RoleListParams} for more details.
      #
      # List out all roles. The roles are sorted by creation date, with the most
      # recently-created roles coming first
      #
      # @overload list(ending_before: nil, ids: nil, limit: nil, org_name: nil, role_name: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String] Pagination cursor id.
      #
      # @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      #
      # @param limit [Integer, nil] Limit the number of objects to return
      #
      # @param org_name [String] Filter search results to within a particular organization
      #
      # @param role_name [String] Name of the role to search for
      #
      # @param starting_after [String] Pagination cursor id.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::Role>]
      #
      # @see Braintrust::Models::RoleListParams
      def list(params = {})
        parsed, options = Braintrust::RoleListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/role",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Role,
          options: options
        )
      end

      # Delete a role object by its id
      #
      # @overload delete(role_id, request_options: {})
      #
      # @param role_id [String] Role id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Role]
      #
      # @see Braintrust::Models::RoleDeleteParams
      def delete(role_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/role/%1$s", role_id],
          model: Braintrust::Role,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::RoleReplaceParams} for more details.
      #
      # Create or replace role. If there is an existing role with the same name as the
      # one specified in the request, will replace the existing role with the provided
      # fields
      #
      # @overload replace(name:, description: nil, member_permissions: nil, member_roles: nil, org_name: nil, request_options: {})
      #
      # @param name [String] Name of the role
      #
      # @param description [String, nil] Textual description of the role
      #
      # @param member_permissions [Array<Braintrust::Models::RoleReplaceParams::MemberPermission>, nil] (permission, restrict_object_type) tuples which belong to this role
      #
      # @param member_roles [Array<String>, nil] Ids of the roles this role inherits from
      #
      # @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Role]
      #
      # @see Braintrust::Models::RoleReplaceParams
      def replace(params)
        parsed, options = Braintrust::RoleReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/role",
          body: parsed,
          model: Braintrust::Role,
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
