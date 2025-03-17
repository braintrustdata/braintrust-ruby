# typed: strong

module Braintrust
  module Models
    # Each permission permits a certain type of operation on an object in the system
    #
    #   Permissions can be assigned to to objects on an individual basis, or grouped
    #   into roles
    class Permission < Braintrust::Enum
      abstract!

      Value = type_template(:out) { {fixed: Symbol} }

      CREATE = :create
      READ = :read
      UPDATE = :update
      DELETE = :delete
      CREATE_ACLS = :create_acls
      READ_ACLS = :read_acls
      UPDATE_ACLS = :update_acls
      DELETE_ACLS = :delete_acls
    end
  end
end
