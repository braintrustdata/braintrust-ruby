# typed: strong

module Braintrust
  module Models
    class GroupUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # A list of group IDs to add to the group's inheriting-from set
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :add_member_groups

      # A list of user IDs to add to the group
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :add_member_users

      # Textual description of the group
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Name of the group
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # A list of group IDs to remove from the group's inheriting-from set
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :remove_member_groups

      # A list of user IDs to remove from the group
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :remove_member_users

      sig do
        params(
          add_member_groups: T.nilable(T::Array[String]),
          add_member_users: T.nilable(T::Array[String]),
          description: T.nilable(String),
          name: T.nilable(String),
          remove_member_groups: T.nilable(T::Array[String]),
          remove_member_users: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
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
