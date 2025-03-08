# typed: strong

module Braintrust
  module Models
    class ACLFindAndDeleteParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(String) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      sig { returns(Symbol) }
      def object_type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def object_type=(_)
      end

      sig { returns(T.nilable(String)) }
      def group_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def group_id=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def permission
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def permission=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def restrict_object_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def restrict_object_type=(_)
      end

      sig { returns(T.nilable(String)) }
      def role_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def role_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def user_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def user_id=(_)
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
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(
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
        override
          .returns(
            {
              object_id_: String,
              object_type: Symbol,
              group_id: T.nilable(String),
              permission: T.nilable(Symbol),
              restrict_object_type: T.nilable(Symbol),
              role_id: T.nilable(String),
              user_id: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      class ObjectType < Braintrust::Enum
        abstract!

        ORGANIZATION = :organization
        PROJECT = :project
        EXPERIMENT = :experiment
        DATASET = :dataset
        PROMPT = :prompt
        PROMPT_SESSION = :prompt_session
        GROUP = :group
        ROLE = :role
        ORG_MEMBER = :org_member
        PROJECT_LOG = :project_log
        ORG_PROJECT = :org_project

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end

      class Permission < Braintrust::Enum
        abstract!

        CREATE = T.let(:create, T.nilable(Symbol))
        READ = T.let(:read, T.nilable(Symbol))
        UPDATE = T.let(:update, T.nilable(Symbol))
        DELETE = T.let(:delete, T.nilable(Symbol))
        CREATE_ACLS = T.let(:create_acls, T.nilable(Symbol))
        READ_ACLS = T.let(:read_acls, T.nilable(Symbol))
        UPDATE_ACLS = T.let(:update_acls, T.nilable(Symbol))
        DELETE_ACLS = T.let(:delete_acls, T.nilable(Symbol))

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
