# typed: strong

module Braintrust
  module Models
    class RoleUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::AddMemberPermission])) }
      def add_member_permissions
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::AddMemberPermission]))
          .returns(T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::AddMemberPermission]))
      end
      def add_member_permissions=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def add_member_roles
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def add_member_roles=(_)
      end

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      sig { returns(T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::RemoveMemberPermission])) }
      def remove_member_permissions
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::RemoveMemberPermission]))
          .returns(T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::RemoveMemberPermission]))
      end
      def remove_member_permissions=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def remove_member_roles
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def remove_member_roles=(_)
      end

      sig do
        params(
          add_member_permissions: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::AddMemberPermission]),
          add_member_roles: T.nilable(T::Array[String]),
          description: T.nilable(String),
          name: T.nilable(String),
          remove_member_permissions: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::RemoveMemberPermission]),
          remove_member_roles: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
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
        override
          .returns(
            {
              add_member_permissions: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::AddMemberPermission]),
              add_member_roles: T.nilable(T::Array[String]),
              description: T.nilable(String),
              name: T.nilable(String),
              remove_member_permissions: T.nilable(T::Array[Braintrust::Models::RoleUpdateParams::RemoveMemberPermission]),
              remove_member_roles: T.nilable(T::Array[String]),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      class AddMemberPermission < Braintrust::BaseModel
        sig { returns(Symbol) }
        def permission
        end

        sig { params(_: Symbol).returns(Symbol) }
        def permission=(_)
        end

        sig { returns(T.nilable(Symbol)) }
        def restrict_object_type
        end

        sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
        def restrict_object_type=(_)
        end

        sig { params(permission: Symbol, restrict_object_type: T.nilable(Symbol)).returns(T.attached_class) }
        def self.new(permission:, restrict_object_type: nil)
        end

        sig { override.returns({permission: Symbol, restrict_object_type: T.nilable(Symbol)}) }
        def to_hash
        end
      end

      class RemoveMemberPermission < Braintrust::BaseModel
        sig { returns(Symbol) }
        def permission
        end

        sig { params(_: Symbol).returns(Symbol) }
        def permission=(_)
        end

        sig { returns(T.nilable(Symbol)) }
        def restrict_object_type
        end

        sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
        def restrict_object_type=(_)
        end

        sig { params(permission: Symbol, restrict_object_type: T.nilable(Symbol)).returns(T.attached_class) }
        def self.new(permission:, restrict_object_type: nil)
        end

        sig { override.returns({permission: Symbol, restrict_object_type: T.nilable(Symbol)}) }
        def to_hash
        end
      end
    end
  end
end
