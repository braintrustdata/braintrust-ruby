# typed: strong

module Braintrust
  module Models
    # Type of table that the view corresponds to.
    module ViewType
      extend Braintrust::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ViewType) }
      OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::ViewType::TaggedSymbol) }

      PROJECTS = T.let(:projects, Braintrust::Models::ViewType::TaggedSymbol)
      EXPERIMENTS = T.let(:experiments, Braintrust::Models::ViewType::TaggedSymbol)
      EXPERIMENT = T.let(:experiment, Braintrust::Models::ViewType::TaggedSymbol)
      PLAYGROUNDS = T.let(:playgrounds, Braintrust::Models::ViewType::TaggedSymbol)
      PLAYGROUND = T.let(:playground, Braintrust::Models::ViewType::TaggedSymbol)
      DATASETS = T.let(:datasets, Braintrust::Models::ViewType::TaggedSymbol)
      DATASET = T.let(:dataset, Braintrust::Models::ViewType::TaggedSymbol)
      PROMPTS = T.let(:prompts, Braintrust::Models::ViewType::TaggedSymbol)
      TOOLS = T.let(:tools, Braintrust::Models::ViewType::TaggedSymbol)
      SCORERS = T.let(:scorers, Braintrust::Models::ViewType::TaggedSymbol)
      LOGS = T.let(:logs, Braintrust::Models::ViewType::TaggedSymbol)

      sig { override.returns(T::Array[Braintrust::Models::ViewType::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
