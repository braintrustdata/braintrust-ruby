# typed: strong

module Braintrust
  module Models
    class ACLCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # The id of the object the ACL applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::ACLObjectType::OrSymbol) }
      attr_accessor :object_type

      # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      # be provided
      sig { returns(T.nilable(String)) }
      attr_accessor :group_id

      # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      # provided
      sig { returns(T.nilable(Braintrust::Permission::OrSymbol)) }
      attr_accessor :permission

      # When setting a permission directly, optionally restricts the permission grant to
      # just the specified object type. Cannot be set alongside a `role_id`.
      sig { returns(T.nilable(Braintrust::ACLObjectType::OrSymbol)) }
      attr_accessor :restrict_object_type

      # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      # provided
      sig { returns(T.nilable(String)) }
      attr_accessor :role_id

      # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      # be provided
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          object_id_: String,
          object_type: Braintrust::ACLObjectType::OrSymbol,
          group_id: T.nilable(String),
          permission: T.nilable(Braintrust::Permission::OrSymbol),
          restrict_object_type: T.nilable(Braintrust::ACLObjectType::OrSymbol),
          role_id: T.nilable(String),
          user_id: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The id of the object the ACL applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
        # be provided
        group_id: nil,
        # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
        # provided
        permission: nil,
        # When setting a permission directly, optionally restricts the permission grant to
        # just the specified object type. Cannot be set alongside a `role_id`.
        restrict_object_type: nil,
        # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
        # provided
        role_id: nil,
        # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
        # be provided
        user_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            object_id_: String,
            object_type: Braintrust::ACLObjectType::OrSymbol,
            group_id: T.nilable(String),
            permission: T.nilable(Braintrust::Permission::OrSymbol),
            restrict_object_type:
              T.nilable(Braintrust::ACLObjectType::OrSymbol),
            role_id: T.nilable(String),
            user_id: T.nilable(String),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
