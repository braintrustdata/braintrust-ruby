# typed: strong

module Braintrust
  module Models
    class SummarizeExperimentResponse < Braintrust::BaseModel
      sig { returns(String) }
      def experiment_name
      end

      sig { params(_: String).returns(String) }
      def experiment_name=(_)
      end

      sig { returns(String) }
      def experiment_url
      end

      sig { params(_: String).returns(String) }
      def experiment_url=(_)
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

      sig { returns(T.nilable(String)) }
      def comparison_experiment_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def comparison_experiment_name=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::MetricSummary])) }
      def metrics
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, Braintrust::Models::MetricSummary]))
          .returns(T.nilable(T::Hash[Symbol, Braintrust::Models::MetricSummary]))
      end
      def metrics=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::ScoreSummary])) }
      def scores
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, Braintrust::Models::ScoreSummary]))
          .returns(T.nilable(T::Hash[Symbol, Braintrust::Models::ScoreSummary]))
      end
      def scores=(_)
      end

      sig do
        params(
          experiment_name: String,
          experiment_url: String,
          project_name: String,
          project_url: String,
          comparison_experiment_name: T.nilable(String),
          metrics: T.nilable(T::Hash[Symbol, Braintrust::Models::MetricSummary]),
          scores: T.nilable(T::Hash[Symbol, Braintrust::Models::ScoreSummary])
        )
          .void
      end
      def initialize(
        experiment_name:,
        experiment_url:,
        project_name:,
        project_url:,
        comparison_experiment_name: nil,
        metrics: nil,
        scores: nil
      )
      end

      sig do
        override
          .returns(
            {
              experiment_name: String,
              experiment_url: String,
              project_name: String,
              project_url: String,
              comparison_experiment_name: T.nilable(String),
              metrics: T.nilable(T::Hash[Symbol, Braintrust::Models::MetricSummary]),
              scores: T.nilable(T::Hash[Symbol, Braintrust::Models::ScoreSummary])
            }
          )
      end
      def to_hash
      end
    end
  end
end
