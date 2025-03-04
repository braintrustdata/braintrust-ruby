# typed: strong

module Braintrust
  module Models
    class ACLListParams < Braintrust::BaseModel
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
      def ending_before
      end

      sig { params(_: String).returns(String) }
      def ending_before=(_)
      end

      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def ids
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def ids=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def limit
      end

      sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
      def limit=(_)
      end

      sig { returns(T.nilable(String)) }
      def starting_after
      end

      sig { params(_: String).returns(String) }
      def starting_after=(_)
      end

      sig do
        params(
          object_id_: String,
          object_type: Symbol,
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          starting_after: String,
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(
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
        override
          .returns(
            {
              object_id_: String,
              object_type: Symbol,
              ending_before: String,
              ids: T.any(String, T::Array[String]),
              limit: T.nilable(Integer),
              starting_after: String,
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

        sig { override.returns(T::Array[Symbol]) }
        def self.values
        end
      end

      class IDs < Braintrust::Union
        abstract!

        StringArray = T.type_alias { T::Array[String] }

        sig { override.returns([[NilClass, String], [NilClass, T::Array[String]]]) }
        private_class_method def self.variants
        end
      end
    end
  end
end
