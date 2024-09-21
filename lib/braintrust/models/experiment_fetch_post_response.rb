# frozen_string_literal: true

module Braintrust
  module Models
    class ExperimentFetchPostResponse < BaseModel
      # @!attribute [rw] events
      #   A list of fetched events
      #   @return [Array<Braintrust::Models::ExperimentFetchPostResponse::Event>]
      required :events, Braintrust::ArrayOf.new(-> { Braintrust::Models::ExperimentFetchPostResponse::Event })

      # @!attribute [rw] cursor
      #   Pagination cursor
      #
      # Pass this string directly as the `cursor` param to your next fetch request to get the next page of results. Not provided if the returned result set is empty.
      #   @return [String]
      optional :cursor, String

      class Event < BaseModel
        # @!attribute [rw] id
        #   A unique identifier for the experiment event. If you don't provide one, BrainTrust will generate one for you
        #   @return [String]
        required :id, String

        # @!attribute [rw] _xact_id
        #   The transaction id of an event is unique to the network operation that processed the event insertion. Transaction ids are monotonically increasing over time and can be used to retrieve a versioned snapshot of the experiment (see the `version` parameter)
        #   @return [String]
        required :_xact_id, String

        # @!attribute [rw] created
        #   The timestamp the experiment event was created
        #   @return [String]
        required :created, String

        # @!attribute [rw] experiment_id
        #   Unique identifier for the experiment
        #   @return [String]
        required :experiment_id, String

        # @!attribute [rw] project_id
        #   Unique identifier for the project that the experiment belongs under
        #   @return [String]
        required :project_id, String

        # @!attribute [rw] root_span_id
        #   The `span_id` of the root of the trace this experiment event belongs to
        #   @return [String]
        required :root_span_id, String

        # @!attribute [rw] span_id
        #   A unique identifier used to link different experiment events together as part of a full trace. See the [tracing guide](https://www.braintrust.dev/docs/guides/tracing) for full details on tracing
        #   @return [String]
        required :span_id, String

        # @!attribute [rw] context
        #   Context is additional information about the code that produced the experiment event. It is essentially the textual counterpart to `metrics`. Use the `caller_*` attributes to track the location in code which produced the experiment event
        #   @return [Braintrust::Models::ExperimentFetchPostResponse::Event::Context]
        optional :context, -> { Braintrust::Models::ExperimentFetchPostResponse::Event::Context }

        # @!attribute [rw] dataset_record_id
        #   If the experiment is associated to a dataset, this is the event-level dataset id this experiment event is tied to
        #   @return [String]
        optional :dataset_record_id, String

        # @!attribute [rw] expected
        #   The ground truth value (an arbitrary, JSON serializable object) that you'd compare to `output` to determine if your `output` value is correct or not. Braintrust currently does not compare `output` to `expected` for you, since there are so many different ways to do that correctly. Instead, these values are just used to help you navigate your experiments while digging into analyses. However, we may later use these values to re-score outputs or fine-tune your models
        #   @return [Object]
        optional :expected, Braintrust::Unknown

        # @!attribute [rw] input
        #   The arguments that uniquely define a test case (an arbitrary, JSON serializable object). Later on, Braintrust will use the `input` to know whether two test cases are the same between experiments, so they should not contain experiment-specific state. A simple rule of thumb is that if you run the same experiment twice, the `input` should be identical
        #   @return [Object]
        optional :input, Braintrust::Unknown

        # @!attribute [rw] metadata
        #   A dictionary with additional data about the test example, model outputs, or just about anything else that's relevant, that you can use to help find and analyze examples later. For example, you could log the `prompt`, example's `id`, or anything else that would be useful to slice/dice later. The values in `metadata` can be any JSON-serializable type, but its keys must be strings
        #   @return [Hash]
        optional :metadata, Hash

        # @!attribute [rw] metrics
        #   Metrics are numerical measurements tracking the execution of the code that produced the experiment event. Use "start" and "end" to track the time span over which the experiment event was produced
        #   @return [Braintrust::Models::ExperimentFetchPostResponse::Event::Metrics]
        optional :metrics, -> { Braintrust::Models::ExperimentFetchPostResponse::Event::Metrics }

        # @!attribute [rw] output
        #   The output of your application, including post-processing (an arbitrary, JSON serializable object), that allows you to determine whether the result is correct or not. For example, in an app that generates SQL queries, the `output` should be the _result_ of the SQL query generated by the model, not the query itself, because there may be multiple valid queries that answer a single question
        #   @return [Object]
        optional :output, Braintrust::Unknown

        # @!attribute [rw] scores
        #   A dictionary of numeric values (between 0 and 1) to log. The scores should give you a variety of signals that help you determine how accurate the outputs are compared to what you expect and diagnose failures. For example, a summarization app might have one score that tells you how accurate the summary is, and another that measures the word similarity between the generated and grouth truth summary. The word similarity score could help you determine whether the summarization was covering similar concepts or not. You can use these scores to help you sort, filter, and compare experiments
        #   @return [Hash]
        optional :scores, Hash

        # @!attribute [rw] span_attributes
        #   Human-identifying attributes of the span, such as name, type, etc.
        #   @return [Braintrust::Models::ExperimentFetchPostResponse::Event::SpanAttributes]
        optional :span_attributes,
                 lambda {
                   Braintrust::Models::ExperimentFetchPostResponse::Event::SpanAttributes
                 }

        # @!attribute [rw] span_parents
        #   An array of the parent `span_ids` of this experiment event. This should be empty for the root span of a trace, and should most often contain just one parent element for subspans
        #   @return [Array<String>]
        optional :span_parents, Braintrust::ArrayOf.new(String)

        # @!attribute [rw] tags
        #   A list of tags to log
        #   @return [Array<String>]
        optional :tags, Braintrust::ArrayOf.new(String)

        class Context < BaseModel
          # @!attribute [rw] caller_filename
          #   Name of the file in code where the experiment event was created
          #   @return [String]
          optional :caller_filename, String

          # @!attribute [rw] caller_functionname
          #   The function in code which created the experiment event
          #   @return [String]
          optional :caller_functionname, String

          # @!attribute [rw] caller_lineno
          #   Line of code where the experiment event was created
          #   @return [Integer]
          optional :caller_lineno, Integer
        end

        class Metrics < BaseModel
          # @!attribute [rw] completion_tokens
          #   The number of tokens in the completion generated by the model (only set if this is an LLM span)
          #   @return [Integer]
          optional :completion_tokens, Integer

          # @!attribute [rw] end_
          #   A unix timestamp recording when the section of code which produced the experiment event finished
          #   @return [Float]
          optional :end_, Float

          # @!attribute [rw] prompt_tokens
          #   The number of tokens in the prompt used to generate the experiment event (only set if this is an LLM span)
          #   @return [Integer]
          optional :prompt_tokens, Integer

          # @!attribute [rw] start
          #   A unix timestamp recording when the section of code which produced the experiment event started
          #   @return [Float]
          optional :start, Float

          # @!attribute [rw] tokens
          #   The total number of tokens in the input and output of the experiment event.
          #   @return [Integer]
          optional :tokens, Integer
        end

        class SpanAttributes < BaseModel
          # @!attribute [rw] name_
          #   Name of the span, for display purposes only
          #   @return [String]
          optional :name_, String

          # @!attribute [rw] type
          #   Type of the span, for display purposes only
          #   @return [Symbol]
          optional :type, Braintrust::Enum.new(:llm, :score, :function, :eval, :task, :tool)
        end
      end
    end
  end
end
