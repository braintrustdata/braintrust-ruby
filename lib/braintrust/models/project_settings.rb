# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectSettings < Braintrust::BaseModel
      # @!attribute comparison_key
      #   The key used to join two experiments (defaults to `input`).
      #
      #   @return [String, nil]
      optional :comparison_key, String, nil?: true

      # @!parse
      #   # @param comparison_key [String, nil]
      #   #
      #   def initialize(comparison_key: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
