# frozen_string_literal: true

module Braintrust
  module Models
    class InsertExperimentEventMerge < BaseModel
      # @!attribute [rw] _is_merge
      #   The `_is_merge` field controls how the row is merged with any existing row with the same id in the DB. By default (or when set to `false`), the existing row is completely replaced by the new row. When set to `true`, the new row is deep-merged into the existing row
      #
      # For example, say there is an existing row in the DB `{"id": "foo", "input": {"a": 5, "b": 10}}`. If we merge a new row as `{"_is_merge": true, "id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be `{"id": "foo", "input": {"a": 5, "b": 11, "c": 20}}`. If we replace the new row as `{"id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be `{"id": "foo", "input": {"b": 11, "c": 20}}`
      #   @return [Boolean]
      required :_is_merge, Braintrust::BooleanModel

      # @!attribute [rw] id
      #   A unique identifier for the experiment event. If you don't provide one, BrainTrust will generate one for you
      #   @return [String]
      optional :id, String

      # @!attribute [rw] _merge_paths
      #   The `_merge_paths` field allows controlling the depth of the merge. It can only be specified alongside `_is_merge=true`. `_merge_paths` is a list of paths, where each path is a list of field names. The deep merge will not descend below any of the specified merge paths.
      #
      # For example, say there is an existing row in the DB `{"id": "foo", "input": {"a": {"b": 10}, "c": {"d": 20}}, "output": {"a": 20}}`. If we merge a new row as `{"_is_merge": true, "_merge_paths": [["input", "a"], ["output"]], "input": {"a": {"q": 30}, "c": {"e": 30}, "bar": "baz"}, "output": {"d": 40}}`, the new row will be `{"id": "foo": "input": {"a": {"q": 30}, "c": {"d": 20, "e": 30}, "bar": "baz"}, "output": {"d": 40}}`. In this case, due to the merge paths, we have replaced `input.a` and `output`, but have still deep-merged `input` and `input.c`.
      #   @return [Array<Array<String>>]
      optional :_merge_paths, Braintrust::ArrayOf.new(Braintrust::ArrayOf.new(String))

      # @!attribute [rw] _object_delete
      #   Pass `_object_delete=true` to mark the experiment event deleted. Deleted events will not show up in subsequent fetches for this experiment
      #   @return [Boolean]
      optional :_object_delete, Braintrust::BooleanModel

      # @!attribute [rw] context
      #   Context is additional information about the code that produced the experiment event. It is essentially the textual counterpart to `metrics`. Use the `caller_*` attributes to track the location in code which produced the experiment event
      #   @return [Braintrust::Models::InsertExperimentEventMerge::Context]
      optional :context, -> { Braintrust::Models::InsertExperimentEventMerge::Context }

      # @!attribute [rw] created
      #   The timestamp the experiment event was created
      #   @return [DateTime]
      optional :created, DateTime

      # @!attribute [rw] dataset_record_id
      #   If the experiment is associated to a dataset, this is the event-level dataset id this experiment event is tied to
      #   @return [String]
      optional :dataset_record_id, String

      # @!attribute [rw] error
      #   The error that occurred, if any.
      #   @return [Object]
      optional :error, Braintrust::Unknown

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
      #   @return [Braintrust::Models::InsertExperimentEventMerge::Metrics]
      optional :metrics, -> { Braintrust::Models::InsertExperimentEventMerge::Metrics }

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
      #   @return [Braintrust::Models::InsertExperimentEventMerge::SpanAttributes]
      optional :span_attributes, -> { Braintrust::Models::InsertExperimentEventMerge::SpanAttributes }

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
        #   One of the constants defined in {Braintrust::Models::InsertExperimentEventMerge::SpanAttributes::Type}
        #   @return [Symbol]
        optional :type, enum: -> { Braintrust::Models::InsertExperimentEventMerge::SpanAttributes::Type }

        # Type of the span, for display purposes only
        class Type < Braintrust::Enum
          LLM = :llm
          SCORE = :score
          FUNCTION = :function
          EVAL = :eval
          TASK = :task
          TOOL = :tool
        end
      end
    end
  end
end
