# typed: strong

module Braintrust
  module Models
    class SummarizeDatasetResponse < Braintrust::BaseModel
      # Name of the dataset
      sig { returns(String) }
      attr_accessor :dataset_name

      # URL to the dataset's page in the Braintrust app
      sig { returns(String) }
      attr_accessor :dataset_url

      # Name of the project that the dataset belongs to
      sig { returns(String) }
      attr_accessor :project_name

      # URL to the project's page in the Braintrust app
      sig { returns(String) }
      attr_accessor :project_url

      # Summary of a dataset's data
      sig { returns(T.nilable(Braintrust::Models::DataSummary)) }
      attr_reader :data_summary

      sig { params(data_summary: T.nilable(T.any(Braintrust::Models::DataSummary, Braintrust::Util::AnyHash))).void }
      attr_writer :data_summary

      # Summary of a dataset
      sig do
        params(
          dataset_name: String,
          dataset_url: String,
          project_name: String,
          project_url: String,
          data_summary: T.nilable(T.any(Braintrust::Models::DataSummary, Braintrust::Util::AnyHash))
        )
          .returns(T.attached_class)
      end
      def self.new(dataset_name:, dataset_url:, project_name:, project_url:, data_summary: nil)
      end

      sig do
        override
          .returns(
            {
              dataset_name: String,
              dataset_url: String,
              project_name: String,
              project_url: String,
              data_summary: T.nilable(Braintrust::Models::DataSummary)
            }
          )
      end
      def to_hash
      end
    end
  end
end
