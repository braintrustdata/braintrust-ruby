# typed: strong

module Braintrust
  module Models
    # The type of the configured score
    module ProjectScoreType
      extend Braintrust::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ProjectScoreType) }
      OrSymbol = T.type_alias { T.any(Symbol, String, Braintrust::Models::ProjectScoreType::TaggedSymbol) }

      SLIDER = T.let(:slider, Braintrust::Models::ProjectScoreType::TaggedSymbol)
      CATEGORICAL = T.let(:categorical, Braintrust::Models::ProjectScoreType::TaggedSymbol)
      WEIGHTED = T.let(:weighted, Braintrust::Models::ProjectScoreType::TaggedSymbol)
      MINIMUM = T.let(:minimum, Braintrust::Models::ProjectScoreType::TaggedSymbol)
      MAXIMUM = T.let(:maximum, Braintrust::Models::ProjectScoreType::TaggedSymbol)
      ONLINE = T.let(:online, Braintrust::Models::ProjectScoreType::TaggedSymbol)
      FREE_FORM = T.let(:"free-form", Braintrust::Models::ProjectScoreType::TaggedSymbol)

      sig { override.returns(T::Array[Braintrust::Models::ProjectScoreType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
