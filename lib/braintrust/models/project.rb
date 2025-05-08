# frozen_string_literal: true

module Braintrust
  module Models
    class Project < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the project
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the project
      #
      #   @return [String]
      required :name, String

      # @!attribute org_id
      #   Unique id for the organization that the project belongs under
      #
      #   @return [String]
      required :org_id, String

      # @!attribute created
      #   Date of project creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute deleted_at
      #   Date of project deletion, or null if the project is still active
      #
      #   @return [Time, nil]
      optional :deleted_at, Time, nil?: true

      # @!attribute settings
      #
      #   @return [Braintrust::ProjectSettings, nil]
      optional :settings, -> { Braintrust::ProjectSettings }, nil?: true

      # @!attribute user_id
      #   Identifies the user who created the project
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!method initialize(id:, name:, org_id:, created: nil, deleted_at: nil, settings: nil, user_id: nil)
      #   @param id [String] Unique identifier for the project
      #
      #   @param name [String] Name of the project
      #
      #   @param org_id [String] Unique id for the organization that the project belongs under
      #
      #   @param created [Time, nil] Date of project creation
      #
      #   @param deleted_at [Time, nil] Date of project deletion, or null if the project is still active
      #
      #   @param settings [Braintrust::ProjectSettings, nil]
      #
      #   @param user_id [String, nil] Identifies the user who created the project
    end
  end
end
