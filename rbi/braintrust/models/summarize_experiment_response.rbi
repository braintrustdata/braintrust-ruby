# typed: strong

module Braintrust
  module Models
    class SummarizeExperimentResponse < Braintrust::Internal::Type::BaseModel
      # Name of the experiment
      sig { returns(String) }
      attr_accessor :experiment_name

      # URL to the experiment's page in the Braintrust app
      sig { returns(String) }
      attr_accessor :experiment_url

      # Name of the project that the experiment belongs to
      sig { returns(String) }
      attr_accessor :project_name

      # URL to the project's page in the Braintrust app
      sig { returns(String) }
      attr_accessor :project_url

      # The experiment which scores are baselined against
      sig { returns(T.nilable(String)) }
      attr_accessor :comparison_experiment_name

      # Summary of the experiment's metrics
      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::MetricSummary])) }
      attr_accessor :metrics

      # Summary of the experiment's scores
      sig { returns(T.nilable(T::Hash[Symbol, Braintrust::Models::ScoreSummary])) }
      attr_accessor :scores

      # Summary of an experiment
      sig do
        params(
          experiment_name: String,
          experiment_url: String,
          project_name: String,
          project_url: String,
          comparison_experiment_name: T.nilable(String),
          metrics: T.nilable(T::Hash[Symbol, T.any(Braintrust::Models::MetricSummary, Braintrust::Internal::AnyHash)]),
          scores: T.nilable(T::Hash[Symbol, T.any(Braintrust::Models::ScoreSummary, Braintrust::Internal::AnyHash)])
        )
          .returns(T.attached_class)
      end
      def self.new(
        # Name of the experiment
        experiment_name:,
        # URL to the experiment's page in the Braintrust app
        experiment_url:,
        # Name of the project that the experiment belongs to
        project_name:,
        # URL to the project's page in the Braintrust app
        project_url:,
        # The experiment which scores are baselined against
        comparison_experiment_name: nil,
        # Summary of the experiment's metrics
        metrics: nil,
        # Summary of the experiment's scores
        scores: nil
      ); end
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
      def to_hash; end
    end
  end
end
