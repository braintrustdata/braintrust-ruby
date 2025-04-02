# frozen_string_literal: true

module Braintrust
  module Resources
    class ACLs
      # Create a new acl. If there is an existing acl with the same contents as the one
      #   specified in the request, will return the existing acl unmodified
      #
      # @param params [Braintrust::Models::ACLCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :object_id_ The id of the object the ACL applies to
      #
      #   @option params [Symbol, Braintrust::Models::ACLObjectType] :object_type The object type that the ACL applies to
      #
      #   @option params [String, nil] :group_id Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #     be provided
      #
      #   @option params [Symbol, Braintrust::Models::Permission, nil] :permission Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #     provided
      #
      #   @option params [Symbol, Braintrust::Models::ACLObjectType, nil] :restrict_object_type When setting a permission directly, optionally restricts the permission grant to
      #     just the specified object type. Cannot be set alongside a `role_id`.
      #
      #   @option params [String, nil] :role_id Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #     provided
      #
      #   @option params [String, nil] :user_id Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #     be provided
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ACL]
      def create(params)
        parsed, options = Braintrust::Models::ACLCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/acl",
          body: parsed,
          model: Braintrust::Models::ACL,
          options: options
        )
      end

      # Get an acl object by its id
      #
      # @param acl_id [String] Acl id
      #
      # @param params [Braintrust::Models::ACLRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ACL]
      def retrieve(acl_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/acl/%1$s", acl_id],
          model: Braintrust::Models::ACL,
          options: params[:request_options]
        )
      end

      # List out all acls. The acls are sorted by creation date, with the most
      #   recently-created acls coming first
      #
      # @param params [Braintrust::Models::ACLListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :object_id_ The id of the object the ACL applies to
      #
      #   @option params [Symbol, Braintrust::Models::ACLObjectType] :object_type The object type that the ACL applies to
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
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::ACL>]
      def list(params)
        parsed, options = Braintrust::Models::ACLListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/acl",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::ACL,
          options: options
        )
      end

      # Delete an acl object by its id
      #
      # @param acl_id [String] Acl id
      #
      # @param params [Braintrust::Models::ACLDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ACL]
      def delete(acl_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/acl/%1$s", acl_id],
          model: Braintrust::Models::ACL,
          options: params[:request_options]
        )
      end

      # Batch update acls. This operation is idempotent, so adding acls which already
      #   exist will have no effect, and removing acls which do not exist will have no
      #   effect.
      #
      # @param params [Braintrust::Models::ACLBatchUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Array<Braintrust::Models::ACLBatchUpdateParams::AddACL>, nil] :add_acls An ACL grants a certain permission or role to a certain user or group on an
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
      #   @option params [Array<Braintrust::Models::ACLBatchUpdateParams::RemoveACL>, nil] :remove_acls An ACL grants a certain permission or role to a certain user or group on an
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
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ACLBatchUpdateResponse]
      def batch_update(params = {})
        parsed, options = Braintrust::Models::ACLBatchUpdateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/acl/batch_update",
          body: parsed,
          model: Braintrust::Models::ACLBatchUpdateResponse,
          options: options
        )
      end

      # Delete a single acl
      #
      # @param params [Braintrust::Models::ACLFindAndDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :object_id_ The id of the object the ACL applies to
      #
      #   @option params [Symbol, Braintrust::Models::ACLObjectType] :object_type The object type that the ACL applies to
      #
      #   @option params [String, nil] :group_id Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #     be provided
      #
      #   @option params [Symbol, Braintrust::Models::Permission, nil] :permission Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #     provided
      #
      #   @option params [Symbol, Braintrust::Models::ACLObjectType, nil] :restrict_object_type When setting a permission directly, optionally restricts the permission grant to
      #     just the specified object type. Cannot be set alongside a `role_id`.
      #
      #   @option params [String, nil] :role_id Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #     provided
      #
      #   @option params [String, nil] :user_id Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #     be provided
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::ACL]
      def find_and_delete(params)
        parsed, options = Braintrust::Models::ACLFindAndDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: "v1/acl",
          body: parsed,
          model: Braintrust::Models::ACL,
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
