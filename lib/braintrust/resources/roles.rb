# frozen_string_literal: true

module Braintrust
  module Resources
    class Roles
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Create a new role. If there is an existing role with the same name as the one
      #   specified in the request, will return the existing role unmodified
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the role
      #   @option params [String, nil] :description Textual description of the role
      #   @option params [Array<MemberPermission>, nil] :member_permissions (permission, restrict_object_type) tuples which belong to this role
      #   @option params [Array<String>, nil] :member_roles Ids of the roles this role inherits from
      #
      #     An inheriting role has all the permissions contained in its member roles, as
      #     well as all of their inherited permissions
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the role belongs in.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Role]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/role",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Role
        }
        @client.request(req, opts)
      end

      # Get a role object by its id
      #
      # @param role_id [String] Role id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Role]
      def retrieve(role_id, opts = {})
        req = {
          method: :get,
          path: "/v1/role/#{role_id}",
          model: Braintrust::Models::Role
        }
        @client.request(req, opts)
      end

      # Partially update a role object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      #
      # @param role_id [String] Role id
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [Array<AddMemberPermission>, nil] :add_member_permissions A list of permissions to add to the role
      #   @option params [Array<String>, nil] :add_member_roles A list of role IDs to add to the role's inheriting-from set
      #   @option params [String, nil] :description Textual description of the role
      #   @option params [String, nil] :name Name of the role
      #   @option params [Array<RemoveMemberPermission>, nil] :remove_member_permissions A list of permissions to remove from the role
      #   @option params [Array<String>, nil] :remove_member_roles A list of role IDs to remove from the role's inheriting-from set
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Role]
      def update(role_id, params = {}, opts = {})
        req = {
          method: :patch,
          path: "/v1/role/#{role_id}",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Role
        }
        @client.request(req, opts)
      end

      # List out all roles. The roles are sorted by creation date, with the most
      #   recently-created roles coming first
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
      #   @option params [String, nil] :role_name Name of the role to search for
      #   @option params [String, nil] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Role>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/role",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Role
        }
        @client.request(req, opts)
      end

      # Delete a role object by its id
      #
      # @param role_id [String] Role id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Role]
      def delete(role_id, opts = {})
        req = {
          method: :delete,
          path: "/v1/role/#{role_id}",
          model: Braintrust::Models::Role
        }
        @client.request(req, opts)
      end

      # Create or replace role. If there is an existing role with the same name as the
      #   one specified in the request, will replace the existing role with the provided
      #   fields
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :name Name of the role
      #   @option params [String, nil] :description Textual description of the role
      #   @option params [Array<MemberPermission>, nil] :member_permissions (permission, restrict_object_type) tuples which belong to this role
      #   @option params [Array<String>, nil] :member_roles Ids of the roles this role inherits from
      #
      #     An inheriting role has all the permissions contained in its member roles, as
      #     well as all of their inherited permissions
      #   @option params [String, nil] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the role belongs in.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Role]
      def replace(params = {}, opts = {})
        req = {
          method: :put,
          path: "/v1/role",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Role
        }
        @client.request(req, opts)
      end
    end
  end
end
