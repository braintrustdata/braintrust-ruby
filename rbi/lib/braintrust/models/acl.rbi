# typed: strong

module Braintrust
  module Models
    class ACL < Braintrust::BaseModel
      # Unique identifier for the acl
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # The organization the ACL's referred object belongs to
      sig { returns(String) }
      def _object_org_id
      end

      sig { params(_: String).returns(String) }
      def _object_org_id=(_)
      end

      # The id of the object the ACL applies to
      sig { returns(String) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      # The object type that the ACL applies to
      sig { returns(Symbol) }
      def object_type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def object_type=(_)
      end

      # Date of acl creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   be provided
      sig { returns(T.nilable(String)) }
      def group_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def group_id=(_)
      end

      # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      sig { returns(T.nilable(Symbol)) }
      def permission
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def permission=(_)
      end

      # When setting a permission directly, optionally restricts the permission grant to
      #   just the specified object type. Cannot be set alongside a `role_id`.
      sig { returns(T.nilable(Symbol)) }
      def restrict_object_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def restrict_object_type=(_)
      end

      # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      sig { returns(T.nilable(String)) }
      def role_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def role_id=(_)
      end

      # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   be provided
      sig { returns(T.nilable(String)) }
      def user_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def user_id=(_)
      end

      # An ACL grants a certain permission or role to a certain user or group on an
      #   object.
      #
      #   ACLs are inherited across the object hierarchy. So for example, if a user has
      #   read permissions on a project, they will also have read permissions on any
      #   experiment, dataset, etc. created within that project.
      #
      #   To restrict a grant to a particular sub-object, you may specify
      #   `restrict_object_type` in the ACL, as part of a direct permission grant or as
      #   part of a role.
      sig do
        params(
          id: String,
          _object_org_id: String,
          object_id_: String,
          object_type: Symbol,
          created: T.nilable(Time),
          group_id: T.nilable(String),
          permission: T.nilable(Symbol),
          restrict_object_type: T.nilable(Symbol),
          role_id: T.nilable(String),
          user_id: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        _object_org_id:,
        object_id_:,
        object_type:,
        created: nil,
        group_id: nil,
        permission: nil,
        restrict_object_type: nil,
        role_id: nil,
        user_id: nil
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              _object_org_id: String,
              object_id_: String,
              object_type: Symbol,
              created: T.nilable(Time),
              group_id: T.nilable(String),
              permission: T.nilable(Symbol),
              restrict_object_type: T.nilable(Symbol),
              role_id: T.nilable(String),
              user_id: T.nilable(String)
            }
          )
      end
      def to_hash
      end
    end
  end
end
