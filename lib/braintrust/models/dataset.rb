# frozen_string_literal: true

module Braintrust
  module Models
    class Dataset < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the dataset
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the dataset. Within a project, dataset names are unique
      #   @return [String]
      required :name_, String

      # @!attribute [rw] project_id
      #   Unique identifier for the project that the dataset belongs under
      #   @return [String]
      required :project_id, String

      # @!attribute [rw] created
      #   Date of dataset creation
      #   @return [DateTime]
      optional :created, DateTime

      # @!attribute [rw] deleted_at
      #   Date of dataset deletion, or null if the dataset is still active
      #   @return [DateTime]
      optional :deleted_at, DateTime

      # @!attribute [rw] description
      #   Textual description of the dataset
      #   @return [String]
      optional :description, String

      # @!attribute [rw] metadata
      #   User-controlled metadata about the dataset
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] user_id
      #   Identifies the user who created the dataset
      #   @return [String]
      optional :user_id, String
    end
  end
end
