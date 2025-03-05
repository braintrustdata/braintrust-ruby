# typed: strong

module Braintrust
  module Resources
    class Roles
      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_permissions: T.nilable(T::Array[Braintrust::Models::RoleCreateParams::MemberPermission]),
          member_roles: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Role)
      end
      def create(
        name:,
        description: nil,
        member_permissions: nil,
        member_roles: nil,
        org_name: nil,
        request_options: {}
      )
      end

      sig do
        params(
          role_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Role)
      end
      def retrieve(role_id, request_options: {})
      end

      sig do
        params(
          role_id: String,
          add_member_permissions: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::AddMemberPermission]),
          add_member_roles: T.nilable(T::Array[String]),
          description: T.nilable(String),
          name: T.nilable(String),
          remove_member_permissions: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::RemoveMemberPermission]),
          remove_member_roles: T.nilable(T::Array[String]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Role)
      end
      def update(
        role_id,
        add_member_permissions: nil,
        add_member_roles: nil,
        description: nil,
        name: nil,
        remove_member_permissions: nil,
        remove_member_roles: nil,
        request_options: {}
      )
      end

      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          role_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::Role])
      end
      def list(
        ending_before: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        role_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        params(
          role_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Role)
      end
      def delete(role_id, request_options: {})
      end

      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_permissions: T.nilable(T::Array[Braintrust::Models::RoleReplaceParams::MemberPermission]),
          member_roles: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Role)
      end
      def replace(
        name:,
        description: nil,
        member_permissions: nil,
        member_roles: nil,
        org_name: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).void }
      def initialize(client:)
      end
    end
  end
end
