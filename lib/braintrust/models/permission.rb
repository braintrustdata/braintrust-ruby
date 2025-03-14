# frozen_string_literal: true

module Braintrust
  module Models
    # @abstract
    #
    # Each permission permits a certain type of operation on an object in the system
    #
    #   Permissions can be assigned to to objects on an individual basis, or grouped
    #   into roles
    class Permission < Braintrust::Enum
      CREATE = :create
      READ = :read
      UPDATE = :update
      DELETE = :delete
      CREATE_ACLS = :create_acls
      READ_ACLS = :read_acls
      UPDATE_ACLS = :update_acls
      DELETE_ACLS = :delete_acls

      finalize!
    end
  end
end
