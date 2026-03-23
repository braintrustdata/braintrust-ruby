# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#create
    class ExperimentCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute project_id
      #   Unique identifier for the project that the experiment belongs under
      #
      #   @return [String]
      required :project_id, String

      # @!attribute base_exp_id
      #   Id of default base experiment to compare against when viewing this experiment
      #
      #   @return [String, nil]
      optional :base_exp_id, String, nil?: true

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

      # @!attribute description
      #   Textual description of the experiment
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute ensure_new
      #   Normally, creating an experiment with the same name as an existing experiment
      #   will return the existing one un-modified. But if `ensure_new` is true,
      #   registration will generate a new experiment with a unique name in case of a
      #   conflict.
      #
      #   @return [Boolean, nil]
      optional :ensure_new, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute metadata
      #   User-controlled metadata about the experiment
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute name
      #   Name of the experiment. Within a project, experiment names are unique
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute public
      #   Whether or not the experiment is public. Public experiments can be viewed by
      #   anybody inside or outside the organization
      #
      #   @return [Boolean, nil]
      optional :public, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute repo_info
      #   Metadata about the state of the repo when the experiment was created
      #
      #   @return [Braintrust::Models::RepoInfo, nil]
      optional :repo_info, -> { Braintrust::RepoInfo }, nil?: true

      # @!method initialize(project_id:, base_exp_id: nil, dataset_id: nil, dataset_version: nil, description: nil, ensure_new: nil, metadata: nil, name: nil, public: nil, repo_info: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::ExperimentCreateParams} for more details.
      #
      #   @param project_id [String] Unique identifier for the project that the experiment belongs under
      #
      #   @param base_exp_id [String, nil] Id of default base experiment to compare against when viewing this experiment
      #
      #   @param dataset_id [String, nil] Identifier of the linked dataset, or null if the experiment is not linked to a d
      #
      #   @param dataset_version [String, nil] Version number of the linked dataset the experiment was run against. This can be
      #
      #   @param description [String, nil] Textual description of the experiment
      #
      #   @param ensure_new [Boolean, nil] Normally, creating an experiment with the same name as an existing experiment wi
      #
      #   @param metadata [Hash{Symbol=>Object, nil}, nil] User-controlled metadata about the experiment
      #
      #   @param name [String, nil] Name of the experiment. Within a project, experiment names are unique
      #
      #   @param public [Boolean, nil] Whether or not the experiment is public. Public experiments can be viewed by any
      #
      #   @param repo_info [Braintrust::Models::RepoInfo, nil] Metadata about the state of the repo when the experiment was created
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
