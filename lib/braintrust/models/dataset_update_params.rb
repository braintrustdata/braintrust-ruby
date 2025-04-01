# frozen_string_literal: true

module Braintrust
  module Models
    class DatasetUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

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

      # @!attribute name
      #   Name of the dataset. Within a project, dataset names are unique
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!parse
      #   # @param description [String, nil]
      #   # @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   # @param name [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(description: nil, metadata: nil, name: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
