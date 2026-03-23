# frozen_string_literal: true

module Braintrust
  module Models
    # Each permission permits a certain type of operation on an object in the system
    #
    # Permissions can be assigned to to objects on an individual basis, or grouped
    # into roles
    module Permission
      extend Braintrust::Internal::Type::Enum

      CREATE = :create
      READ = :read
      UPDATE = :update
      DELETE = :delete
      CREATE_ACLS = :create_acls
      READ_ACLS = :read_acls
      UPDATE_ACLS = :update_acls
      DELETE_ACLS = :delete_acls

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
