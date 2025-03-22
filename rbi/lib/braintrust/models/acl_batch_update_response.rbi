# typed: strong

module Braintrust
  module Models
    class ACLBatchUpdateResponse < Braintrust::BaseModel
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
      sig { returns(T::Array[Braintrust::Models::ACL]) }
      def added_acls
      end

      sig { params(_: T::Array[Braintrust::Models::ACL]).returns(T::Array[Braintrust::Models::ACL]) }
      def added_acls=(_)
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
      sig { returns(T::Array[Braintrust::Models::ACL]) }
      def removed_acls
      end

      sig { params(_: T::Array[Braintrust::Models::ACL]).returns(T::Array[Braintrust::Models::ACL]) }
      def removed_acls=(_)
      end

      sig do
        params(
          added_acls: T::Array[T.any(Braintrust::Models::ACL, Braintrust::Util::AnyHash)],
          removed_acls: T::Array[T.any(Braintrust::Models::ACL, Braintrust::Util::AnyHash)]
        )
          .returns(T.attached_class)
      end
      def self.new(added_acls:, removed_acls:)
      end

      sig do
        override
          .returns({added_acls: T::Array[Braintrust::Models::ACL], removed_acls: T::Array[Braintrust::Models::ACL]})
      end
      def to_hash
      end
    end
  end
end
