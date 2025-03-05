# frozen_string_literal: true

module Braintrust
  module Models
    class DataSummary < Braintrust::BaseModel
      # @!attribute total_records
      #   Total number of records in the dataset
      #
      #   @return [Integer]
      required :total_records, Integer

      # @!parse
      #   # Summary of a dataset's data
      #   #
      #   # @param total_records [Integer]
      #   #
      #   def initialize(total_records:, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
