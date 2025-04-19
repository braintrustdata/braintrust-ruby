# frozen_string_literal: true

module Braintrust
  module Models
    class InsertProjectLogsEvent < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   A unique identifier for the project logs event. If you don't provide one,
      #   BrainTrust will generate one for you
      #
      #   @return [String, nil]
      optional :id, String, nil?: true

      # @!attribute _is_merge
      #   The `_is_merge` field controls how the row is merged with any existing row with
      #   the same id in the DB. By default (or when set to `false`), the existing row is
      #   completely replaced by the new row. When set to `true`, the new row is
      #   deep-merged into the existing row, if one is found. If no existing row is found,
      #   the new row is inserted as is.
      #
      #   For example, say there is an existing row in the DB
      #   `{"id": "foo", "input": {"a": 5, "b": 10}}`. If we merge a new row as
      #   `{"_is_merge": true, "id": "foo", "input": {"b": 11, "c": 20}}`, the new row
      #   will be `{"id": "foo", "input": {"a": 5, "b": 11, "c": 20}}`. If we replace the
      #   new row as `{"id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be
      #   `{"id": "foo", "input": {"b": 11, "c": 20}}`
      #
      #   @return [Boolean, nil]
      optional :_is_merge, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute _merge_paths
      #   The `_merge_paths` field allows controlling the depth of the merge, when
      #   `_is_merge=true`. `_merge_paths` is a list of paths, where each path is a list
      #   of field names. The deep merge will not descend below any of the specified merge
      #   paths.
      #
      #   For example, say there is an existing row in the DB
      #   `{"id": "foo", "input": {"a": {"b": 10}, "c": {"d": 20}}, "output": {"a": 20}}`.
      #   If we merge a new row as
      #   `{"_is_merge": true, "_merge_paths": [["input", "a"], ["output"]], "input": {"a": {"q": 30}, "c": {"e": 30}, "bar": "baz"}, "output": {"d": 40}}`,
      #   the new row will be
      #   `{"id": "foo": "input": {"a": {"q": 30}, "c": {"d": 20, "e": 30}, "bar": "baz"}, "output": {"d": 40}}`.
      #   In this case, due to the merge paths, we have replaced `input.a` and `output`,
      #   but have still deep-merged `input` and `input.c`.
      #
      #   @return [Array<Array<String>>, nil]
      optional :_merge_paths,
               Braintrust::Internal::Type::ArrayOf[Braintrust::Internal::Type::ArrayOf[String]],
               nil?: true

      # @!attribute _object_delete
      #   Pass `_object_delete=true` to mark the project logs event deleted. Deleted
      #   events will not show up in subsequent fetches for this project logs
      #
      #   @return [Boolean, nil]
      optional :_object_delete, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute _parent_id
      #   DEPRECATED: The `_parent_id` field is deprecated and should not be used. Support
      #   for `_parent_id` will be dropped in a future version of Braintrust. Log
      #   `span_id`, `root_span_id`, and `span_parents` explicitly instead.
      #
      #   Use the `_parent_id` field to create this row as a subspan of an existing row.
      #   Tracking hierarchical relationships are important for tracing (see the
      #   [guide](https://www.braintrust.dev/docs/guides/tracing) for full details).
      #
      #   For example, say we have logged a row
      #   `{"id": "abc", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      #   We can create a sub-span of the parent row by logging
      #   `{"_parent_id": "abc", "id": "llm_call", "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      #   In the webapp, only the root span row `"abc"` will show up in the summary view.
      #   You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      #   clicking on the "abc" row.
      #
      #   If the row is being merged into an existing row, this field will be ignored.
      #
      #   @return [String, nil]
      optional :_parent_id, String, nil?: true

      # @!attribute context
      #   Context is additional information about the code that produced the project logs
      #   event. It is essentially the textual counterpart to `metrics`. Use the
      #   `caller_*` attributes to track the location in code which produced the project
      #   logs event
      #
      #   @return [Braintrust::Models::InsertProjectLogsEvent::Context, nil]
      optional :context, -> { Braintrust::Models::InsertProjectLogsEvent::Context }, nil?: true

      # @!attribute created
      #   The timestamp the project logs event was created
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute [r] error
      #   The error that occurred, if any.
      #
      #   @return [Object, nil]
      optional :error, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :error

      # @!attribute [r] expected
      #   The ground truth value (an arbitrary, JSON serializable object) that you'd
      #   compare to `output` to determine if your `output` value is correct or not.
      #   Braintrust currently does not compare `output` to `expected` for you, since
      #   there are so many different ways to do that correctly. Instead, these values are
      #   just used to help you navigate while digging into analyses. However, we may
      #   later use these values to re-score outputs or fine-tune your models.
      #
      #   @return [Object, nil]
      optional :expected, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :expected

      # @!attribute [r] input
      #   The arguments that uniquely define a user input (an arbitrary, JSON serializable
      #   object).
      #
      #   @return [Object, nil]
      optional :input, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :input

      # @!attribute metadata
      #   A dictionary with additional data about the test example, model outputs, or just
      #   about anything else that's relevant, that you can use to help find and analyze
      #   examples later. For example, you could log the `prompt`, example's `id`, or
      #   anything else that would be useful to slice/dice later. The values in `metadata`
      #   can be any JSON-serializable type, but its keys must be strings
      #
      #   @return [Braintrust::Models::InsertProjectLogsEvent::Metadata, nil]
      optional :metadata, -> { Braintrust::Models::InsertProjectLogsEvent::Metadata }, nil?: true

      # @!attribute metrics
      #   Metrics are numerical measurements tracking the execution of the code that
      #   produced the project logs event. Use "start" and "end" to track the time span
      #   over which the project logs event was produced
      #
      #   @return [Braintrust::Models::InsertProjectLogsEvent::Metrics, nil]
      optional :metrics, -> { Braintrust::Models::InsertProjectLogsEvent::Metrics }, nil?: true

      # @!attribute origin
      #   Indicates the event was copied from another object.
      #
      #   @return [Braintrust::Models::ObjectReference, nil]
      optional :origin, -> { Braintrust::Models::ObjectReference }, nil?: true

      # @!attribute [r] output
      #   The output of your application, including post-processing (an arbitrary, JSON
      #   serializable object), that allows you to determine whether the result is correct
      #   or not. For example, in an app that generates SQL queries, the `output` should
      #   be the _result_ of the SQL query generated by the model, not the query itself,
      #   because there may be multiple valid queries that answer a single question.
      #
      #   @return [Object, nil]
      optional :output, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :output

      # @!attribute root_span_id
      #   Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
      #   is now deprecated. The span_id is a unique identifier describing the row's place
      #   in the a trace, and the root_span_id is a unique identifier for the whole trace.
      #   See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
      #   details.
      #
      #   For example, say we have logged a row
      #   `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      #   We can create a sub-span of the parent row by logging
      #   `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      #   In the webapp, only the root span row `"abc"` will show up in the summary view.
      #   You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      #   clicking on the "abc" row.
      #
      #   If the row is being merged into an existing row, this field will be ignored.
      #
      #   @return [String, nil]
      optional :root_span_id, String, nil?: true

      # @!attribute scores
      #   A dictionary of numeric values (between 0 and 1) to log. The scores should give
      #   you a variety of signals that help you determine how accurate the outputs are
      #   compared to what you expect and diagnose failures. For example, a summarization
      #   app might have one score that tells you how accurate the summary is, and another
      #   that measures the word similarity between the generated and grouth truth
      #   summary. The word similarity score could help you determine whether the
      #   summarization was covering similar concepts or not. You can use these scores to
      #   help you sort, filter, and compare logs.
      #
      #   @return [Hash{Symbol=>Float, nil}, nil]
      optional :scores, Braintrust::Internal::Type::HashOf[Float, nil?: true], nil?: true

      # @!attribute span_attributes
      #   Human-identifying attributes of the span, such as name, type, etc.
      #
      #   @return [Braintrust::Models::SpanAttributes, nil]
      optional :span_attributes, -> { Braintrust::Models::SpanAttributes }, nil?: true

      # @!attribute span_id
      #   Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
      #   is now deprecated. The span_id is a unique identifier describing the row's place
      #   in the a trace, and the root_span_id is a unique identifier for the whole trace.
      #   See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
      #   details.
      #
      #   For example, say we have logged a row
      #   `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      #   We can create a sub-span of the parent row by logging
      #   `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      #   In the webapp, only the root span row `"abc"` will show up in the summary view.
      #   You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      #   clicking on the "abc" row.
      #
      #   If the row is being merged into an existing row, this field will be ignored.
      #
      #   @return [String, nil]
      optional :span_id, String, nil?: true

      # @!attribute span_parents
      #   Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
      #   is now deprecated. The span_id is a unique identifier describing the row's place
      #   in the a trace, and the root_span_id is a unique identifier for the whole trace.
      #   See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
      #   details.
      #
      #   For example, say we have logged a row
      #   `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      #   We can create a sub-span of the parent row by logging
      #   `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      #   In the webapp, only the root span row `"abc"` will show up in the summary view.
      #   You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      #   clicking on the "abc" row.
      #
      #   If the row is being merged into an existing row, this field will be ignored.
      #
      #   @return [Array<String>, nil]
      optional :span_parents, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute tags
      #   A list of tags to log
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(id: nil, _is_merge: nil, _merge_paths: nil, _object_delete: nil, _parent_id: nil, context: nil, created: nil, error: nil, expected: nil, input: nil, metadata: nil, metrics: nil, origin: nil, output: nil, root_span_id: nil, scores: nil, span_attributes: nil, span_id: nil, span_parents: nil, tags: nil)
      #   A project logs event
      #
      #   @param id [String, nil]
      #   @param _is_merge [Boolean, nil]
      #   @param _merge_paths [Array<Array<String>>, nil]
      #   @param _object_delete [Boolean, nil]
      #   @param _parent_id [String, nil]
      #   @param context [Braintrust::Models::InsertProjectLogsEvent::Context, nil]
      #   @param created [Time, nil]
      #   @param error [Object]
      #   @param expected [Object]
      #   @param input [Object]
      #   @param metadata [Braintrust::Models::InsertProjectLogsEvent::Metadata, nil]
      #   @param metrics [Braintrust::Models::InsertProjectLogsEvent::Metrics, nil]
      #   @param origin [Braintrust::Models::ObjectReference, nil]
      #   @param output [Object]
      #   @param root_span_id [String, nil]
      #   @param scores [Hash{Symbol=>Float, nil}, nil]
      #   @param span_attributes [Braintrust::Models::SpanAttributes, nil]
      #   @param span_id [String, nil]
      #   @param span_parents [Array<String>, nil]
      #   @param tags [Array<String>, nil]

      # @see Braintrust::Models::InsertProjectLogsEvent#context
      class Context < Braintrust::Internal::Type::BaseModel
        # @!attribute caller_filename
        #   Name of the file in code where the project logs event was created
        #
        #   @return [String, nil]
        optional :caller_filename, String, nil?: true

        # @!attribute caller_functionname
        #   The function in code which created the project logs event
        #
        #   @return [String, nil]
        optional :caller_functionname, String, nil?: true

        # @!attribute caller_lineno
        #   Line of code where the project logs event was created
        #
        #   @return [Integer, nil]
        optional :caller_lineno, Integer, nil?: true

        # @!method initialize(caller_filename: nil, caller_functionname: nil, caller_lineno: nil)
        #   Context is additional information about the code that produced the project logs
        #   event. It is essentially the textual counterpart to `metrics`. Use the
        #   `caller_*` attributes to track the location in code which produced the project
        #   logs event
        #
        #   @param caller_filename [String, nil]
        #   @param caller_functionname [String, nil]
        #   @param caller_lineno [Integer, nil]
      end

      # @see Braintrust::Models::InsertProjectLogsEvent#metadata
      class Metadata < Braintrust::Internal::Type::BaseModel
        # @!attribute model
        #   The model used for this example
        #
        #   @return [String, nil]
        optional :model, String, nil?: true

        # @!method initialize(model: nil)
        #   A dictionary with additional data about the test example, model outputs, or just
        #   about anything else that's relevant, that you can use to help find and analyze
        #   examples later. For example, you could log the `prompt`, example's `id`, or
        #   anything else that would be useful to slice/dice later. The values in `metadata`
        #   can be any JSON-serializable type, but its keys must be strings
        #
        #   @param model [String, nil]
      end

      # @see Braintrust::Models::InsertProjectLogsEvent#metrics
      class Metrics < Braintrust::Internal::Type::BaseModel
        # @!attribute [r] caller_filename
        #   This metric is deprecated
        #
        #   @return [Object, nil]
        optional :caller_filename, Braintrust::Internal::Type::Unknown

        # @!parse
        #   # @return [Object]
        #   attr_writer :caller_filename

        # @!attribute [r] caller_functionname
        #   This metric is deprecated
        #
        #   @return [Object, nil]
        optional :caller_functionname, Braintrust::Internal::Type::Unknown

        # @!parse
        #   # @return [Object]
        #   attr_writer :caller_functionname

        # @!attribute [r] caller_lineno
        #   This metric is deprecated
        #
        #   @return [Object, nil]
        optional :caller_lineno, Braintrust::Internal::Type::Unknown

        # @!parse
        #   # @return [Object]
        #   attr_writer :caller_lineno

        # @!attribute completion_tokens
        #   The number of tokens in the completion generated by the model (only set if this
        #   is an LLM span)
        #
        #   @return [Integer, nil]
        optional :completion_tokens, Integer, nil?: true

        # @!attribute end_
        #   A unix timestamp recording when the section of code which produced the project
        #   logs event finished
        #
        #   @return [Float, nil]
        optional :end_, Float, api_name: :end, nil?: true

        # @!attribute prompt_tokens
        #   The number of tokens in the prompt used to generate the project logs event (only
        #   set if this is an LLM span)
        #
        #   @return [Integer, nil]
        optional :prompt_tokens, Integer, nil?: true

        # @!attribute start
        #   A unix timestamp recording when the section of code which produced the project
        #   logs event started
        #
        #   @return [Float, nil]
        optional :start, Float, nil?: true

        # @!attribute tokens
        #   The total number of tokens in the input and output of the project logs event.
        #
        #   @return [Integer, nil]
        optional :tokens, Integer, nil?: true

        # @!method initialize(caller_filename: nil, caller_functionname: nil, caller_lineno: nil, completion_tokens: nil, end_: nil, prompt_tokens: nil, start: nil, tokens: nil)
        #   Metrics are numerical measurements tracking the execution of the code that
        #   produced the project logs event. Use "start" and "end" to track the time span
        #   over which the project logs event was produced
        #
        #   @param caller_filename [Object]
        #   @param caller_functionname [Object]
        #   @param caller_lineno [Object]
        #   @param completion_tokens [Integer, nil]
        #   @param end_ [Float, nil]
        #   @param prompt_tokens [Integer, nil]
        #   @param start [Float, nil]
        #   @param tokens [Integer, nil]
      end
    end
  end
end
