# frozen_string_literal: true

module Braintrust
  module Models
    class DataSummary < BaseModel
      # @!attribute [rw] total_records
      #   Total number of records in the dataset
      #   @return [Integer]
      required :total_records, Integer

      # @!parse
      #   # Create a new instance of DataSummary from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :total_records Total number of records in the dataset
      #   def initialize(data = {}) = super
    end
  end
end
