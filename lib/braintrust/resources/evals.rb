# frozen_string_literal: true

module Braintrust
  module Resources
    class Evals
      def initialize(client:)
        @client = client
      end

      # Launch an evaluation. This is the API-equivalent of the `Eval` function that is
      #   built into the Braintrust SDK. In the Eval API, you provide pointers to a
      #   dataset, task function, and scoring functions. The API will then run the
      #   evaluation, create an experiment, and return the results along with a link to
      #   the experiment. To learn more about evals, see the
      #   [Evals guide](https://www.braintrust.dev/docs/guides/evals).
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Data::UnnamedTypeWithunionParent38|Data::UnnamedTypeWithunionParent39] :data The dataset to use
      # @option params [String] :project_id Unique identifier for the project to run the eval in
      # @option params [Array<Score::UnnamedTypeWithunionParent40|Score::UnnamedTypeWithunionParent41|Score::UnnamedTypeWithunionParent42|Score::UnnamedTypeWithunionParent43|Score::UnnamedTypeWithunionParent44|Score::UnnamedTypeWithunionParent45>] :scores The functions to score the eval on
      # @option params [Task::UnnamedTypeWithunionParent46|Task::UnnamedTypeWithunionParent47|Task::UnnamedTypeWithunionParent48|Task::UnnamedTypeWithunionParent49|Task::UnnamedTypeWithunionParent50|Task::UnnamedTypeWithunionParent51] :task The function to evaluate
      # @option params [String] :experiment_name An optional name for the experiment created by this eval. If it conflicts with
      #   an existing experiment, it will be suffixed with a unique identifier.
      # @option params [Hash] :metadata Optional experiment-level metadata to store about the evaluation. You can later
      #   use this to slice & dice across experiments.
      # @option params [Boolean] :stream Whether to stream the results of the eval. If true, the request will return two
      #   events: one to indicate the experiment has started, and another upon completion.
      #   If false, the request will return the evaluation's summary upon completion.
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::SummarizeExperimentResponse]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/eval"
        req[:body] = params
        req[:model] = Braintrust::Models::SummarizeExperimentResponse
        @client.request(req, opts)
      end
    end
  end
end
