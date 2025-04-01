# typed: strong

module Braintrust
  module Models
    class RoleCreateParams < Braintrust::BaseModel
      extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the role
      sig { returns(String) }
      attr_accessor :name

      # Textual description of the role
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # (permission, restrict_object_type) tuples which belong to this role
      sig { returns(T.nilable(T::Array[Braintrust::Models::RoleCreateParams::MemberPermission])) }
      attr_accessor :member_permissions

      # Ids of the roles this role inherits from
      #
      #   An inheriting role has all the permissions contained in its member roles, as
      #   well as all of their inherited permissions
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :member_roles

      # For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the role belongs in.
      sig { returns(T.nilable(String)) }
      attr_accessor :org_name

      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_permissions: T.nilable(
            T::Array[T.any(Braintrust::Models::RoleCreateParams::MemberPermission, Braintrust::Util::AnyHash)]
          ),
          member_roles: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(name:, description: nil, member_permissions: nil, member_roles: nil, org_name: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              name: String,
              description: T.nilable(String),
              member_permissions: T.nilable(T::Array[Braintrust::Models::RoleCreateParams::MemberPermission]),
              member_roles: T.nilable(T::Array[String]),
              org_name: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      class MemberPermission < Braintrust::BaseModel
        # Each permission permits a certain type of operation on an object in the system
        #
        #   Permissions can be assigned to to objects on an individual basis, or grouped
        #   into roles
        sig { returns(Braintrust::Models::Permission::OrSymbol) }
        attr_accessor :permission

        # The object type that the ACL applies to
        sig { returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)) }
        attr_accessor :restrict_object_type

        sig do
          params(
            permission: Braintrust::Models::Permission::OrSymbol,
            restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)
          )
            .returns(T.attached_class)
        end
        def self.new(permission:, restrict_object_type: nil)
        end

        sig do
          override
            .returns(
              {
                permission: Braintrust::Models::Permission::OrSymbol,
                restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)
              }
            )
        end
        def to_hash
        end
      end
    end
  end
end
