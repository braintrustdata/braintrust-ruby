# typed: strong

module Braintrust
  module Models
    # The type of the configured score
    module ProjectScoreType
      extend Braintrust::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Braintrust::ProjectScoreType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      SLIDER = T.let(:slider, Braintrust::ProjectScoreType::TaggedSymbol)
      CATEGORICAL =
        T.let(:categorical, Braintrust::ProjectScoreType::TaggedSymbol)
      WEIGHTED = T.let(:weighted, Braintrust::ProjectScoreType::TaggedSymbol)
      MINIMUM = T.let(:minimum, Braintrust::ProjectScoreType::TaggedSymbol)
      MAXIMUM = T.let(:maximum, Braintrust::ProjectScoreType::TaggedSymbol)
      ONLINE = T.let(:online, Braintrust::ProjectScoreType::TaggedSymbol)
      FREE_FORM =
        T.let(:"free-form", Braintrust::ProjectScoreType::TaggedSymbol)

      sig do
        override.returns(T::Array[Braintrust::ProjectScoreType::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
