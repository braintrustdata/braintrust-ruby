# frozen_string_literal: true

module Braintrust
  module Models
    class InsertProjectLogsEventReplace < BaseModel
      # @!attribute [rw] id
      #   A unique identifier for the project logs event. If you don't provide one, BrainTrust will generate one for you
      #   @return [String]
      optional :id, String

      # @!attribute [rw] _is_merge
      #   The `_is_merge` field controls how the row is merged with any existing row with the same id in the DB. By default (or when set to `false`), the existing row is completely replaced by the new row. When set to `true`, the new row is deep-merged into the existing row
      # 
      # For example, say there is an existing row in the DB `{"id": "foo", "input": {"a": 5, "b": 10}}`. If we merge a new row as `{"_is_merge": true, "id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be `{"id": "foo", "input": {"a": 5, "b": 11, "c": 20}}`. If we replace the new row as `{"id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be `{"id": "foo", "input": {"b": 11, "c": 20}}`
      #   @return [Boolean]
      optional :_is_merge, Braintrust::BooleanModel

      # @!attribute [rw] _object_delete
      #   Pass `_object_delete=true` to mark the project logs event deleted. Deleted events will not show up in subsequent fetches for this project logs
      #   @return [Boolean]
      optional :_object_delete, Braintrust::BooleanModel

      # @!attribute [rw] _parent_id
      #   Use the `_parent_id` field to create this row as a subspan of an existing row. It cannot be specified alongside `_is_merge=true`. Tracking hierarchical relationships are important for tracing (see the [guide](https://www.braintrust.dev/docs/guides/tracing) for full details).
      # 
      # For example, say we have logged a row `{"id": "abc", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`. We can create a sub-span of the parent row by logging `{"_parent_id": "abc", "id": "llm_call", "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`. In the webapp, only the root span row `"abc"` will show up in the summary view. You can view the full trace hierarchy (in this case, the `"llm_call"` row) by clicking on the "abc" row.
      #   @return [String]
      optional :_parent_id, String

      # @!attribute [rw] context
      #   Context is additional information about the code that produced the project logs event. It is essentially the textual counterpart to `metrics`. Use the `caller_*` attributes to track the location in code which produced the project logs event
      #   @return [Braintrust::Models::InsertProjectLogsEventReplace::Context]
      optional :context, -> { Braintrust::Models::InsertProjectLogsEventReplace::Context }

      # @!attribute [rw] created
      #   The timestamp the project logs event was created
      #   @return [String]
      optional :created, String

      # @!attribute [rw] error
      #   The error that occurred, if any.
      #   @return [Object]
      optional :error, Braintrust::Unknown

      # @!attribute [rw] expected
      #   The ground truth value (an arbitrary, JSON serializable object) that you'd compare to `output` to determine if your `output` value is correct or not. Braintrust currently does not compare `output` to `expected` for you, since there are so many different ways to do that correctly. Instead, these values are just used to help you navigate while digging into analyses. However, we may later use these values to re-score outputs or fine-tune your models.
      #   @return [Object]
      optional :expected, Braintrust::Unknown

      # @!attribute [rw] input
      #   The arguments that uniquely define a user input (an arbitrary, JSON serializable object).
      #   @return [Object]
      optional :input, Braintrust::Unknown

      # @!attribute [rw] metadata
      #   A dictionary with additional data about the test example, model outputs, or just about anything else that's relevant, that you can use to help find and analyze examples later. For example, you could log the `prompt`, example's `id`, or anything else that would be useful to slice/dice later. The values in `metadata` can be any JSON-serializable type, but its keys must be strings
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] metrics
      #   Metrics are numerical measurements tracking the execution of the code that produced the project logs event. Use "start" and "end" to track the time span over which the project logs event was produced
      #   @return [Braintrust::Models::InsertProjectLogsEventReplace::Metrics]
      optional :metrics, -> { Braintrust::Models::InsertProjectLogsEventReplace::Metrics }

      # @!attribute [rw] output
      #   The output of your application, including post-processing (an arbitrary, JSON serializable object), that allows you to determine whether the result is correct or not. For example, in an app that generates SQL queries, the `output` should be the _result_ of the SQL query generated by the model, not the query itself, because there may be multiple valid queries that answer a single question.
      #   @return [Object]
      optional :output, Braintrust::Unknown

      # @!attribute [rw] scores
      #   A dictionary of numeric values (between 0 and 1) to log. The scores should give you a variety of signals that help you determine how accurate the outputs are compared to what you expect and diagnose failures. For example, a summarization app might have one score that tells you how accurate the summary is, and another that measures the word similarity between the generated and grouth truth summary. The word similarity score could help you determine whether the summarization was covering similar concepts or not. You can use these scores to help you sort, filter, and compare logs.
      #   @return [Hash]
      optional :scores, Hash

      # @!attribute [rw] span_attributes
      #   Human-identifying attributes of the span, such as name, type, etc.
      #   @return [Braintrust::Models::InsertProjectLogsEventReplace::SpanAttributes]
      optional :span_attributes, -> { Braintrust::Models::InsertProjectLogsEventReplace::SpanAttributes }

      # @!attribute [rw] tags
      #   A list of tags to log
      #   @return [Array<String>]
      optional :tags, Braintrust::ArrayOf.new(String)

      class Context < BaseModel
        # @!attribute [rw] caller_filename
        #   Name of the file in code where the project logs event was created
        #   @return [String]
        optional :caller_filename, String

        # @!attribute [rw] caller_functionname
        #   The function in code which created the project logs event
        #   @return [String]
        optional :caller_functionname, String

        # @!attribute [rw] caller_lineno
        #   Line of code where the project logs event was created
        #   @return [Integer]
        optional :caller_lineno, Integer
      end

      class Metrics < BaseModel
        # @!attribute [rw] completion_tokens
        #   The number of tokens in the completion generated by the model (only set if this is an LLM span)
        #   @return [Integer]
        optional :completion_tokens, Integer

        # @!attribute [rw] end_
        #   A unix timestamp recording when the section of code which produced the project logs event finished
        #   @return [Float]
        optional :end_, Float

        # @!attribute [rw] prompt_tokens
        #   The number of tokens in the prompt used to generate the project logs event (only set if this is an LLM span)
        #   @return [Integer]
        optional :prompt_tokens, Integer

        # @!attribute [rw] start
        #   A unix timestamp recording when the section of code which produced the project logs event started
        #   @return [Float]
        optional :start, Float

        # @!attribute [rw] tokens
        #   The total number of tokens in the input and output of the project logs event.
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
        #   One of the constants defined in {Braintrust::Models::InsertProjectLogsEventReplace::SpanAttributes::Type}
        #   @return [Symbol]
        optional :type, enum: -> { Braintrust::Models::InsertProjectLogsEventReplace::SpanAttributes::Type }

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
