# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Datasets#update
    class DatasetUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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

      # @!attribute name
      #   Name of the dataset. Within a project, dataset names are unique
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!method initialize(description: nil, metadata: nil, name: nil, request_options: {})
      #   @param description [String, nil] Textual description of the dataset
      #
      #   @param metadata [Hash{Symbol=>Object, nil}, nil] User-controlled metadata about the dataset
      #
      #   @param name [String, nil] Name of the dataset. Within a project, dataset names are unique
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
