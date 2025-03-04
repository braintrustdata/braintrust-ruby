# typed: strong

module Braintrust
  module Resources
    class ACLs
      sig do
        params(
          object_id_: String,
          object_type: Symbol,
          group_id: T.nilable(String),
          permission: T.nilable(Symbol),
          restrict_object_type: T.nilable(Symbol),
          role_id: T.nilable(String),
          user_id: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ACL)
      end
      def create(
        object_id_:,
        object_type:,
        group_id: nil,
        permission: nil,
        restrict_object_type: nil,
        role_id: nil,
        user_id: nil,
        request_options: {}
      )
      end

      sig do
        params(
          acl_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ACL)
      end
      def retrieve(acl_id, request_options: {})
      end

      sig do
        params(
          object_id_: String,
          object_type: Symbol,
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::ACL])
      end
      def list(
        object_id_:,
        object_type:,
        ending_before: nil,
        ids: nil,
        limit: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        params(
          acl_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ACL)
      end
      def delete(acl_id, request_options: {})
      end

      sig do
        params(
          add_acls: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::AddACL]),
          remove_acls: T.nilable(T::Array[Braintrust::Models::ACLBatchUpdateParams::RemoveACL]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ACLBatchUpdateResponse)
      end
      def batch_update(add_acls: nil, remove_acls: nil, request_options: {})
      end

      sig do
        params(
          object_id_: String,
          object_type: Symbol,
          group_id: T.nilable(String),
          permission: T.nilable(Symbol),
          restrict_object_type: T.nilable(Symbol),
          role_id: T.nilable(String),
          user_id: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ACL)
      end
      def find_and_delete(
        object_id_:,
        object_type:,
        group_id: nil,
        permission: nil,
        restrict_object_type: nil,
        role_id: nil,
        user_id: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).void }
      def initialize(client:)
      end
    end
  end
end
