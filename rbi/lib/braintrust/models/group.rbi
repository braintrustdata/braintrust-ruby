# typed: strong

module Braintrust
  module Models
    class Group < Braintrust::BaseModel
      # Unique identifier for the group
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # Name of the group
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Unique id for the organization that the group belongs under
      #
      #   It is forbidden to change the org after creating a group
      sig { returns(String) }
      def org_id
      end

      sig { params(_: String).returns(String) }
      def org_id=(_)
      end

      # Date of group creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      # Date of group deletion, or null if the group is still active
      sig { returns(T.nilable(Time)) }
      def deleted_at
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def deleted_at=(_)
      end

      # Textual description of the group
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # Ids of the groups this group inherits from
      #
      #   An inheriting group has all the users contained in its member groups, as well as
      #   all of their inherited users
      sig { returns(T.nilable(T::Array[String])) }
      def member_groups
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def member_groups=(_)
      end

      # Ids of users which belong to this group
      sig { returns(T.nilable(T::Array[String])) }
      def member_users
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def member_users=(_)
      end

      # Identifies the user who created the group
      sig { returns(T.nilable(String)) }
      def user_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def user_id=(_)
      end

      # A group is a collection of users which can be assigned an ACL
      #
      #   Groups can consist of individual users, as well as a set of groups they inherit
      #   from
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
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        name:,
        org_id:,
        created: nil,
        deleted_at: nil,
        description: nil,
        member_groups: nil,
        member_users: nil,
        user_id: nil
      )
      end

      sig do
        override
          .returns(
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
