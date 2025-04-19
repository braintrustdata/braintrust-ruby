# frozen_string_literal: true

module Braintrust
  module Models
    class Dataset < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the dataset
      #
      #   @return [String]
      required :id, String

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

      # @!attribute created
      #   Date of dataset creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute deleted_at
      #   Date of dataset deletion, or null if the dataset is still active
      #
      #   @return [Time, nil]
      optional :deleted_at, Time, nil?: true

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

      # @!attribute user_id
      #   Identifies the user who created the dataset
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!method initialize(id:, name:, project_id:, created: nil, deleted_at: nil, description: nil, metadata: nil, user_id: nil)
      #   @param id [String]
      #   @param name [String]
      #   @param project_id [String]
      #   @param created [Time, nil]
      #   @param deleted_at [Time, nil]
      #   @param description [String, nil]
      #   @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   @param user_id [String, nil]
    end
  end
end
