# typed: strong

module Braintrust
  module Models
    class ACLFindAndDeleteParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # The id of the object the ACL applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
      attr_accessor :object_type

      # Id of the group the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   be provided
      sig { returns(T.nilable(String)) }
      attr_accessor :group_id

      # Permission the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      sig { returns(T.nilable(Braintrust::Models::Permission::OrSymbol)) }
      attr_accessor :permission

      # When setting a permission directly, optionally restricts the permission grant to
      #   just the specified object type. Cannot be set alongside a `role_id`.
      sig { returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)) }
      attr_accessor :restrict_object_type

      # Id of the role the ACL grants. Exactly one of `permission` and `role_id` will be
      #   provided
      sig { returns(T.nilable(String)) }
      attr_accessor :role_id

      # Id of the user the ACL applies to. Exactly one of `user_id` and `group_id` will
      #   be provided
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          group_id: T.nilable(String),
          permission: T.nilable(Braintrust::Models::Permission::OrSymbol),
          restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol),
          role_id: T.nilable(String),
          user_id: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        object_id_:,
        object_type:,
        group_id: nil,
        permission: nil,
        restrict_object_type: nil,
        role_id: nil,
        user_id: nil,
        request_options: {}
      ); end
      sig do
        override
          .returns(
            {
              object_id_: String,
              object_type: Braintrust::Models::ACLObjectType::OrSymbol,
              group_id: T.nilable(String),
              permission: T.nilable(Braintrust::Models::Permission::OrSymbol),
              restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol),
              role_id: T.nilable(String),
              user_id: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash; end
    end
  end
end
