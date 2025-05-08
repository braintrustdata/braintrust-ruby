# frozen_string_literal: true

module Braintrust
  module Models
    class Experiment < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the experiment
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the experiment. Within a project, experiment names are unique
      #
      #   @return [String]
      required :name, String

      # @!attribute project_id
      #   Unique identifier for the project that the experiment belongs under
      #
      #   @return [String]
      required :project_id, String

      # @!attribute public
      #   Whether or not the experiment is public. Public experiments can be viewed by
      #   anybody inside or outside the organization
      #
      #   @return [Boolean]
      required :public, Braintrust::Internal::Type::Boolean

      # @!attribute base_exp_id
      #   Id of default base experiment to compare against when viewing this experiment
      #
      #   @return [String, nil]
      optional :base_exp_id, String, nil?: true

      # @!attribute commit
      #   Commit, taken directly from `repo_info.commit`
      #
      #   @return [String, nil]
      optional :commit, String, nil?: true

      # @!attribute created
      #   Date of experiment creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute dataset_id
      #   Identifier of the linked dataset, or null if the experiment is not linked to a
      #   dataset
      #
      #   @return [String, nil]
      optional :dataset_id, String, nil?: true

      # @!attribute dataset_version
      #   Version number of the linked dataset the experiment was run against. This can be
      #   used to reproduce the experiment after the dataset has been modified.
      #
      #   @return [String, nil]
      optional :dataset_version, String, nil?: true

      # @!attribute deleted_at
      #   Date of experiment deletion, or null if the experiment is still active
      #
      #   @return [Time, nil]
      optional :deleted_at, Time, nil?: true

      # @!attribute description
      #   Textual description of the experiment
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute metadata
      #   User-controlled metadata about the experiment
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute repo_info
      #   Metadata about the state of the repo when the experiment was created
      #
      #   @return [Braintrust::RepoInfo, nil]
      optional :repo_info, -> { Braintrust::RepoInfo }, nil?: true

      # @!attribute user_id
      #   Identifies the user who created the experiment
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!method initialize(id:, name:, project_id:, public:, base_exp_id: nil, commit: nil, created: nil, dataset_id: nil, dataset_version: nil, deleted_at: nil, description: nil, metadata: nil, repo_info: nil, user_id: nil)
      #   Some parameter documentations has been truncated, see {Braintrust::Experiment}
      #   for more details.
      #
      #   @param id [String] Unique identifier for the experiment
      #
      #   @param name [String] Name of the experiment. Within a project, experiment names are unique
      #
      #   @param project_id [String] Unique identifier for the project that the experiment belongs under
      #
      #   @param public [Boolean] Whether or not the experiment is public. Public experiments can be viewed by any
      #
      #   @param base_exp_id [String, nil] Id of default base experiment to compare against when viewing this experiment
      #
      #   @param commit [String, nil] Commit, taken directly from `repo_info.commit`
      #
      #   @param created [Time, nil] Date of experiment creation
      #
      #   @param dataset_id [String, nil] Identifier of the linked dataset, or null if the experiment is not linked to a d
      #
      #   @param dataset_version [String, nil] Version number of the linked dataset the experiment was run against. This can be
      #
      #   @param deleted_at [Time, nil] Date of experiment deletion, or null if the experiment is still active
      #
      #   @param description [String, nil] Textual description of the experiment
      #
      #   @param metadata [Hash{Symbol=>Object, nil}, nil] User-controlled metadata about the experiment
      #
      #   @param repo_info [Braintrust::RepoInfo, nil] Metadata about the state of the repo when the experiment was created
      #
      #   @param user_id [String, nil] Identifies the user who created the experiment
    end
  end
end
