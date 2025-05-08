# typed: strong

module Braintrust
  module Models
    # The type of the object the environment variable is scoped for
    module EnvVarObjectType
      extend Braintrust::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Braintrust::EnvVarObjectType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      ORGANIZATION =
        T.let(:organization, Braintrust::EnvVarObjectType::TaggedSymbol)
      PROJECT = T.let(:project, Braintrust::EnvVarObjectType::TaggedSymbol)
      FUNCTION = T.let(:function, Braintrust::EnvVarObjectType::TaggedSymbol)

      sig do
        override.returns(T::Array[Braintrust::EnvVarObjectType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
