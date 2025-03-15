# typed: strong

module Braintrust
  module Models
    class ExperimentSummarizeParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # The experiment to compare against, if summarizing scores and metrics. If
      #   omitted, will fall back to the `base_exp_id` stored in the experiment metadata,
      #   and then to the most recent experiment run in the same project. Must pass
      #   `summarize_scores=true` for this id to be used
      sig { returns(T.nilable(String)) }
      def comparison_experiment_id
      end

      sig { params(_: String).returns(String) }
      def comparison_experiment_id=(_)
      end

      # Whether to summarize the scores and metrics. If false (or omitted), only the
      #   metadata will be returned.
      sig { returns(T.nilable(T::Boolean)) }
      def summarize_scores
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def summarize_scores=(_)
      end

      sig do
        params(
          comparison_experiment_id: String,
          summarize_scores: T.nilable(T::Boolean),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(comparison_experiment_id: nil, summarize_scores: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              comparison_experiment_id: String,
              summarize_scores: T.nilable(T::Boolean),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
