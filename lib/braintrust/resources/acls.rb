# frozen_string_literal: true

module Braintrust
  module Resources
    class ACLs
      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ACLCreateParams} for more details.
      #
      # Create a new acl. If there is an existing acl with the same contents as the one
      # specified in the request, will return the existing acl unmodified
      #
      # @overload create(object_id_:, object_type:, group_id: nil, permission: nil, restrict_object_type: nil, role_id: nil, user_id: nil, request_options: {})
      #
      # @param object_id_ [String] The id of the object the ACL applies to
      #
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType] The object type that the ACL applies to
      #
      # @param group_id [String, nil] Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #
      # @param permission [Symbol, Braintrust::Models::Permission, nil] Permission the ACL grants. Exactly one of `permission` and `role_id` will be pro
      #
      # @param restrict_object_type [Symbol, Braintrust::Models::ACLObjectType, nil] When setting a permission directly, optionally restricts the permission grant to
      #
      # @param role_id [String, nil] Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #
      # @param user_id [String, nil] Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ACL]
      #
      # @see Braintrust::Models::ACLCreateParams
      def create(params)
        parsed, options = Braintrust::ACLCreateParams.dump_request(params)
        @client.request(method: :post, path: "v1/acl", body: parsed, model: Braintrust::ACL, options: options)
      end

      # Get an acl object by its id
      #
      # @overload retrieve(acl_id, request_options: {})
      #
      # @param acl_id [String] Acl id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ACL]
      #
      # @see Braintrust::Models::ACLRetrieveParams
      def retrieve(acl_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/acl/%1$s", acl_id],
          model: Braintrust::ACL,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ACLListParams} for more details.
      #
      # List out all acls. The acls are sorted by creation date, with the most
      # recently-created acls coming first
      #
      # @overload list(object_id_:, object_type:, ending_before: nil, ids: nil, limit: nil, starting_after: nil, request_options: {})
      #
      # @param object_id_ [String] The id of the object the ACL applies to
      #
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType] The object type that the ACL applies to
      #
      # @param ending_before [String] Pagination cursor id.
      #
      # @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      #
      # @param limit [Integer, nil] Limit the number of objects to return
      #
      # @param starting_after [String] Pagination cursor id.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::ACL>]
      #
      # @see Braintrust::Models::ACLListParams
      def list(params)
        parsed, options = Braintrust::ACLListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/acl",
          query: parsed.transform_keys(object_id_: "object_id"),
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::ACL,
          options: options
        )
      end

      # Delete an acl object by its id
      #
      # @overload delete(acl_id, request_options: {})
      #
      # @param acl_id [String] Acl id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ACL]
      #
      # @see Braintrust::Models::ACLDeleteParams
      def delete(acl_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/acl/%1$s", acl_id],
          model: Braintrust::ACL,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ACLBatchUpdateParams} for more details.
      #
      # Batch update acls. This operation is idempotent, so adding acls which already
      # exist will have no effect, and removing acls which do not exist will have no
      # effect.
      #
      # @overload batch_update(add_acls: nil, remove_acls: nil, request_options: {})
      #
      # @param add_acls [Array<Braintrust::Models::ACLBatchUpdateParams::AddACL>, nil] An ACL grants a certain permission or role to a certain user or group on an obje
      #
      # @param remove_acls [Array<Braintrust::Models::ACLBatchUpdateParams::RemoveACL>, nil] An ACL grants a certain permission or role to a certain user or group on an obje
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ACLBatchUpdateResponse]
      #
      # @see Braintrust::Models::ACLBatchUpdateParams
      def batch_update(params = {})
        parsed, options = Braintrust::ACLBatchUpdateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/acl/batch_update",
          body: parsed,
          model: Braintrust::ACLBatchUpdateResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::ACLFindAndDeleteParams} for more details.
      #
      # Delete a single acl
      #
      # @overload find_and_delete(object_id_:, object_type:, group_id: nil, permission: nil, restrict_object_type: nil, role_id: nil, user_id: nil, request_options: {})
      #
      # @param object_id_ [String] The id of the object the ACL applies to
      #
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType] The object type that the ACL applies to
      #
      # @param group_id [String, nil] Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #
      # @param permission [Symbol, Braintrust::Models::Permission, nil] Permission the ACL grants. Exactly one of `permission` and `role_id` will be pro
      #
      # @param restrict_object_type [Symbol, Braintrust::Models::ACLObjectType, nil] When setting a permission directly, optionally restricts the permission grant to
      #
      # @param role_id [String, nil] Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #
      # @param user_id [String, nil] Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ACL]
      #
      # @see Braintrust::Models::ACLFindAndDeleteParams
      def find_and_delete(params)
        parsed, options = Braintrust::ACLFindAndDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: "v1/acl",
          body: parsed,
          model: Braintrust::ACL,
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
