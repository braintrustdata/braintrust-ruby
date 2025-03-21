# typed: strong

module Braintrust
  module Models
    # Type of table that the view corresponds to.
    module ViewType
      extend Braintrust::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ViewType) }
      OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::ViewType::TaggedSymbol) }

      PROJECTS = T.let(:projects, Braintrust::Models::ViewType::OrSymbol)
      EXPERIMENTS = T.let(:experiments, Braintrust::Models::ViewType::OrSymbol)
      EXPERIMENT = T.let(:experiment, Braintrust::Models::ViewType::OrSymbol)
      PLAYGROUNDS = T.let(:playgrounds, Braintrust::Models::ViewType::OrSymbol)
      PLAYGROUND = T.let(:playground, Braintrust::Models::ViewType::OrSymbol)
      DATASETS = T.let(:datasets, Braintrust::Models::ViewType::OrSymbol)
      DATASET = T.let(:dataset, Braintrust::Models::ViewType::OrSymbol)
      PROMPTS = T.let(:prompts, Braintrust::Models::ViewType::OrSymbol)
      TOOLS = T.let(:tools, Braintrust::Models::ViewType::OrSymbol)
      SCORERS = T.let(:scorers, Braintrust::Models::ViewType::OrSymbol)
      LOGS = T.let(:logs, Braintrust::Models::ViewType::OrSymbol)
    end
  end
end
