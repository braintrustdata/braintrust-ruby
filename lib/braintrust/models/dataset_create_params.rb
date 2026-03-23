# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Datasets#create
    class DatasetCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the dataset. Within a project, dataset names are unique
      #
      #   @return [String]
      required :name, String

      # @!attribute project_id
      #   Unique identifier for the project that the dataset belongs under
      #
      #   @return [String]
      required :project_id, String

      # @!attribute description
      #   Textual description of the dataset
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute metadata
      #   User-controlled metadata about the dataset
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!method initialize(name:, project_id:, description: nil, metadata: nil, request_options: {})
      #   @param name [String] Name of the dataset. Within a project, dataset names are unique
      #
      #   @param project_id [String] Unique identifier for the project that the dataset belongs under
      #
      #   @param description [String, nil] Textual description of the dataset
      #
      #   @param metadata [Hash{Symbol=>Object, nil}, nil] User-controlled metadata about the dataset
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
