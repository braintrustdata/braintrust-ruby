# frozen_string_literal: true

module Braintrust
  module Models
    class DataSummary < Braintrust::Internal::Type::BaseModel
      # @!attribute total_records
      #   Total number of records in the dataset
      #
      #   @return [Integer]
      required :total_records, Integer

      # @!method initialize(total_records:)
      #   Summary of a dataset's data
      #
      #   @param total_records [Integer] Total number of records in the dataset
    end
  end
end
