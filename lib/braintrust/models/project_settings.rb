# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectSettings < BaseModel
      # @!attribute [rw] comparison_key
      #   The key used to join two experiments (defaults to `input`).
      #   @return [String]
      optional :comparison_key, String

      # @!parse
      #   # Create a new instance of ProjectSettings from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String, nil] :comparison_key The key used to join two experiments (defaults to `input`).
      #   def initialize(data = {}) = super
    end
  end
end
