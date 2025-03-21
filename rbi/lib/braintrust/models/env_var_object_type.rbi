# typed: strong

module Braintrust
  module Models
    # The type of the object the environment variable is scoped for
    module EnvVarObjectType
      extend Braintrust::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::EnvVarObjectType) }
      OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::EnvVarObjectType::TaggedSymbol) }

      ORGANIZATION = T.let(:organization, Braintrust::Models::EnvVarObjectType::OrSymbol)
      PROJECT = T.let(:project, Braintrust::Models::EnvVarObjectType::OrSymbol)
      FUNCTION = T.let(:function, Braintrust::Models::EnvVarObjectType::OrSymbol)
    end
  end
end
