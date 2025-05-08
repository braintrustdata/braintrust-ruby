# typed: strong

module Braintrust
  module Models
    # Type of table that the view corresponds to.
    module ViewType
      extend Braintrust::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::ViewType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PROJECTS = T.let(:projects, Braintrust::ViewType::TaggedSymbol)
      EXPERIMENTS = T.let(:experiments, Braintrust::ViewType::TaggedSymbol)
      EXPERIMENT = T.let(:experiment, Braintrust::ViewType::TaggedSymbol)
      PLAYGROUNDS = T.let(:playgrounds, Braintrust::ViewType::TaggedSymbol)
      PLAYGROUND = T.let(:playground, Braintrust::ViewType::TaggedSymbol)
      DATASETS = T.let(:datasets, Braintrust::ViewType::TaggedSymbol)
      DATASET = T.let(:dataset, Braintrust::ViewType::TaggedSymbol)
      PROMPTS = T.let(:prompts, Braintrust::ViewType::TaggedSymbol)
      TOOLS = T.let(:tools, Braintrust::ViewType::TaggedSymbol)
      SCORERS = T.let(:scorers, Braintrust::ViewType::TaggedSymbol)
      LOGS = T.let(:logs, Braintrust::ViewType::TaggedSymbol)

      sig { override.returns(T::Array[Braintrust::ViewType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
