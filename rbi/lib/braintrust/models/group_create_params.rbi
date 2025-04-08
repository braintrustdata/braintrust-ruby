# typed: strong

module Braintrust
  module Models
    class GroupCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # Name of the group
      sig { returns(String) }
      attr_accessor :name

      # Textual description of the group
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Ids of the groups this group inherits from
      #
      #   An inheriting group has all the users contained in its member groups, as well as
      #   all of their inherited users
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :member_groups

      # Ids of users which belong to this group
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :member_users

      # For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the group belongs in.
      sig { returns(T.nilable(String)) }
      attr_accessor :org_name

      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_groups: T.nilable(T::Array[String]),
          member_users: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
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
      def to_hash; end
    end
  end
end
