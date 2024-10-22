# frozen_string_literal: true

module Braintrust
  module Resources
    class ACLs
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Create a new acl. If there is an existing acl with the same contents as the one
      #   specified in the request, will return the existing acl unmodified
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :object_id The id of the object the ACL applies to
      #   @option params [Symbol, ObjectType] :object_type The object type that the ACL applies to
      #   @option params [String, nil] :group_id Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #     be provided
      #   @option params [Symbol, Permission, nil] :permission Each permission permits a certain type of operation on an object in the system
      #
      #     Permissions can be assigned to to objects on an individual basis, or grouped
      #     into roles
      #   @option params [Symbol, RestrictObjectType, nil] :restrict_object_type The object type that the ACL applies to
      #   @option params [String, nil] :role_id Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #     provided
      #   @option params [String, nil] :user_id Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #     be provided
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::ACL]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/acl",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::ACL
        }
        @client.request(req, opts)
      end

      # Get an acl object by its id
      #
      # @param acl_id [String] Acl id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::ACL]
      def retrieve(acl_id, opts = {})
        req = {
          method: :get,
          path: "/v1/acl/#{acl_id}",
          model: Braintrust::Models::ACL
        }
        @client.request(req, opts)
      end

      # List out all acls. The acls are sorted by creation date, with the most
      #   recently-created acls coming first
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :object_id The id of the object the ACL applies to
      #   @option params [Symbol, ObjectType] :object_type The object type that the ACL applies to
      #   @option params [String, nil] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::ACL>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/acl",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::ACL
        }
        @client.request(req, opts)
      end

      # Delete an acl object by its id
      #
      # @param acl_id [String] Acl id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::ACL]
      def delete(acl_id, opts = {})
        req = {
          method: :delete,
          path: "/v1/acl/#{acl_id}",
          model: Braintrust::Models::ACL
        }
        @client.request(req, opts)
      end

      # Batch update acls. This operation is idempotent, so adding acls which already
      #   exist will have no effect, and removing acls which do not exist will have no
      #   effect.
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [Array<AddACL>, nil] :add_acls An ACL grants a certain permission or role to a certain user or group on an
      #     object.
      #
      #     ACLs are inherited across the object hierarchy. So for example, if a user has
      #     read permissions on a project, they will also have read permissions on any
      #     experiment, dataset, etc. created within that project.
      #
      #     To restrict a grant to a particular sub-object, you may specify
      #     `restrict_object_type` in the ACL, as part of a direct permission grant or as
      #     part of a role.
      #   @option params [Array<RemoveACL>, nil] :remove_acls An ACL grants a certain permission or role to a certain user or group on an
      #     object.
      #
      #     ACLs are inherited across the object hierarchy. So for example, if a user has
      #     read permissions on a project, they will also have read permissions on any
      #     experiment, dataset, etc. created within that project.
      #
      #     To restrict a grant to a particular sub-object, you may specify
      #     `restrict_object_type` in the ACL, as part of a direct permission grant or as
      #     part of a role.
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::ACLBatchUpdateResponse]
      def batch_update(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/acl/batch-update",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::ACLBatchUpdateResponse
        }
        @client.request(req, opts)
      end

      # Delete a single acl
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String] :object_id The id of the object the ACL applies to
      #   @option params [Symbol, ObjectType] :object_type The object type that the ACL applies to
      #   @option params [String, nil] :group_id Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #     be provided
      #   @option params [Symbol, Permission, nil] :permission Each permission permits a certain type of operation on an object in the system
      #
      #     Permissions can be assigned to to objects on an individual basis, or grouped
      #     into roles
      #   @option params [Symbol, RestrictObjectType, nil] :restrict_object_type The object type that the ACL applies to
      #   @option params [String, nil] :role_id Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #     provided
      #   @option params [String, nil] :user_id Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #     be provided
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::ACL]
      def find_and_delete(params = {}, opts = {})
        req = {
          method: :delete,
          path: "/v1/acl",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::ACL
        }
        @client.request(req, opts)
      end
    end
  end
end
