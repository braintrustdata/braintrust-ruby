# frozen_string_literal: true

module Braintrust
  module Models
    class SummarizeDatasetResponse < BaseModel
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
      #   @return [Braintrust::Models::DataSummary]
      optional :data_summary, -> { Braintrust::Models::DataSummary }
    end
  end
end
