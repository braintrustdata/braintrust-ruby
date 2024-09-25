# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectSettings < BaseModel
      # @!attribute [rw] comparison_key
      #   The key used to join two experiments (defaults to `input`).
      #   @return [String]
      optional :comparison_key, String
    end
  end
end
