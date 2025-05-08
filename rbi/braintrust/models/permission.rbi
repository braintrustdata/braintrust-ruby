# typed: strong

module Braintrust
  module Models
    # Each permission permits a certain type of operation on an object in the system
    #
    # Permissions can be assigned to to objects on an individual basis, or grouped
    # into roles
    module Permission
      extend Braintrust::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Permission) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      CREATE = T.let(:create, Braintrust::Permission::TaggedSymbol)
      READ = T.let(:read, Braintrust::Permission::TaggedSymbol)
      UPDATE = T.let(:update, Braintrust::Permission::TaggedSymbol)
      DELETE = T.let(:delete, Braintrust::Permission::TaggedSymbol)
      CREATE_ACLS = T.let(:create_acls, Braintrust::Permission::TaggedSymbol)
      READ_ACLS = T.let(:read_acls, Braintrust::Permission::TaggedSymbol)
      UPDATE_ACLS = T.let(:update_acls, Braintrust::Permission::TaggedSymbol)
      DELETE_ACLS = T.let(:delete_acls, Braintrust::Permission::TaggedSymbol)

      sig { override.returns(T::Array[Braintrust::Permission::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
