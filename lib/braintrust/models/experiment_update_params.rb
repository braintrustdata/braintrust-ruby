# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#update
    class ExperimentUpdateParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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
      optional :repo_info, -> { Braintrust::Models::RepoInfo }, nil?: true

      # @!method initialize(base_exp_id: nil, dataset_id: nil, dataset_version: nil, description: nil, metadata: nil, name: nil, public: nil, repo_info: nil, request_options: {})
      #   @param base_exp_id [String, nil]
      #   @param dataset_id [String, nil]
      #   @param dataset_version [String, nil]
      #   @param description [String, nil]
      #   @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   @param name [String, nil]
      #   @param public [Boolean, nil]
      #   @param repo_info [Braintrust::Models::RepoInfo, nil]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
