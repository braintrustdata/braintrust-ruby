# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectTag < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the project tag
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the project tag
      #
      #   @return [String]
      required :name, String

      # @!attribute project_id
      #   Unique identifier for the project that the project tag belongs under
      #
      #   @return [String]
      required :project_id, String

      # @!attribute user_id
      #
      #   @return [String]
      required :user_id, String

      # @!attribute color
      #   Color of the tag for the UI
      #
      #   @return [String, nil]
      optional :color, String, nil?: true

      # @!attribute created
      #   Date of project tag creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute description
      #   Textual description of the project tag
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!method initialize(id:, name:, project_id:, user_id:, color: nil, created: nil, description: nil)
      #   A project tag is a user-configured tag for tracking and filtering your
      #   experiments, logs, and other data
      #
      #   @param id [String]
      #   @param name [String]
      #   @param project_id [String]
      #   @param user_id [String]
      #   @param color [String, nil]
      #   @param created [Time, nil]
      #   @param description [String, nil]
    end
  end
end
