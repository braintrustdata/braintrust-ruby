# typed: strong

module Braintrust
  module Models
    class GroupReplaceParams < Braintrust::BaseModel
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

      sig { returns(T.nilable(T::Array[String])) }
      def member_groups
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def member_groups=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def member_users
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def member_users=(_)
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
          member_groups: T.nilable(T::Array[String]),
          member_users: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(
        name:,
        description: nil,
        member_groups: nil,
        member_users: nil,
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
              member_groups: T.nilable(T::Array[String]),
              member_users: T.nilable(T::Array[String]),
              org_name: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
