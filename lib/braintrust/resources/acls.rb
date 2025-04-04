# frozen_string_literal: true

module Braintrust
  module Resources
    class ACLs
      # Create a new acl. If there is an existing acl with the same contents as the one
      #   specified in the request, will return the existing acl unmodified
      #
      # @overload create(object_id_:, object_type:, group_id: nil, permission: nil, restrict_object_type: nil, role_id: nil, user_id: nil, request_options: {})
      #
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      # @param group_id [String, nil]
      # @param permission [Symbol, Braintrust::Models::Permission, nil]
      # @param restrict_object_type [Symbol, Braintrust::Models::ACLObjectType, nil]
      # @param role_id [String, nil]
      # @param user_id [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ACL]
      #
      # @see Braintrust::Models::ACLCreateParams
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
      # @overload retrieve(acl_id, request_options: {})
      #
      # @param acl_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ACL]
      #
      # @see Braintrust::Models::ACLRetrieveParams
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
      # @overload list(object_id_:, object_type:, ending_before: nil, ids: nil, limit: nil, starting_after: nil, request_options: {})
      #
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      # @param ending_before [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param starting_after [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::ACL>]
      #
      # @see Braintrust::Models::ACLListParams
      def list(params)
        parsed, options = Braintrust::Models::ACLListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/acl",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Models::ACL,
          options: options
        )
      end

      # Delete an acl object by its id
      #
      # @overload delete(acl_id, request_options: {})
      #
      # @param acl_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ACL]
      #
      # @see Braintrust::Models::ACLDeleteParams
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
      # @overload batch_update(add_acls: nil, remove_acls: nil, request_options: {})
      #
      # @param add_acls [Array<Braintrust::Models::ACLBatchUpdateParams::AddACL>, nil]
      # @param remove_acls [Array<Braintrust::Models::ACLBatchUpdateParams::RemoveACL>, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ACLBatchUpdateResponse]
      #
      # @see Braintrust::Models::ACLBatchUpdateParams
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
      # @overload find_and_delete(object_id_:, object_type:, group_id: nil, permission: nil, restrict_object_type: nil, role_id: nil, user_id: nil, request_options: {})
      #
      # @param object_id_ [String]
      # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      # @param group_id [String, nil]
      # @param permission [Symbol, Braintrust::Models::Permission, nil]
      # @param restrict_object_type [Symbol, Braintrust::Models::ACLObjectType, nil]
      # @param role_id [String, nil]
      # @param user_id [String, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::ACL]
      #
      # @see Braintrust::Models::ACLFindAndDeleteParams
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

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
