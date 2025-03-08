# typed: strong

module Braintrust
  module Models
    class GroupUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(T::Array[String])) }
      def add_member_groups
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def add_member_groups=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def add_member_users
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def add_member_users=(_)
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

      sig { returns(T.nilable(T::Array[String])) }
      def remove_member_groups
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def remove_member_groups=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def remove_member_users
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def remove_member_users=(_)
      end

      sig do
        params(
          add_member_groups: T.nilable(T::Array[String]),
          add_member_users: T.nilable(T::Array[String]),
          description: T.nilable(String),
          name: T.nilable(String),
          remove_member_groups: T.nilable(T::Array[String]),
          remove_member_users: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
        add_member_groups: nil,
        add_member_users: nil,
        description: nil,
        name: nil,
        remove_member_groups: nil,
        remove_member_users: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              add_member_groups: T.nilable(T::Array[String]),
              add_member_users: T.nilable(T::Array[String]),
              description: T.nilable(String),
              name: T.nilable(String),
              remove_member_groups: T.nilable(T::Array[String]),
              remove_member_users: T.nilable(T::Array[String]),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
