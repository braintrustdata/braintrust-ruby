# frozen_string_literal: true

module Braintrust
  module Models
    class InsertDatasetEvent < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   A unique identifier for the dataset event. If you don't provide one, BrainTrust
      #     will generate one for you
      #
      #   @return [String, nil]
      optional :id, String, nil?: true

      # @!attribute _is_merge
      #   The `_is_merge` field controls how the row is merged with any existing row with
      #     the same id in the DB. By default (or when set to `false`), the existing row is
      #     completely replaced by the new row. When set to `true`, the new row is
      #     deep-merged into the existing row, if one is found. If no existing row is found,
      #     the new row is inserted as is.
      #
      #     For example, say there is an existing row in the DB
      #     `{"id": "foo", "input": {"a": 5, "b": 10}}`. If we merge a new row as
      #     `{"_is_merge": true, "id": "foo", "input": {"b": 11, "c": 20}}`, the new row
      #     will be `{"id": "foo", "input": {"a": 5, "b": 11, "c": 20}}`. If we replace the
      #     new row as `{"id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be
      #     `{"id": "foo", "input": {"b": 11, "c": 20}}`
      #
      #   @return [Boolean, nil]
      optional :_is_merge, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute _merge_paths
      #   The `_merge_paths` field allows controlling the depth of the merge, when
      #     `_is_merge=true`. `_merge_paths` is a list of paths, where each path is a list
      #     of field names. The deep merge will not descend below any of the specified merge
      #     paths.
      #
      #     For example, say there is an existing row in the DB
      #     `{"id": "foo", "input": {"a": {"b": 10}, "c": {"d": 20}}, "output": {"a": 20}}`.
      #     If we merge a new row as
      #     `{"_is_merge": true, "_merge_paths": [["input", "a"], ["output"]], "input": {"a": {"q": 30}, "c": {"e": 30}, "bar": "baz"}, "output": {"d": 40}}`,
      #     the new row will be
      #     `{"id": "foo": "input": {"a": {"q": 30}, "c": {"d": 20, "e": 30}, "bar": "baz"}, "output": {"d": 40}}`.
      #     In this case, due to the merge paths, we have replaced `input.a` and `output`,
      #     but have still deep-merged `input` and `input.c`.
      #
      #   @return [Array<Array<String>>, nil]
      optional :_merge_paths,
               Braintrust::Internal::Type::ArrayOf[Braintrust::Internal::Type::ArrayOf[String]],
               nil?: true

      # @!attribute _object_delete
      #   Pass `_object_delete=true` to mark the dataset event deleted. Deleted events
      #     will not show up in subsequent fetches for this dataset
      #
      #   @return [Boolean, nil]
      optional :_object_delete, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute _parent_id
      #   DEPRECATED: The `_parent_id` field is deprecated and should not be used. Support
      #     for `_parent_id` will be dropped in a future version of Braintrust. Log
      #     `span_id`, `root_span_id`, and `span_parents` explicitly instead.
      #
      #     Use the `_parent_id` field to create this row as a subspan of an existing row.
      #     Tracking hierarchical relationships are important for tracing (see the
      #     [guide](https://www.braintrust.dev/docs/guides/tracing) for full details).
      #
      #     For example, say we have logged a row
      #     `{"id": "abc", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      #     We can create a sub-span of the parent row by logging
      #     `{"_parent_id": "abc", "id": "llm_call", "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      #     In the webapp, only the root span row `"abc"` will show up in the summary view.
      #     You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      #     clicking on the "abc" row.
      #
      #     If the row is being merged into an existing row, this field will be ignored.
      #
      #   @return [String, nil]
      optional :_parent_id, String, nil?: true

      # @!attribute created
      #   The timestamp the dataset event was created
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute [r] expected
      #   The output of your application, including post-processing (an arbitrary, JSON
      #     serializable object)
      #
      #   @return [Object, nil]
      optional :expected, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :expected

      # @!attribute [r] input
      #   The argument that uniquely define an input case (an arbitrary, JSON serializable
      #     object)
      #
      #   @return [Object, nil]
      optional :input, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :input

      # @!attribute metadata
      #   A dictionary with additional data about the test example, model outputs, or just
      #     about anything else that's relevant, that you can use to help find and analyze
      #     examples later. For example, you could log the `prompt`, example's `id`, or
      #     anything else that would be useful to slice/dice later. The values in `metadata`
      #     can be any JSON-serializable type, but its keys must be strings
      #
      #   @return [Braintrust::Models::InsertDatasetEvent::Metadata, nil]
      optional :metadata, -> { Braintrust::Models::InsertDatasetEvent::Metadata }, nil?: true

      # @!attribute origin
      #   Indicates the event was copied from another object.
      #
      #   @return [Braintrust::Models::ObjectReference, nil]
      optional :origin, -> { Braintrust::Models::ObjectReference }, nil?: true

      # @!attribute root_span_id
      #   Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
      #     is now deprecated. The span_id is a unique identifier describing the row's place
      #     in the a trace, and the root_span_id is a unique identifier for the whole trace.
      #     See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
      #     details.
      #
      #     For example, say we have logged a row
      #     `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      #     We can create a sub-span of the parent row by logging
      #     `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      #     In the webapp, only the root span row `"abc"` will show up in the summary view.
      #     You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      #     clicking on the "abc" row.
      #
      #     If the row is being merged into an existing row, this field will be ignored.
      #
      #   @return [String, nil]
      optional :root_span_id, String, nil?: true

      # @!attribute span_id
      #   Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
      #     is now deprecated. The span_id is a unique identifier describing the row's place
      #     in the a trace, and the root_span_id is a unique identifier for the whole trace.
      #     See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
      #     details.
      #
      #     For example, say we have logged a row
      #     `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      #     We can create a sub-span of the parent row by logging
      #     `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      #     In the webapp, only the root span row `"abc"` will show up in the summary view.
      #     You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      #     clicking on the "abc" row.
      #
      #     If the row is being merged into an existing row, this field will be ignored.
      #
      #   @return [String, nil]
      optional :span_id, String, nil?: true

      # @!attribute span_parents
      #   Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
      #     is now deprecated. The span_id is a unique identifier describing the row's place
      #     in the a trace, and the root_span_id is a unique identifier for the whole trace.
      #     See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
      #     details.
      #
      #     For example, say we have logged a row
      #     `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      #     We can create a sub-span of the parent row by logging
      #     `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      #     In the webapp, only the root span row `"abc"` will show up in the summary view.
      #     You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      #     clicking on the "abc" row.
      #
      #     If the row is being merged into an existing row, this field will be ignored.
      #
      #   @return [Array<String>, nil]
      optional :span_parents, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute tags
      #   A list of tags to log
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!parse
      #   # A dataset event
      #   #
      #   # @param id [String, nil]
      #   # @param _is_merge [Boolean, nil]
      #   # @param _merge_paths [Array<Array<String>>, nil]
      #   # @param _object_delete [Boolean, nil]
      #   # @param _parent_id [String, nil]
      #   # @param created [Time, nil]
      #   # @param expected [Object]
      #   # @param input [Object]
      #   # @param metadata [Braintrust::Models::InsertDatasetEvent::Metadata, nil]
      #   # @param origin [Braintrust::Models::ObjectReference, nil]
      #   # @param root_span_id [String, nil]
      #   # @param span_id [String, nil]
      #   # @param span_parents [Array<String>, nil]
      #   # @param tags [Array<String>, nil]
      #   #
      #   def initialize(
      #     id: nil,
      #     _is_merge: nil,
      #     _merge_paths: nil,
      #     _object_delete: nil,
      #     _parent_id: nil,
      #     created: nil,
      #     expected: nil,
      #     input: nil,
      #     metadata: nil,
      #     origin: nil,
      #     root_span_id: nil,
      #     span_id: nil,
      #     span_parents: nil,
      #     tags: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      # @see Braintrust::Models::InsertDatasetEvent#metadata
      class Metadata < Braintrust::Internal::Type::BaseModel
        # @!attribute model
        #   The model used for this example
        #
        #   @return [String, nil]
        optional :model, String, nil?: true

        # @!parse
        #   # A dictionary with additional data about the test example, model outputs, or just
        #   #   about anything else that's relevant, that you can use to help find and analyze
        #   #   examples later. For example, you could log the `prompt`, example's `id`, or
        #   #   anything else that would be useful to slice/dice later. The values in `metadata`
        #   #   can be any JSON-serializable type, but its keys must be strings
        #   #
        #   # @param model [String, nil]
        #   #
        #   def initialize(model: nil, **) = super

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
      end
    end
  end
end
