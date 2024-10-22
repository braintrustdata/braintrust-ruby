# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectScoreCategory < BaseModel
      # @!attribute [rw] name_
      #   Name of the category
      #   @return [String]
      required :name_, String, api_name: :name

      # @!attribute [rw] value
      #   Numerical value of the category. Must be between 0 and 1, inclusive
      #   @return [Float]
      required :value, Float

      # @!parse
      #   # Create a new instance of ProjectScoreCategory from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :name Name of the category
      #   #   @option data [Float] :value Numerical value of the category. Must be between 0 and 1, inclusive
      #   def initialize(data = {}) = super
    end
  end
end
