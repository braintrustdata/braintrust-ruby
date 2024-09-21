# frozen_string_literal: true

module Braintrust
  module Models
    class Experiment < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the experiment
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the experiment. Within a project, experiment names are unique
      #   @return [String]
      required :name_, String

      # @!attribute [rw] project_id
      #   Unique identifier for the project that the experiment belongs under
      #   @return [String]
      required :project_id, String

      # @!attribute [rw] public
      #   Whether or not the experiment is public. Public experiments can be viewed by anybody inside or outside the organization
      #   @return [Boolean]
      required :public, Braintrust::BooleanModel

      # @!attribute [rw] base_exp_id
      #   Id of default base experiment to compare against when viewing this experiment
      #   @return [String]
      optional :base_exp_id, String

      # @!attribute [rw] commit
      #   Commit, taken directly from `repo_info.commit`
      #   @return [String]
      optional :commit, String

      # @!attribute [rw] created
      #   Date of experiment creation
      #   @return [DateTime]
      optional :created, DateTime

      # @!attribute [rw] dataset_id
      #   Identifier of the linked dataset, or null if the experiment is not linked to a dataset
      #   @return [String]
      optional :dataset_id, String

      # @!attribute [rw] dataset_version
      #   Version number of the linked dataset the experiment was run against. This can be used to reproduce the experiment after the dataset has been modified.
      #   @return [String]
      optional :dataset_version, String

      # @!attribute [rw] deleted_at
      #   Date of experiment deletion, or null if the experiment is still active
      #   @return [DateTime]
      optional :deleted_at, DateTime

      # @!attribute [rw] description
      #   Textual description of the experiment
      #   @return [String]
      optional :description, String

      # @!attribute [rw] metadata
      #   User-controlled metadata about the experiment
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] repo_info
      #   Metadata about the state of the repo when the experiment was created
      #   @return [Braintrust::Models::RepoInfo]
      optional :repo_info, -> { Braintrust::Models::RepoInfo }

      # @!attribute [rw] user_id
      #   Identifies the user who created the experiment
      #   @return [String]
      optional :user_id, String
    end
  end
end
