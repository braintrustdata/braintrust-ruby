# frozen_string_literal: true

module Braintrust
  module Models
    # @abstract
    #
    # Type of table that the view corresponds to.
    class ViewType < Braintrust::Enum
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

      finalize!
    end
  end
end
