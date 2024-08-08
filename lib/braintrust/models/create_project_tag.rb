# frozen_string_literal: true

module Braintrust
  module Models
    class CreateProjectTag < BaseModel
      # @!attribute [rw] name_
      #   Name of the project tag
      #   @return [String]
      required :name_, String

      # @!attribute [rw] project_id
      #   Unique identifier for the project that the project tag belongs under
      #   @return [String]
      required :project_id, String

      # @!attribute [rw] color
      #   Color of the tag for the UI
      #   @return [String]
      optional :color, String

      # @!attribute [rw] description
      #   Textual description of the project tag
      #   @return [String]
      optional :description, String
    end
  end
end
