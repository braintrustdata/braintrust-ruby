# typed: strong

module Braintrust
  module Models
    # The type of the configured score
    module ProjectScoreType
      extend Braintrust::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ProjectScoreType) }
      OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::ProjectScoreType::TaggedSymbol) }

      SLIDER = T.let(:slider, Braintrust::Models::ProjectScoreType::OrSymbol)
      CATEGORICAL = T.let(:categorical, Braintrust::Models::ProjectScoreType::OrSymbol)
      WEIGHTED = T.let(:weighted, Braintrust::Models::ProjectScoreType::OrSymbol)
      MINIMUM = T.let(:minimum, Braintrust::Models::ProjectScoreType::OrSymbol)
      MAXIMUM = T.let(:maximum, Braintrust::Models::ProjectScoreType::OrSymbol)
      ONLINE = T.let(:online, Braintrust::Models::ProjectScoreType::OrSymbol)
      FREE_FORM = T.let(:"free-form", Braintrust::Models::ProjectScoreType::OrSymbol)
    end
  end
end
