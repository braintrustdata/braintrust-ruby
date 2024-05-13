# frozen_string_literal: true

module Ruby
  module Models
    class DatasetSummarizeResponse < BaseModel
      # @!attribute [rw] dataset_name
      #   Name of the dataset
      #   @return [String]
      required :dataset_name, String

      # @!attribute [rw] dataset_url
      #   URL to the dataset's page in the Braintrust app
      #   @return [String]
      required :dataset_url, String

      # @!attribute [rw] project_name
      #   Name of the project that the dataset belongs to
      #   @return [String]
      required :project_name, String

      # @!attribute [rw] project_url
      #   URL to the project's page in the Braintrust app
      #   @return [String]
      required :project_url, String

      # @!attribute [rw] data_summary
      #   Summary of a dataset's data
      #   @return [Ruby::Models::DatasetSummarizeResponse::DataSummary]
      optional :data_summary, -> { Ruby::Models::DatasetSummarizeResponse::DataSummary }

      class DataSummary < BaseModel
        # @!attribute [rw] total_records
        #   Total number of records in the dataset
        #   @return [Integer]
        required :total_records, Integer
      end
    end
  end
end
