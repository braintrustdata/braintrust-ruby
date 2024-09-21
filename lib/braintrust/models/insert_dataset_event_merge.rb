# frozen_string_literal: true

module Braintrust
  module Models
    class InsertDatasetEventMerge < BaseModel
      # @!attribute [rw] _is_merge
      #   The `_is_merge` field controls how the row is merged with any existing row with the same id in the DB. By default (or when set to `false`), the existing row is completely replaced by the new row. When set to `true`, the new row is deep-merged into the existing row
      # 
      # For example, say there is an existing row in the DB `{"id": "foo", "input": {"a": 5, "b": 10}}`. If we merge a new row as `{"_is_merge": true, "id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be `{"id": "foo", "input": {"a": 5, "b": 11, "c": 20}}`. If we replace the new row as `{"id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be `{"id": "foo", "input": {"b": 11, "c": 20}}`
      #   @return [Boolean]
      required :_is_merge, Braintrust::BooleanModel

      # @!attribute [rw] id
      #   A unique identifier for the dataset event. If you don't provide one, BrainTrust will generate one for you
      #   @return [String]
      optional :id, String

      # @!attribute [rw] _merge_paths
      #   The `_merge_paths` field allows controlling the depth of the merge. It can only be specified alongside `_is_merge=true`. `_merge_paths` is a list of paths, where each path is a list of field names. The deep merge will not descend below any of the specified merge paths.
      # 
      # For example, say there is an existing row in the DB `{"id": "foo", "input": {"a": {"b": 10}, "c": {"d": 20}}, "output": {"a": 20}}`. If we merge a new row as `{"_is_merge": true, "_merge_paths": [["input", "a"], ["output"]], "input": {"a": {"q": 30}, "c": {"e": 30}, "bar": "baz"}, "output": {"d": 40}}`, the new row will be `{"id": "foo": "input": {"a": {"q": 30}, "c": {"d": 20, "e": 30}, "bar": "baz"}, "output": {"d": 40}}`. In this case, due to the merge paths, we have replaced `input.a` and `output`, but have still deep-merged `input` and `input.c`.
      #   @return [Array<Array<String>>]
      optional :_merge_paths, Braintrust::ArrayOf.new(Braintrust::ArrayOf.new(String))

      # @!attribute [rw] _object_delete
      #   Pass `_object_delete=true` to mark the dataset event deleted. Deleted events will not show up in subsequent fetches for this dataset
      #   @return [Boolean]
      optional :_object_delete, Braintrust::BooleanModel

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
