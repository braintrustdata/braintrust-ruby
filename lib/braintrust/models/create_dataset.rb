# frozen_string_literal: true

module Braintrust
  module Models
    class CreateDataset < BaseModel
      # @!attribute [rw] name_
      #   Name of the dataset. Within a project, dataset names are unique
      #   @return [String]
      required :name_, String

      # @!attribute [rw] description
      #   Textual description of the dataset
      #   @return [String]
      optional :description, String

      # @!attribute [rw] project_id
      #   Unique identifier for the project that the dataset belongs under
      #   @return [String]
      optional :project_id, String
    end
  end
end
