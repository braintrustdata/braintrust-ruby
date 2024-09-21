# frozen_string_literal: true

module Braintrust
  module Models
    class InsertDatasetEventReplace < BaseModel
      # @!attribute [rw] id
      #   A unique identifier for the dataset event. If you don't provide one, BrainTrust will generate one for you
      #   @return [String]
      optional :id, String

      # @!attribute [rw] _is_merge
      #   The `_is_merge` field controls how the row is merged with any existing row with the same id in the DB. By default (or when set to `false`), the existing row is completely replaced by the new row. When set to `true`, the new row is deep-merged into the existing row
      # 
      # For example, say there is an existing row in the DB `{"id": "foo", "input": {"a": 5, "b": 10}}`. If we merge a new row as `{"_is_merge": true, "id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be `{"id": "foo", "input": {"a": 5, "b": 11, "c": 20}}`. If we replace the new row as `{"id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be `{"id": "foo", "input": {"b": 11, "c": 20}}`
      #   @return [Boolean]
      optional :_is_merge, Braintrust::BooleanModel

      # @!attribute [rw] _object_delete
      #   Pass `_object_delete=true` to mark the dataset event deleted. Deleted events will not show up in subsequent fetches for this dataset
      #   @return [Boolean]
      optional :_object_delete, Braintrust::BooleanModel

      # @!attribute [rw] _parent_id
      #   Use the `_parent_id` field to create this row as a subspan of an existing row. It cannot be specified alongside `_is_merge=true`. Tracking hierarchical relationships are important for tracing (see the [guide](https://www.braintrust.dev/docs/guides/tracing) for full details).
      # 
      # For example, say we have logged a row `{"id": "abc", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`. We can create a sub-span of the parent row by logging `{"_parent_id": "abc", "id": "llm_call", "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`. In the webapp, only the root span row `"abc"` will show up in the summary view. You can view the full trace hierarchy (in this case, the `"llm_call"` row) by clicking on the "abc" row.
      #   @return [String]
      optional :_parent_id, String

      # @!attribute [rw] created
      #   The timestamp the dataset event was created
      #   @return [DateTime]
      optional :created, DateTime

      # @!attribute [rw] expected
      #   The output of your application, including post-processing (an arbitrary, JSON serializable object)
      #   @return [Object]
      optional :expected, Braintrust::Unknown

      # @!attribute [rw] input
      #   The argument that uniquely define an input case (an arbitrary, JSON serializable object)
      #   @return [Object]
      optional :input, Braintrust::Unknown

      # @!attribute [rw] metadata
      #   A dictionary with additional data about the test example, model outputs, or just about anything else that's relevant, that you can use to help find and analyze examples later. For example, you could log the `prompt`, example's `id`, or anything else that would be useful to slice/dice later. The values in `metadata` can be any JSON-serializable type, but its keys must be strings
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] tags
      #   A list of tags to log
      #   @return [Array<String>]
      optional :tags, Braintrust::ArrayOf.new(String)
    end
  end
end
