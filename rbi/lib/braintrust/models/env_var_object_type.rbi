# typed: strong

module Braintrust
  module Models
    # The type of the object the environment variable is scoped for
    module EnvVarObjectType
      extend Braintrust::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::EnvVarObjectType) }
      OrSymbol = T.type_alias { T.any(Symbol, String, Braintrust::Models::EnvVarObjectType::TaggedSymbol) }

      ORGANIZATION = T.let(:organization, Braintrust::Models::EnvVarObjectType::TaggedSymbol)
      PROJECT = T.let(:project, Braintrust::Models::EnvVarObjectType::TaggedSymbol)
      FUNCTION = T.let(:function, Braintrust::Models::EnvVarObjectType::TaggedSymbol)

      sig { override.returns(T::Array[Braintrust::Models::EnvVarObjectType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
