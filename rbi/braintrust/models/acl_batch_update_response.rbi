# typed: strong

module Braintrust
  module Models
    class ACLBatchUpdateResponse < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # An ACL grants a certain permission or role to a certain user or group on an
      # object.
      #
      # ACLs are inherited across the object hierarchy. So for example, if a user has
      # read permissions on a project, they will also have read permissions on any
      # experiment, dataset, etc. created within that project.
      #
      # To restrict a grant to a particular sub-object, you may specify
      # `restrict_object_type` in the ACL, as part of a direct permission grant or as
      # part of a role.
      sig { returns(T::Array[Braintrust::ACL]) }
      attr_accessor :added_acls

      # An ACL grants a certain permission or role to a certain user or group on an
      # object.
      #
      # ACLs are inherited across the object hierarchy. So for example, if a user has
      # read permissions on a project, they will also have read permissions on any
      # experiment, dataset, etc. created within that project.
      #
      # To restrict a grant to a particular sub-object, you may specify
      # `restrict_object_type` in the ACL, as part of a direct permission grant or as
      # part of a role.
      sig { returns(T::Array[Braintrust::ACL]) }
      attr_accessor :removed_acls

      sig do
        params(
          added_acls: T::Array[Braintrust::ACL::OrHash],
          removed_acls: T::Array[Braintrust::ACL::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # An ACL grants a certain permission or role to a certain user or group on an
        # object.
        #
        # ACLs are inherited across the object hierarchy. So for example, if a user has
        # read permissions on a project, they will also have read permissions on any
        # experiment, dataset, etc. created within that project.
        #
        # To restrict a grant to a particular sub-object, you may specify
        # `restrict_object_type` in the ACL, as part of a direct permission grant or as
        # part of a role.
        added_acls:,
        # An ACL grants a certain permission or role to a certain user or group on an
        # object.
        #
        # ACLs are inherited across the object hierarchy. So for example, if a user has
        # read permissions on a project, they will also have read permissions on any
        # experiment, dataset, etc. created within that project.
        #
        # To restrict a grant to a particular sub-object, you may specify
        # `restrict_object_type` in the ACL, as part of a direct permission grant or as
        # part of a role.
        removed_acls:
      )
      end

      sig do
        override.returns(
          {
            added_acls: T::Array[Braintrust::ACL],
            removed_acls: T::Array[Braintrust::ACL]
          }
        )
      end
      def to_hash
      end
    end
  end
end
