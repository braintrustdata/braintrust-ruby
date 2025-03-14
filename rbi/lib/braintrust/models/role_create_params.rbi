# typed: strong

module Braintrust
  module Models
    class RoleCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig { returns(T.nilable(T::Array[Braintrust::Models::RoleCreateParams::MemberPermission])) }
      def member_permissions
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::RoleCreateParams::MemberPermission]))
          .returns(T.nilable(T::Array[Braintrust::Models::RoleCreateParams::MemberPermission]))
      end
      def member_permissions=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def member_roles
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def member_roles=(_)
      end

      sig { returns(T.nilable(String)) }
      def org_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def org_name=(_)
      end

      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_permissions: T.nilable(T::Array[Braintrust::Models::RoleCreateParams::MemberPermission]),
          member_roles: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
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
