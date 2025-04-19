# frozen_string_literal: true

module Braintrust
  module Models
    class SummarizeDatasetResponse < Braintrust::Internal::Type::BaseModel
      # @!attribute dataset_name
      #   Name of the dataset
      #
      #   @return [String]
      required :dataset_name, String

      # @!attribute dataset_url
      #   URL to the dataset's page in the Braintrust app
      #
      #   @return [String]
      required :dataset_url, String

      # @!attribute project_name
      #   Name of the project that the dataset belongs to
      #
      #   @return [String]
      required :project_name, String

      # @!attribute project_url
      #   URL to the project's page in the Braintrust app
      #
      #   @return [String]
      required :project_url, String

      # @!attribute data_summary
      #   Summary of a dataset's data
      #
      #   @return [Braintrust::Models::DataSummary, nil]
      optional :data_summary, -> { Braintrust::Models::DataSummary }, nil?: true

      # @!method initialize(dataset_name:, dataset_url:, project_name:, project_url:, data_summary: nil)
      #   Summary of a dataset
      #
      #   @param dataset_name [String]
      #   @param dataset_url [String]
      #   @param project_name [String]
      #   @param project_url [String]
      #   @param data_summary [Braintrust::Models::DataSummary, nil]
    end
  end
end
