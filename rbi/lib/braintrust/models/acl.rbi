# typed: strong

module Braintrust
  module Models
    class ACL < Braintrust::Internal::Type::BaseModel
      # Unique identifier for the acl
      sig { returns(String) }
      attr_accessor :id

      # The organization the ACL's referred object belongs to
      sig { returns(String) }
      attr_accessor :_object_org_id

      # The id of the object the ACL applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::Models::ACLObjectType::TaggedSymbol) }
      attr_accessor :object_type

      # Date of acl creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   be provided
      sig { returns(T.nilable(String)) }
      attr_accessor :group_id

      # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      sig { returns(T.nilable(Braintrust::Models::Permission::TaggedSymbol)) }
      attr_accessor :permission

      # When setting a permission directly, optionally restricts the permission grant to
      #   just the specified object type. Cannot be set alongside a `role_id`.
      sig { returns(T.nilable(Braintrust::Models::ACLObjectType::TaggedSymbol)) }
      attr_accessor :restrict_object_type

      # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      sig { returns(T.nilable(String)) }
      attr_accessor :role_id

      # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   be provided
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

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
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          created: T.nilable(Time),
          group_id: T.nilable(String),
          permission: T.nilable(Braintrust::Models::Permission::OrSymbol),
          restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol),
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
              object_type: Braintrust::Models::ACLObjectType::TaggedSymbol,
              created: T.nilable(Time),
              group_id: T.nilable(String),
              permission: T.nilable(Braintrust::Models::Permission::TaggedSymbol),
              restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::TaggedSymbol),
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
