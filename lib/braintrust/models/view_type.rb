# frozen_string_literal: true

module Braintrust
  module Models
    # Type of table that the view corresponds to.
    module ViewType
      extend Braintrust::Enum

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

      class << self
        # @!parse
        #   # @return [Array<Symbol>]
        #   def values; end
      end
    end
  end
end
