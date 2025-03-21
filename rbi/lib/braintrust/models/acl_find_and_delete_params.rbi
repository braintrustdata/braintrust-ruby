# typed: strong

module Braintrust
  module Models
    class ACLFindAndDeleteParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # The id of the object the ACL applies to
      sig { returns(String) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      # The object type that the ACL applies to
      sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
      def object_type
      end

      sig do
        params(_: Braintrust::Models::ACLObjectType::OrSymbol).returns(Braintrust::Models::ACLObjectType::OrSymbol)
      end
      def object_type=(_)
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
      sig { returns(T.nilable(Braintrust::Models::Permission::OrSymbol)) }
      def permission
      end

      sig do
        params(_: T.nilable(Braintrust::Models::Permission::OrSymbol))
          .returns(T.nilable(Braintrust::Models::Permission::OrSymbol))
      end
      def permission=(_)
      end

      # When setting a permission directly, optionally restricts the permission grant to
      #   just the specified object type. Cannot be set alongside a `role_id`.
      sig { returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol)) }
      def restrict_object_type
      end

      sig do
        params(_: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol))
          .returns(T.nilable(Braintrust::Models::ACLObjectType::OrSymbol))
      end
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

      sig do
        params(
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          group_id: T.nilable(String),
          permission: T.nilable(Braintrust::Models::Permission::OrSymbol),
          restrict_object_type: T.nilable(Braintrust::Models::ACLObjectType::OrSymbol),
          role_id: T.nilable(String),
          user_id: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
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
      )
      end

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
      def to_hash
      end
    end
  end
end
