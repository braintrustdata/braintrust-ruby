# frozen_string_literal: true

module Braintrust
  module Models
    class DataSummary < BaseModel
      # @!attribute [rw] total_records
      #   Total number of records in the dataset
      #   @return [Integer]
      required :total_records, Integer
    end
  end
end
