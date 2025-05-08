# typed: strong

module Braintrust
  module Models
    class Group < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Unique identifier for the group
      sig { returns(String) }
      attr_accessor :id

      # Name of the group
      sig { returns(String) }
      attr_accessor :name

      # Unique id for the organization that the group belongs under
      #
      # It is forbidden to change the org after creating a group
      sig { returns(String) }
      attr_accessor :org_id

      # Date of group creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Date of group deletion, or null if the group is still active
      sig { returns(T.nilable(Time)) }
      attr_accessor :deleted_at

      # Textual description of the group
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Ids of the groups this group inherits from
      #
      # An inheriting group has all the users contained in its member groups, as well as
      # all of their inherited users
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :member_groups

      # Ids of users which belong to this group
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :member_users

      # Identifies the user who created the group
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      # A group is a collection of users which can be assigned an ACL
      #
      # Groups can consist of individual users, as well as a set of groups they inherit
      # from
      sig do
        params(
          id: String,
          name: String,
          org_id: String,
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          description: T.nilable(String),
          member_groups: T.nilable(T::Array[String]),
          member_users: T.nilable(T::Array[String]),
          user_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the group
        id:,
        # Name of the group
        name:,
        # Unique id for the organization that the group belongs under
        #
        # It is forbidden to change the org after creating a group
        org_id:,
        # Date of group creation
        created: nil,
        # Date of group deletion, or null if the group is still active
        deleted_at: nil,
        # Textual description of the group
        description: nil,
        # Ids of the groups this group inherits from
        #
        # An inheriting group has all the users contained in its member groups, as well as
        # all of their inherited users
        member_groups: nil,
        # Ids of users which belong to this group
        member_users: nil,
        # Identifies the user who created the group
        user_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            org_id: String,
            created: T.nilable(Time),
            deleted_at: T.nilable(Time),
            description: T.nilable(String),
            member_groups: T.nilable(T::Array[String]),
            member_users: T.nilable(T::Array[String]),
            user_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
