# typed: strong

module Braintrust
  module Models
    # Type of table that the view corresponds to.
    class ViewType < Braintrust::Enum
      abstract!

      Value = type_template(:out) { {fixed: Symbol} }

      PROJECTS = :projects
      EXPERIMENTS = :experiments
      EXPERIMENT = :experiment
      PLAYGROUNDS = :playgrounds
      PLAYGROUND = :playground
      DATASETS = :datasets
      DATASET = :dataset
      PROMPTS = :prompts
      TOOLS = :tools
      SCORERS = :scorers
      LOGS = :logs
    end
  end
end
