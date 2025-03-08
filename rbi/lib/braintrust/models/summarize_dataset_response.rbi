# typed: strong

module Braintrust
  module Models
    class SummarizeDatasetResponse < Braintrust::BaseModel
      sig { returns(String) }
      def dataset_name
      end

      sig { params(_: String).returns(String) }
      def dataset_name=(_)
      end

      sig { returns(String) }
      def dataset_url
      end

      sig { params(_: String).returns(String) }
      def dataset_url=(_)
      end

      sig { returns(String) }
      def project_name
      end

      sig { params(_: String).returns(String) }
      def project_name=(_)
      end

      sig { returns(String) }
      def project_url
      end

      sig { params(_: String).returns(String) }
      def project_url=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::DataSummary)) }
      def data_summary
      end

      sig { params(_: T.nilable(Braintrust::Models::DataSummary)).returns(T.nilable(Braintrust::Models::DataSummary)) }
      def data_summary=(_)
      end

      sig do
        params(
          dataset_name: String,
          dataset_url: String,
          project_name: String,
          project_url: String,
          data_summary: T.nilable(Braintrust::Models::DataSummary)
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
