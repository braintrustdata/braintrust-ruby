# frozen_string_literal: true

module Braintrust
  module Resources
    class ACLs
      def initialize(client:)
        @client = client
      end

      # Create a new acl. If there is an existing acl with the same contents as the one
      #   specified in the request, will return the existing acl unmodified
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :object_id The id of the object the ACL applies to
      # @option params [Symbol] :object_type The object type that the ACL applies to
      # @option params [String] :group_id Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   be provided
      # @option params [Symbol] :permission Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      # @option params [Symbol] :restrict_object_type When setting a permission directly, optionally restricts the permission grant to
      #   just the specified object type. Cannot be set alongside a `role_id`.
      # @option params [String] :role_id Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      # @option params [String] :user_id Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   be provided
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ACL]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/acl"
        req[:body] = params
        req[:model] = Braintrust::Models::ACL
        @client.request(req, opts)
      end

      # Get an acl object by its id
      # 
      # @param acl_id [String] Acl id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ACL]
      def retrieve(acl_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/acl/#{acl_id}"
        req[:model] = Braintrust::Models::ACL
        @client.request(req, opts)
      end

      # List out all acls. The acls are sorted by creation date, with the most
      #   recently-created acls coming first
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :object_id The id of the object the ACL applies to
      # @option params [Symbol] :object_type The object type that the ACL applies to
      # @option params [String] :ending_before Pagination cursor id.
      # 
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      # @option params [Array<String>|String] :ids Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      # @option params [Integer] :limit Limit the number of objects to return
      # @option params [String] :starting_after Pagination cursor id.
      # 
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::ListObjects<Braintrust::Models::ACL>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/acl"
        req[:query] = params
        req[:page] = Braintrust::ListObjects
        req[:model] = Braintrust::Models::ACL
        @client.request(req, opts)
      end

      # Delete an acl object by its id
      # 
      # @param acl_id [String] Acl id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Braintrust::Models::ACL]
      def delete(acl_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/acl/#{acl_id}"
        req[:model] = Braintrust::Models::ACL
        @client.request(req, opts)
      end
    end
  end
end
