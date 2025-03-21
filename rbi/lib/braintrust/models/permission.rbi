# typed: strong

module Braintrust
  module Models
    # Each permission permits a certain type of operation on an object in the system
    #
    #   Permissions can be assigned to to objects on an individual basis, or grouped
    #   into roles
    module Permission
      extend Braintrust::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Permission) }
      OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::Permission::TaggedSymbol) }

      CREATE = T.let(:create, Braintrust::Models::Permission::OrSymbol)
      READ = T.let(:read, Braintrust::Models::Permission::OrSymbol)
      UPDATE = T.let(:update, Braintrust::Models::Permission::OrSymbol)
      DELETE = T.let(:delete, Braintrust::Models::Permission::OrSymbol)
      CREATE_ACLS = T.let(:create_acls, Braintrust::Models::Permission::OrSymbol)
      READ_ACLS = T.let(:read_acls, Braintrust::Models::Permission::OrSymbol)
      UPDATE_ACLS = T.let(:update_acls, Braintrust::Models::Permission::OrSymbol)
      DELETE_ACLS = T.let(:delete_acls, Braintrust::Models::Permission::OrSymbol)
    end
  end
end
