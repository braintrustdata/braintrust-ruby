# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Datasets#create
    class DatasetCreateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
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
      optional :metadata, Braintrust::HashOf[Braintrust::Unknown, nil?: true], nil?: true

      # @!parse
      #   # @param name [String]
      #   # @param project_id [String]
      #   # @param description [String, nil]
      #   # @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(name:, project_id:, description: nil, metadata: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
