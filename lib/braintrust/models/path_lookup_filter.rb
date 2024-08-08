# frozen_string_literal: true

module Braintrust
  module Models
    class PathLookupFilter < BaseModel
      # @!attribute [rw] path
      #   List of fields describing the path to the value to be checked against. For instance, if you wish to filter on the value of `c` in `{"input": {"a": {"b": {"c": "hello"}}}}`, pass `path=["input", "a", "b", "c"]`
      #   @return [Array<String>]
      required :path, Braintrust::ArrayOf.new(String)

      # @!attribute [rw] type
      #   Denotes the type of filter as a path-lookup filter
      #   @return [Symbol]
      required :type, Braintrust::Enum.new(:path_lookup)

      # @!attribute [rw] value
      #   The value to compare equality-wise against the event value at the specified `path`. The value must be a "primitive", that is, any JSON-serializable object except for objects and arrays. For instance, if you wish to filter on the value of "input.a.b.c" in the object `{"input": {"a": {"b": {"c": "hello"}}}}`, pass `value="hello"`
      #   @return [Object]
      optional :value, Braintrust::Unknown
    end
  end
end
