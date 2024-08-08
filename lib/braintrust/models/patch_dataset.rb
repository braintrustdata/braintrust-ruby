# frozen_string_literal: true

module Braintrust
  module Models
    class PatchDataset < BaseModel
      # @!attribute [rw] description
      #   Textual description of the dataset
      #   @return [String]
      optional :description, String

      # @!attribute [rw] metadata
      #   User-controlled metadata about the dataset
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] name_
      #   Name of the dataset. Within a project, dataset names are unique
      #   @return [String]
      optional :name_, String
    end
  end
end
