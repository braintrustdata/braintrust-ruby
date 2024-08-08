# frozen_string_literal: true

module Braintrust
  module Models
    class PatchProject < BaseModel
      # @!attribute [rw] name_
      #   Name of the project
      #   @return [String]
      optional :name_, String

      # @!attribute [rw] settings
      #   Project settings. Patch operations replace all settings, so make sure you include all settings you want to keep.
      #   @return [Braintrust::Models::PatchProject::Settings]
      optional :settings, -> { Braintrust::Models::PatchProject::Settings }

      class Settings < BaseModel
        # @!attribute [rw] comparison_key
        #   The key used to join two experiments (defaults to `input`).
        #   @return [String]
        optional :comparison_key, String
      end
    end
  end
end
