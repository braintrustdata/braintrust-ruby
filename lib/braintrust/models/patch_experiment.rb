# frozen_string_literal: true

module Braintrust
  module Models
    class PatchExperiment < BaseModel
      # @!attribute [rw] base_exp_id
      #   Id of default base experiment to compare against when viewing this experiment
      #   @return [String]
      optional :base_exp_id, String

      # @!attribute [rw] dataset_id
      #   Identifier of the linked dataset, or null if the experiment is not linked to a dataset
      #   @return [String]
      optional :dataset_id, String

      # @!attribute [rw] dataset_version
      #   Version number of the linked dataset the experiment was run against. This can be used to reproduce the experiment after the dataset has been modified.
      #   @return [String]
      optional :dataset_version, String

      # @!attribute [rw] description
      #   Textual description of the experiment
      #   @return [String]
      optional :description, String

      # @!attribute [rw] metadata
      #   User-controlled metadata about the experiment
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] name_
      #   Name of the experiment. Within a project, experiment names are unique
      #   @return [String]
      optional :name_, String

      # @!attribute [rw] public
      #   Whether or not the experiment is public. Public experiments can be viewed by anybody inside or outside the organization
      #   @return [Boolean]
      optional :public, Braintrust::BooleanModel

      # @!attribute [rw] repo_info
      #   Metadata about the state of the repo when the experiment was created
      #   @return [Braintrust::Models::RepoInfo]
      optional :repo_info, -> { Braintrust::Models::RepoInfo }
    end
  end
end