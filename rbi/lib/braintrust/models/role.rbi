# typed: strong

module Braintrust
  module Models
    class Role < Braintrust::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      sig { returns(T.nilable(Time)) }
      def deleted_at
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def deleted_at=(_)
      end

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig { returns(T.nilable(T::Array[Braintrust::Models::Role::MemberPermission])) }
      def member_permissions
      end

      sig do
        params(_: T.nilable(T::Array[Braintrust::Models::Role::MemberPermission]))
          .returns(T.nilable(T::Array[Braintrust::Models::Role::MemberPermission]))
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
      def org_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def org_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def user_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def user_id=(_)
      end

      sig do
        params(
          id: String,
          name: String,
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          description: T.nilable(String),
          member_permissions: T.nilable(T::Array[Braintrust::Models::Role::MemberPermission]),
          member_roles: T.nilable(T::Array[String]),
          org_id: T.nilable(String),
          user_id: T.nilable(String)
        )
          .void
      end
      def initialize(
        id:,
        name:,
        created: nil,
        deleted_at: nil,
        description: nil,
        member_permissions: nil,
        member_roles: nil,
        org_id: nil,
        user_id: nil
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              created: T.nilable(Time),
              deleted_at: T.nilable(Time),
              description: T.nilable(String),
              member_permissions: T.nilable(T::Array[Braintrust::Models::Role::MemberPermission]),
              member_roles: T.nilable(T::Array[String]),
              org_id: T.nilable(String),
              user_id: T.nilable(String)
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

          sig { override.returns(T::Array[Symbol]) }
          def self.values
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

          sig { override.returns(T::Array[Symbol]) }
          def self.values
          end
        end
      end
    end
  end
end
