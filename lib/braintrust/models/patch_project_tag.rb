# frozen_string_literal: true

module Braintrust
  module Models
    class PatchProjectTag < BaseModel
      # @!attribute [rw] color
      #   Color of the tag for the UI
      #   @return [String]
      optional :color, String

      # @!attribute [rw] description
      #   Textual description of the project tag
      #   @return [String]
      optional :description, String

      # @!attribute [rw] name_
      #   Name of the project tag
      #   @return [String]
      optional :name_, String
    end
  end
end
