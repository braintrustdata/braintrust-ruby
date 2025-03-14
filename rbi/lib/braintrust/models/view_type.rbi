# typed: strong

module Braintrust
  module Models
    class ViewType < Braintrust::Enum
      abstract!

      PROJECTS = T.let(:projects, T.nilable(Symbol))
      EXPERIMENTS = T.let(:experiments, T.nilable(Symbol))
      EXPERIMENT = T.let(:experiment, T.nilable(Symbol))
      PLAYGROUNDS = T.let(:playgrounds, T.nilable(Symbol))
      PLAYGROUND = T.let(:playground, T.nilable(Symbol))
      DATASETS = T.let(:datasets, T.nilable(Symbol))
      DATASET = T.let(:dataset, T.nilable(Symbol))
      PROMPTS = T.let(:prompts, T.nilable(Symbol))
      TOOLS = T.let(:tools, T.nilable(Symbol))
      SCORERS = T.let(:scorers, T.nilable(Symbol))
      LOGS = T.let(:logs, T.nilable(Symbol))

      class << self
        sig { override.returns(T::Array[Symbol]) }
        def values
        end
      end
    end
  end
end
