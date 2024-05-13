# frozen_string_literal: true

module Ruby
  module Resources
    class Role
      def initialize(client:)
        @client = client
      end

      # Create a new role. If there is an existing role with the same name as the one
      #   specified in the request, will return the existing role unmodified
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the role
      # @option params [String] :description Textual description of the role
      # @option params [Array<Symbol>] :member_permissions Permissions which belong to this role
      # @option params [Array<String>] :member_roles Ids of the roles this role inherits from
      # 
      #   An inheriting role has all the permissions contained in its member roles, as
      #   well as all of their inherited permissions
      # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the role belongs in.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::Models::Role]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/role"
        req[:body] = params
        req[:model] = Ruby::Models::Role
        @client.request(req, opts)
      end

      # Get a role object by its id
      # 
      # @param role_id [String] Role id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::Models::Role]
      def retrieve(role_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/role/#{role_id}"
        req[:model] = Ruby::Models::Role
        @client.request(req, opts)
      end

      # Partially update a role object. Specify the fields to update in the payload. Any
      #   object-type fields will be deep-merged with existing content. Currently we do
      #   not support removing fields or setting them to null.
      # 
      # @param role_id [String] Role id
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :description Textual description of the role
      # @option params [Array<Symbol>] :member_permissions Permissions which belong to this role
      # @option params [Array<String>] :member_roles Ids of the roles this role inherits from
      # 
      #   An inheriting role has all the permissions contained in its member roles, as
      #   well as all of their inherited permissions
      # @option params [String] :name Name of the role
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::Models::Role]
      def update(role_id, params = {}, opts = {})
        req = {}
        req[:method] = :patch
        req[:path] = "/v1/role/#{role_id}"
        req[:body] = params
        req[:model] = Ruby::Models::Role
        @client.request(req, opts)
      end

      # List out all roles. The roles are sorted by creation date, with the most
      #   recently-created roles coming first
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
      # @option params [String] :role_name Name of the role to search for
      # @option params [String] :starting_after Pagination cursor id.
      # 
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::ListObjects<Ruby::Models::Role>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/role"
        req[:query] = params
        req[:page] = Ruby::ListObjects
        req[:model] = Ruby::Models::Role
        @client.request(req, opts)
      end

      # Delete a role object by its id
      # 
      # @param role_id [String] Role id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::Models::Role]
      def delete(role_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/role/#{role_id}"
        req[:model] = Ruby::Models::Role
        @client.request(req, opts)
      end

      # NOTE: This operation is deprecated and will be removed in a future revision of
      #   the API. Create or replace a new role. If there is an existing role with the
      #   same name as the one specified in the request, will return the existing role
      #   unmodified, will replace the existing role with the provided fields
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the role
      # @option params [String] :description Textual description of the role
      # @option params [Array<Symbol>] :member_permissions Permissions which belong to this role
      # @option params [Array<String>] :member_roles Ids of the roles this role inherits from
      # 
      #   An inheriting role has all the permissions contained in its member roles, as
      #   well as all of their inherited permissions
      # @option params [String] :org_name For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the role belongs in.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::Models::Role]
      def replace(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/v1/role"
        req[:body] = params
        req[:model] = Ruby::Models::Role
        @client.request(req, opts)
      end
    end
  end
end
