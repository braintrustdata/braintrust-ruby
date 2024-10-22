# frozen_string_literal: true

module Braintrust
  module Models
    class ACLBatchUpdateResponse < BaseModel
      # @!attribute [rw] added_acls
      #   An ACL grants a certain permission or role to a certain user or group on an object.
      #
      # ACLs are inherited across the object hierarchy. So for example, if a user has read permissions on a project, they will also have read permissions on any experiment, dataset, etc. created within that project.
      #
      # To restrict a grant to a particular sub-object, you may specify `restrict_object_type` in the ACL, as part of a direct permission grant or as part of a role.
      #   @return [Array<Braintrust::Models::ACL>]
      required :added_acls, Braintrust::ArrayOf.new(-> { Braintrust::Models::ACL })

      # @!attribute [rw] removed_acls
      #   An ACL grants a certain permission or role to a certain user or group on an object.
      #
      # ACLs are inherited across the object hierarchy. So for example, if a user has read permissions on a project, they will also have read permissions on any experiment, dataset, etc. created within that project.
      #
      # To restrict a grant to a particular sub-object, you may specify `restrict_object_type` in the ACL, as part of a direct permission grant or as part of a role.
      #   @return [Array<Braintrust::Models::ACL>]
      required :removed_acls, Braintrust::ArrayOf.new(-> { Braintrust::Models::ACL })

      # @!parse
      #   # Create a new instance of ACLBatchUpdateResponse from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Array<Object>] :added_acls An ACL grants a certain permission or role to a certain user or group on an
      #   #     object.
      #   #
      #   #     ACLs are inherited across the object hierarchy. So for example, if a user has
      #   #     read permissions on a project, they will also have read permissions on any
      #   #     experiment, dataset, etc. created within that project.
      #   #
      #   #     To restrict a grant to a particular sub-object, you may specify
      #   #     `restrict_object_type` in the ACL, as part of a direct permission grant or as
      #   #     part of a role.
      #   #   @option data [Array<Object>] :removed_acls An ACL grants a certain permission or role to a certain user or group on an
      #   #     object.
      #   #
      #   #     ACLs are inherited across the object hierarchy. So for example, if a user has
      #   #     read permissions on a project, they will also have read permissions on any
      #   #     experiment, dataset, etc. created within that project.
      #   #
      #   #     To restrict a grant to a particular sub-object, you may specify
      #   #     `restrict_object_type` in the ACL, as part of a direct permission grant or as
      #   #     part of a role.
      #   def initialize(data = {}) = super
    end
  end
end
