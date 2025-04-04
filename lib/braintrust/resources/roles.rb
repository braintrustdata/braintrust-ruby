# frozen_string_literal: true

module Braintrust
  module Resources
    class Roles
      # Create a new role. If there is an existing role with the same name as the one
      #   specified in the request, will return the existing role unmodified
      #
      # @overload create(name:, description: nil, member_permissions: nil, member_roles: nil, org_name: nil, request_options: {})
      #
      # @param name [String]
      # @param description [String, nil]
      # @param member_permissions [Array<Braintrust::Models::RoleCreateParams::MemberPermission>, nil]
      # @param member_roles [Array<String>, nil]
      # @param org_name [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Role]
      #
      # @see Braintrust::Models::RoleCreateParams
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
      # @overload retrieve(role_id, request_options: {})
      #
      # @param role_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Role]
      #
      # @see Braintrust::Models::RoleRetrieveParams
      def retrieve(role_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/role/%1$s", role_id],
          model: Braintrust::Models::Role,
          options: params[:request_options]
        )
      end

      # Partially update a role object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      #
      # @overload update(role_id, add_member_permissions: nil, add_member_roles: nil, description: nil, name: nil, remove_member_permissions: nil, remove_member_roles: nil, request_options: {})
      #
      # @param role_id [String]
      # @param add_member_permissions [Array<Braintrust::Models::RoleUpdateParams::AddMemberPermission>, nil]
      # @param add_member_roles [Array<String>, nil]
      # @param description [String, nil]
      # @param name [String, nil]
      # @param remove_member_permissions [Array<Braintrust::Models::RoleUpdateParams::RemoveMemberPermission>, nil]
      # @param remove_member_roles [Array<String>, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Role]
      #
      # @see Braintrust::Models::RoleUpdateParams
      def update(role_id, params = {})
        parsed, options = Braintrust::Models::RoleUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/role/%1$s", role_id],
          body: parsed,
          model: Braintrust::Models::Role,
          options: options
        )
      end

      # List out all roles. The roles are sorted by creation date, with the most
      #   recently-created roles coming first
      #
      # @overload list(ending_before: nil, ids: nil, limit: nil, org_name: nil, role_name: nil, starting_after: nil, request_options: {})
      #
      # @param ending_before [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param org_name [String]
      # @param role_name [String]
      # @param starting_after [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::Role>]
      #
      # @see Braintrust::Models::RoleListParams
      def list(params = {})
        parsed, options = Braintrust::Models::RoleListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/role",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Models::Role,
          options: options
        )
      end

      # Delete a role object by its id
      #
      # @overload delete(role_id, request_options: {})
      #
      # @param role_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Role]
      #
      # @see Braintrust::Models::RoleDeleteParams
      def delete(role_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/role/%1$s", role_id],
          model: Braintrust::Models::Role,
          options: params[:request_options]
        )
      end

      # Create or replace role. If there is an existing role with the same name as the
      #   one specified in the request, will replace the existing role with the provided
      #   fields
      #
      # @overload replace(name:, description: nil, member_permissions: nil, member_roles: nil, org_name: nil, request_options: {})
      #
      # @param name [String]
      # @param description [String, nil]
      # @param member_permissions [Array<Braintrust::Models::RoleReplaceParams::MemberPermission>, nil]
      # @param member_roles [Array<String>, nil]
      # @param org_name [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Role]
      #
      # @see Braintrust::Models::RoleReplaceParams
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

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
