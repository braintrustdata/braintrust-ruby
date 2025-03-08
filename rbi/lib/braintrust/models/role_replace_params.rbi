# typed: strong

module Braintrust
  module Models
    class RoleReplaceParams < Braintrust::BaseModel
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

      sig { returns(T.nilable(T::Array[Braintrust::Models::RoleReplaceParams::MemberPermission])) }
      def member_permissions
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::RoleReplaceParams::MemberPermission]))
          .returns(T.nilable(T::Array[Braintrust::Models::RoleReplaceParams::MemberPermission]))
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
          member_permissions: T.nilable(T::Array[Braintrust::Models::RoleReplaceParams::MemberPermission]),
          member_roles: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(
        name:,
        description: nil,
        member_permissions: nil,
        member_roles: nil,
        org_name: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              name: String,
              description: T.nilable(String),
              member_permissions: T.nilable(T::Array[Braintrust::Models::RoleReplaceParams::MemberPermission]),
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

        sig { params(permission: Symbol, restrict_object_type: T.nilable(Symbol)).void }
        def initialize(permission:, restrict_object_type: nil)
        end

        sig { override.returns({permission: Symbol, restrict_object_type: T.nilable(Symbol)}) }
        def to_hash
        end

        class Permission < Braintrust::Enum
          abstract!

          CREATE = :create
          READ = :read
          UPDATE = :update
          DELETE = :delete
          CREATE_ACLS = :create_acls
          READ_ACLS = :read_acls
          UPDATE_ACLS = :update_acls
          DELETE_ACLS = :delete_acls

          class << self
            sig { override.returns(T::Array[Symbol]) }
            def values
            end
          end
        end

        class RestrictObjectType < Braintrust::Enum
          abstract!

          ORGANIZATION = T.let(:organization, T.nilable(Symbol))
          PROJECT = T.let(:project, T.nilable(Symbol))
          EXPERIMENT = T.let(:experiment, T.nilable(Symbol))
          DATASET = T.let(:dataset, T.nilable(Symbol))
          PROMPT = T.let(:prompt, T.nilable(Symbol))
          PROMPT_SESSION = T.let(:prompt_session, T.nilable(Symbol))
          GROUP = T.let(:group, T.nilable(Symbol))
          ROLE = T.let(:role, T.nilable(Symbol))
          ORG_MEMBER = T.let(:org_member, T.nilable(Symbol))
          PROJECT_LOG = T.let(:project_log, T.nilable(Symbol))
          ORG_PROJECT = T.let(:org_project, T.nilable(Symbol))

          class << self
            sig { override.returns(T::Array[Symbol]) }
            def values
            end
          end
        end
      end
    end
  end
end
