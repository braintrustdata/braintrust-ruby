# frozen_string_literal: true

module Braintrust
  module Models
    class FunctionToolChoice < BaseModel
      # @!attribute [rw] name_
      #   @return [String]
      required :name_, String, api_name: :name

      # @!parse
      #   # Create a new instance of FunctionToolChoice from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :name
      #   def initialize(data = {}) = super
    end
  end
end
