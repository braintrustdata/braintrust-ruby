# typed: strong

module Braintrust
  module Models
    class SummarizeExperimentResponse < Braintrust::BaseModel
      # Name of the experiment
      sig { returns(String) }
      def experiment_name
      end

      sig { params(_: String).returns(String) }
      def experiment_name=(_)
      end

      # URL to the experiment's page in the Braintrust app
      sig { returns(String) }
      def experiment_url
      end

      sig { params(_: String).returns(String) }
      def experiment_url=(_)
      end

      # Name of the project that the experiment belongs to
      sig { returns(String) }
      def project_name
      end

      sig { params(_: String).returns(String) }
      def project_name=(_)
      end

      # URL to the project's page in the Braintrust app
      sig { returns(String) }
      def project_url
      end

      sig { params(_: String).returns(String) }
      def project_url=(_)
      end

      # The experiment which scores are baselined against
      sig { returns(T.nilable(String)) }
      def comparison_experiment_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def comparison_experiment_name=(_)
      end

      # Summary of the experiment's metrics
      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::MetricSummary])) }
      def metrics
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, Braintrust::Models::MetricSummary]))
          .returns(T.nilable(T::Hash[Symbol, Braintrust::Models::MetricSummary]))
      end
      def metrics=(_)
      end

      # Summary of the experiment's scores
      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::ScoreSummary])) }
      def scores
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, Braintrust::Models::ScoreSummary]))
          .returns(T.nilable(T::Hash[Symbol, Braintrust::Models::ScoreSummary]))
      end
      def scores=(_)
      end

      # Summary of an experiment
      sig do
        params(
          experiment_name: String,
          experiment_url: String,
          project_name: String,
          project_url: String,
          comparison_experiment_name: T.nilable(String),
          metrics: T.nilable(T::Hash[Symbol, T.any(Braintrust::Models::MetricSummary, Braintrust::Util::AnyHash)]),
          scores: T.nilable(T::Hash[Symbol, T.any(Braintrust::Models::ScoreSummary, Braintrust::Util::AnyHash)])
        )
          .returns(T.attached_class)
      end
      def self.new(
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
