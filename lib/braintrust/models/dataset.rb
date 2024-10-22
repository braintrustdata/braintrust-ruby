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
      required :name_, String, api_name: :name

      # @!attribute [rw] project_id
      #   Unique identifier for the project that the dataset belongs under
      #   @return [String]
      required :project_id, String

      # @!attribute [rw] created
      #   Date of dataset creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] deleted_at
      #   Date of dataset deletion, or null if the dataset is still active
      #   @return [Time]
      optional :deleted_at, Time

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

      # @!parse
      #   # Create a new instance of Dataset from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the dataset
      #   #   @option data [String] :name Name of the dataset. Within a project, dataset names are unique
      #   #   @option data [String] :project_id Unique identifier for the project that the dataset belongs under
      #   #   @option data [String, nil] :created Date of dataset creation
      #   #   @option data [String, nil] :deleted_at Date of dataset deletion, or null if the dataset is still active
      #   #   @option data [String, nil] :description Textual description of the dataset
      #   #   @option data [Hash, nil] :metadata User-controlled metadata about the dataset
      #   #   @option data [String, nil] :user_id Identifies the user who created the dataset
      #   def initialize(data = {}) = super
    end
  end
end
