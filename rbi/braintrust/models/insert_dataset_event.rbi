# typed: strong

module Braintrust
  module Models
    class InsertDatasetEvent < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # A unique identifier for the dataset event. If you don't provide one, BrainTrust
      # will generate one for you
      sig { returns(T.nilable(String)) }
      attr_accessor :id

      # The `_is_merge` field controls how the row is merged with any existing row with
      # the same id in the DB. By default (or when set to `false`), the existing row is
      # completely replaced by the new row. When set to `true`, the new row is
      # deep-merged into the existing row, if one is found. If no existing row is found,
      # the new row is inserted as is.
      #
      # For example, say there is an existing row in the DB
      # `{"id": "foo", "input": {"a": 5, "b": 10}}`. If we merge a new row as
      # `{"_is_merge": true, "id": "foo", "input": {"b": 11, "c": 20}}`, the new row
      # will be `{"id": "foo", "input": {"a": 5, "b": 11, "c": 20}}`. If we replace the
      # new row as `{"id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be
      # `{"id": "foo", "input": {"b": 11, "c": 20}}`
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :_is_merge

      # The `_merge_paths` field allows controlling the depth of the merge, when
      # `_is_merge=true`. `_merge_paths` is a list of paths, where each path is a list
      # of field names. The deep merge will not descend below any of the specified merge
      # paths.
      #
      # For example, say there is an existing row in the DB
      # `{"id": "foo", "input": {"a": {"b": 10}, "c": {"d": 20}}, "output": {"a": 20}}`.
      # If we merge a new row as
      # `{"_is_merge": true, "_merge_paths": [["input", "a"], ["output"]], "input": {"a": {"q": 30}, "c": {"e": 30}, "bar": "baz"}, "output": {"d": 40}}`,
      # the new row will be
      # `{"id": "foo": "input": {"a": {"q": 30}, "c": {"d": 20, "e": 30}, "bar": "baz"}, "output": {"d": 40}}`.
      # In this case, due to the merge paths, we have replaced `input.a` and `output`,
      # but have still deep-merged `input` and `input.c`.
      sig { returns(T.nilable(T::Array[T::Array[String]])) }
      attr_accessor :_merge_paths

      # Pass `_object_delete=true` to mark the dataset event deleted. Deleted events
      # will not show up in subsequent fetches for this dataset
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :_object_delete

      # DEPRECATED: The `_parent_id` field is deprecated and should not be used. Support
      # for `_parent_id` will be dropped in a future version of Braintrust. Log
      # `span_id`, `root_span_id`, and `span_parents` explicitly instead.
      #
      # Use the `_parent_id` field to create this row as a subspan of an existing row.
      # Tracking hierarchical relationships are important for tracing (see the
      # [guide](https://www.braintrust.dev/docs/guides/tracing) for full details).
      #
      # For example, say we have logged a row
      # `{"id": "abc", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      # We can create a sub-span of the parent row by logging
      # `{"_parent_id": "abc", "id": "llm_call", "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      # In the webapp, only the root span row `"abc"` will show up in the summary view.
      # You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      # clicking on the "abc" row.
      #
      # If the row is being merged into an existing row, this field will be ignored.
      sig { returns(T.nilable(String)) }
      attr_accessor :_parent_id

      # The timestamp the dataset event was created
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # The output of your application, including post-processing (an arbitrary, JSON
      # serializable object)
      sig { returns(T.nilable(T.anything)) }
      attr_reader :expected

      sig { params(expected: T.anything).void }
      attr_writer :expected

      # The argument that uniquely define an input case (an arbitrary, JSON serializable
      # object)
      sig { returns(T.nilable(T.anything)) }
      attr_reader :input

      sig { params(input: T.anything).void }
      attr_writer :input

      # A dictionary with additional data about the test example, model outputs, or just
      # about anything else that's relevant, that you can use to help find and analyze
      # examples later. For example, you could log the `prompt`, example's `id`, or
      # anything else that would be useful to slice/dice later. The values in `metadata`
      # can be any JSON-serializable type, but its keys must be strings
      sig { returns(T.nilable(Braintrust::InsertDatasetEvent::Metadata)) }
      attr_reader :metadata

      sig do
        params(
          metadata: T.nilable(Braintrust::InsertDatasetEvent::Metadata::OrHash)
        ).void
      end
      attr_writer :metadata

      # Indicates the event was copied from another object.
      sig { returns(T.nilable(Braintrust::ObjectReference)) }
      attr_reader :origin

      sig do
        params(origin: T.nilable(Braintrust::ObjectReference::OrHash)).void
      end
      attr_writer :origin

      # Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
      # is now deprecated. The span_id is a unique identifier describing the row's place
      # in the a trace, and the root_span_id is a unique identifier for the whole trace.
      # See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
      # details.
      #
      # For example, say we have logged a row
      # `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      # We can create a sub-span of the parent row by logging
      # `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      # In the webapp, only the root span row `"abc"` will show up in the summary view.
      # You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      # clicking on the "abc" row.
      #
      # If the row is being merged into an existing row, this field will be ignored.
      sig { returns(T.nilable(String)) }
      attr_accessor :root_span_id

      # Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
      # is now deprecated. The span_id is a unique identifier describing the row's place
      # in the a trace, and the root_span_id is a unique identifier for the whole trace.
      # See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
      # details.
      #
      # For example, say we have logged a row
      # `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      # We can create a sub-span of the parent row by logging
      # `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      # In the webapp, only the root span row `"abc"` will show up in the summary view.
      # You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      # clicking on the "abc" row.
      #
      # If the row is being merged into an existing row, this field will be ignored.
      sig { returns(T.nilable(String)) }
      attr_accessor :span_id

      # Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
      # is now deprecated. The span_id is a unique identifier describing the row's place
      # in the a trace, and the root_span_id is a unique identifier for the whole trace.
      # See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
      # details.
      #
      # For example, say we have logged a row
      # `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
      # We can create a sub-span of the parent row by logging
      # `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
      # In the webapp, only the root span row `"abc"` will show up in the summary view.
      # You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
      # clicking on the "abc" row.
      #
      # If the row is being merged into an existing row, this field will be ignored.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :span_parents

      # A list of tags to log
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      # A dataset event
      sig do
        params(
          id: T.nilable(String),
          _is_merge: T.nilable(T::Boolean),
          _merge_paths: T.nilable(T::Array[T::Array[String]]),
          _object_delete: T.nilable(T::Boolean),
          _parent_id: T.nilable(String),
          created: T.nilable(Time),
          expected: T.anything,
          input: T.anything,
          metadata: T.nilable(Braintrust::InsertDatasetEvent::Metadata::OrHash),
          origin: T.nilable(Braintrust::ObjectReference::OrHash),
          root_span_id: T.nilable(String),
          span_id: T.nilable(String),
          span_parents: T.nilable(T::Array[String]),
          tags: T.nilable(T::Array[String])
        ).returns(T.attached_class)
      end
      def self.new(
        # A unique identifier for the dataset event. If you don't provide one, BrainTrust
        # will generate one for you
        id: nil,
        # The `_is_merge` field controls how the row is merged with any existing row with
        # the same id in the DB. By default (or when set to `false`), the existing row is
        # completely replaced by the new row. When set to `true`, the new row is
        # deep-merged into the existing row, if one is found. If no existing row is found,
        # the new row is inserted as is.
        #
        # For example, say there is an existing row in the DB
        # `{"id": "foo", "input": {"a": 5, "b": 10}}`. If we merge a new row as
        # `{"_is_merge": true, "id": "foo", "input": {"b": 11, "c": 20}}`, the new row
        # will be `{"id": "foo", "input": {"a": 5, "b": 11, "c": 20}}`. If we replace the
        # new row as `{"id": "foo", "input": {"b": 11, "c": 20}}`, the new row will be
        # `{"id": "foo", "input": {"b": 11, "c": 20}}`
        _is_merge: nil,
        # The `_merge_paths` field allows controlling the depth of the merge, when
        # `_is_merge=true`. `_merge_paths` is a list of paths, where each path is a list
        # of field names. The deep merge will not descend below any of the specified merge
        # paths.
        #
        # For example, say there is an existing row in the DB
        # `{"id": "foo", "input": {"a": {"b": 10}, "c": {"d": 20}}, "output": {"a": 20}}`.
        # If we merge a new row as
        # `{"_is_merge": true, "_merge_paths": [["input", "a"], ["output"]], "input": {"a": {"q": 30}, "c": {"e": 30}, "bar": "baz"}, "output": {"d": 40}}`,
        # the new row will be
        # `{"id": "foo": "input": {"a": {"q": 30}, "c": {"d": 20, "e": 30}, "bar": "baz"}, "output": {"d": 40}}`.
        # In this case, due to the merge paths, we have replaced `input.a` and `output`,
        # but have still deep-merged `input` and `input.c`.
        _merge_paths: nil,
        # Pass `_object_delete=true` to mark the dataset event deleted. Deleted events
        # will not show up in subsequent fetches for this dataset
        _object_delete: nil,
        # DEPRECATED: The `_parent_id` field is deprecated and should not be used. Support
        # for `_parent_id` will be dropped in a future version of Braintrust. Log
        # `span_id`, `root_span_id`, and `span_parents` explicitly instead.
        #
        # Use the `_parent_id` field to create this row as a subspan of an existing row.
        # Tracking hierarchical relationships are important for tracing (see the
        # [guide](https://www.braintrust.dev/docs/guides/tracing) for full details).
        #
        # For example, say we have logged a row
        # `{"id": "abc", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
        # We can create a sub-span of the parent row by logging
        # `{"_parent_id": "abc", "id": "llm_call", "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
        # In the webapp, only the root span row `"abc"` will show up in the summary view.
        # You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
        # clicking on the "abc" row.
        #
        # If the row is being merged into an existing row, this field will be ignored.
        _parent_id: nil,
        # The timestamp the dataset event was created
        created: nil,
        # The output of your application, including post-processing (an arbitrary, JSON
        # serializable object)
        expected: nil,
        # The argument that uniquely define an input case (an arbitrary, JSON serializable
        # object)
        input: nil,
        # A dictionary with additional data about the test example, model outputs, or just
        # about anything else that's relevant, that you can use to help find and analyze
        # examples later. For example, you could log the `prompt`, example's `id`, or
        # anything else that would be useful to slice/dice later. The values in `metadata`
        # can be any JSON-serializable type, but its keys must be strings
        metadata: nil,
        # Indicates the event was copied from another object.
        origin: nil,
        # Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
        # is now deprecated. The span_id is a unique identifier describing the row's place
        # in the a trace, and the root_span_id is a unique identifier for the whole trace.
        # See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
        # details.
        #
        # For example, say we have logged a row
        # `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
        # We can create a sub-span of the parent row by logging
        # `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
        # In the webapp, only the root span row `"abc"` will show up in the summary view.
        # You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
        # clicking on the "abc" row.
        #
        # If the row is being merged into an existing row, this field will be ignored.
        root_span_id: nil,
        # Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
        # is now deprecated. The span_id is a unique identifier describing the row's place
        # in the a trace, and the root_span_id is a unique identifier for the whole trace.
        # See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
        # details.
        #
        # For example, say we have logged a row
        # `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
        # We can create a sub-span of the parent row by logging
        # `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
        # In the webapp, only the root span row `"abc"` will show up in the summary view.
        # You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
        # clicking on the "abc" row.
        #
        # If the row is being merged into an existing row, this field will be ignored.
        span_id: nil,
        # Use `span_id`, `root_span_id`, and `span_parents` instead of `_parent_id`, which
        # is now deprecated. The span_id is a unique identifier describing the row's place
        # in the a trace, and the root_span_id is a unique identifier for the whole trace.
        # See the [guide](https://www.braintrust.dev/docs/guides/tracing) for full
        # details.
        #
        # For example, say we have logged a row
        # `{"id": "abc", "span_id": "span0", "root_span_id": "root_span0", "input": "foo", "output": "bar", "expected": "boo", "scores": {"correctness": 0.33}}`.
        # We can create a sub-span of the parent row by logging
        # `{"id": "llm_call", "span_id": "span1", "root_span_id": "root_span0", "span_parents": ["span0"], "input": {"prompt": "What comes after foo?"}, "output": "bar", "metrics": {"tokens": 1}}`.
        # In the webapp, only the root span row `"abc"` will show up in the summary view.
        # You can view the full trace hierarchy (in this case, the `"llm_call"` row) by
        # clicking on the "abc" row.
        #
        # If the row is being merged into an existing row, this field will be ignored.
        span_parents: nil,
        # A list of tags to log
        tags: nil
      )
      end

      sig do
        override.returns(
          {
            id: T.nilable(String),
            _is_merge: T.nilable(T::Boolean),
            _merge_paths: T.nilable(T::Array[T::Array[String]]),
            _object_delete: T.nilable(T::Boolean),
            _parent_id: T.nilable(String),
            created: T.nilable(Time),
            expected: T.anything,
            input: T.anything,
            metadata: T.nilable(Braintrust::InsertDatasetEvent::Metadata),
            origin: T.nilable(Braintrust::ObjectReference),
            root_span_id: T.nilable(String),
            span_id: T.nilable(String),
            span_parents: T.nilable(T::Array[String]),
            tags: T.nilable(T::Array[String])
          }
        )
      end
      def to_hash
      end

      class Metadata < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

        # The model used for this example
        sig { returns(T.nilable(String)) }
        attr_accessor :model

        # A dictionary with additional data about the test example, model outputs, or just
        # about anything else that's relevant, that you can use to help find and analyze
        # examples later. For example, you could log the `prompt`, example's `id`, or
        # anything else that would be useful to slice/dice later. The values in `metadata`
        # can be any JSON-serializable type, but its keys must be strings
        sig { params(model: T.nilable(String)).returns(T.attached_class) }
        def self.new(
          # The model used for this example
          model: nil
        )
        end

        sig { override.returns({ model: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
