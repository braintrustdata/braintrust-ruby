# typed: strong

module Braintrust
  module Models
    class InsertExperimentEvent < Braintrust::Internal::Type::BaseModel
      # A unique identifier for the experiment event. If you don't provide one,
      # BrainTrust will generate one for you
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

      # Pass `_object_delete=true` to mark the experiment event deleted. Deleted events
      # will not show up in subsequent fetches for this experiment
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

      # Context is additional information about the code that produced the experiment
      # event. It is essentially the textual counterpart to `metrics`. Use the
      # `caller_*` attributes to track the location in code which produced the
      # experiment event
      sig { returns(T.nilable(Braintrust::Models::InsertExperimentEvent::Context)) }
      attr_reader :context

      sig do
        params(
          context: T.nilable(T.any(Braintrust::Models::InsertExperimentEvent::Context, Braintrust::Internal::AnyHash))
        )
          .void
      end
      attr_writer :context

      # The timestamp the experiment event was created
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # The error that occurred, if any.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :error

      sig { params(error: T.anything).void }
      attr_writer :error

      # The ground truth value (an arbitrary, JSON serializable object) that you'd
      # compare to `output` to determine if your `output` value is correct or not.
      # Braintrust currently does not compare `output` to `expected` for you, since
      # there are so many different ways to do that correctly. Instead, these values are
      # just used to help you navigate your experiments while digging into analyses.
      # However, we may later use these values to re-score outputs or fine-tune your
      # models
      sig { returns(T.nilable(T.anything)) }
      attr_reader :expected

      sig { params(expected: T.anything).void }
      attr_writer :expected

      # The arguments that uniquely define a test case (an arbitrary, JSON serializable
      # object). Later on, Braintrust will use the `input` to know whether two test
      # cases are the same between experiments, so they should not contain
      # experiment-specific state. A simple rule of thumb is that if you run the same
      # experiment twice, the `input` should be identical
      sig { returns(T.nilable(T.anything)) }
      attr_reader :input

      sig { params(input: T.anything).void }
      attr_writer :input

      # A dictionary with additional data about the test example, model outputs, or just
      # about anything else that's relevant, that you can use to help find and analyze
      # examples later. For example, you could log the `prompt`, example's `id`, or
      # anything else that would be useful to slice/dice later. The values in `metadata`
      # can be any JSON-serializable type, but its keys must be strings
      sig { returns(T.nilable(Braintrust::Models::InsertExperimentEvent::Metadata)) }
      attr_reader :metadata

      sig do
        params(
          metadata: T.nilable(T.any(Braintrust::Models::InsertExperimentEvent::Metadata, Braintrust::Internal::AnyHash))
        )
          .void
      end
      attr_writer :metadata

      # Metrics are numerical measurements tracking the execution of the code that
      # produced the experiment event. Use "start" and "end" to track the time span over
      # which the experiment event was produced
      sig { returns(T.nilable(Braintrust::Models::InsertExperimentEvent::Metrics)) }
      attr_reader :metrics

      sig do
        params(
          metrics: T.nilable(T.any(Braintrust::Models::InsertExperimentEvent::Metrics, Braintrust::Internal::AnyHash))
        )
          .void
      end
      attr_writer :metrics

      # Indicates the event was copied from another object.
      sig { returns(T.nilable(Braintrust::Models::ObjectReference)) }
      attr_reader :origin

      sig { params(origin: T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Internal::AnyHash))).void }
      attr_writer :origin

      # The output of your application, including post-processing (an arbitrary, JSON
      # serializable object), that allows you to determine whether the result is correct
      # or not. For example, in an app that generates SQL queries, the `output` should
      # be the _result_ of the SQL query generated by the model, not the query itself,
      # because there may be multiple valid queries that answer a single question
      sig { returns(T.nilable(T.anything)) }
      attr_reader :output

      sig { params(output: T.anything).void }
      attr_writer :output

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

      # A dictionary of numeric values (between 0 and 1) to log. The scores should give
      # you a variety of signals that help you determine how accurate the outputs are
      # compared to what you expect and diagnose failures. For example, a summarization
      # app might have one score that tells you how accurate the summary is, and another
      # that measures the word similarity between the generated and grouth truth
      # summary. The word similarity score could help you determine whether the
      # summarization was covering similar concepts or not. You can use these scores to
      # help you sort, filter, and compare experiments
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(Float)])) }
      attr_accessor :scores

      # Human-identifying attributes of the span, such as name, type, etc.
      sig { returns(T.nilable(Braintrust::Models::SpanAttributes)) }
      attr_reader :span_attributes

      sig do
        params(
          span_attributes: T.nilable(T.any(Braintrust::Models::SpanAttributes, Braintrust::Internal::AnyHash))
        )
          .void
      end
      attr_writer :span_attributes

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

      # An experiment event
      sig do
        params(
          id: T.nilable(String),
          _is_merge: T.nilable(T::Boolean),
          _merge_paths: T.nilable(T::Array[T::Array[String]]),
          _object_delete: T.nilable(T::Boolean),
          _parent_id: T.nilable(String),
          context: T.nilable(T.any(Braintrust::Models::InsertExperimentEvent::Context, Braintrust::Internal::AnyHash)),
          created: T.nilable(Time),
          error: T.anything,
          expected: T.anything,
          input: T.anything,
          metadata: T.nilable(T.any(Braintrust::Models::InsertExperimentEvent::Metadata, Braintrust::Internal::AnyHash)),
          metrics: T.nilable(T.any(Braintrust::Models::InsertExperimentEvent::Metrics, Braintrust::Internal::AnyHash)),
          origin: T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Internal::AnyHash)),
          output: T.anything,
          root_span_id: T.nilable(String),
          scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
          span_attributes: T.nilable(T.any(Braintrust::Models::SpanAttributes, Braintrust::Internal::AnyHash)),
          span_id: T.nilable(String),
          span_parents: T.nilable(T::Array[String]),
          tags: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(
        id: nil,
        _is_merge: nil,
        _merge_paths: nil,
        _object_delete: nil,
        _parent_id: nil,
        context: nil,
        created: nil,
        error: nil,
        expected: nil,
        input: nil,
        metadata: nil,
        metrics: nil,
        origin: nil,
        output: nil,
        root_span_id: nil,
        scores: nil,
        span_attributes: nil,
        span_id: nil,
        span_parents: nil,
        tags: nil
      ); end
      sig do
        override
          .returns(
            {
              id: T.nilable(String),
              _is_merge: T.nilable(T::Boolean),
              _merge_paths: T.nilable(T::Array[T::Array[String]]),
              _object_delete: T.nilable(T::Boolean),
              _parent_id: T.nilable(String),
              context: T.nilable(Braintrust::Models::InsertExperimentEvent::Context),
              created: T.nilable(Time),
              error: T.anything,
              expected: T.anything,
              input: T.anything,
              metadata: T.nilable(Braintrust::Models::InsertExperimentEvent::Metadata),
              metrics: T.nilable(Braintrust::Models::InsertExperimentEvent::Metrics),
              origin: T.nilable(Braintrust::Models::ObjectReference),
              output: T.anything,
              root_span_id: T.nilable(String),
              scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
              span_attributes: T.nilable(Braintrust::Models::SpanAttributes),
              span_id: T.nilable(String),
              span_parents: T.nilable(T::Array[String]),
              tags: T.nilable(T::Array[String])
            }
          )
      end
      def to_hash; end

      class Context < Braintrust::Internal::Type::BaseModel
        # Name of the file in code where the experiment event was created
        sig { returns(T.nilable(String)) }
        attr_accessor :caller_filename

        # The function in code which created the experiment event
        sig { returns(T.nilable(String)) }
        attr_accessor :caller_functionname

        # Line of code where the experiment event was created
        sig { returns(T.nilable(Integer)) }
        attr_accessor :caller_lineno

        # Context is additional information about the code that produced the experiment
        # event. It is essentially the textual counterpart to `metrics`. Use the
        # `caller_*` attributes to track the location in code which produced the
        # experiment event
        sig do
          params(
            caller_filename: T.nilable(String),
            caller_functionname: T.nilable(String),
            caller_lineno: T.nilable(Integer)
          )
            .returns(T.attached_class)
        end
        def self.new(caller_filename: nil, caller_functionname: nil, caller_lineno: nil); end

        sig do
          override
            .returns(
              {
                caller_filename: T.nilable(String),
                caller_functionname: T.nilable(String),
                caller_lineno: T.nilable(Integer)
              }
            )
        end
        def to_hash; end
      end

      class Metadata < Braintrust::Internal::Type::BaseModel
        # The model used for this example
        sig { returns(T.nilable(String)) }
        attr_accessor :model

        # A dictionary with additional data about the test example, model outputs, or just
        # about anything else that's relevant, that you can use to help find and analyze
        # examples later. For example, you could log the `prompt`, example's `id`, or
        # anything else that would be useful to slice/dice later. The values in `metadata`
        # can be any JSON-serializable type, but its keys must be strings
        sig { params(model: T.nilable(String)).returns(T.attached_class) }
        def self.new(model: nil); end

        sig { override.returns({model: T.nilable(String)}) }
        def to_hash; end
      end

      class Metrics < Braintrust::Internal::Type::BaseModel
        # This metric is deprecated
        sig { returns(T.nilable(T.anything)) }
        attr_reader :caller_filename

        sig { params(caller_filename: T.anything).void }
        attr_writer :caller_filename

        # This metric is deprecated
        sig { returns(T.nilable(T.anything)) }
        attr_reader :caller_functionname

        sig { params(caller_functionname: T.anything).void }
        attr_writer :caller_functionname

        # This metric is deprecated
        sig { returns(T.nilable(T.anything)) }
        attr_reader :caller_lineno

        sig { params(caller_lineno: T.anything).void }
        attr_writer :caller_lineno

        # The number of tokens in the completion generated by the model (only set if this
        # is an LLM span)
        sig { returns(T.nilable(Integer)) }
        attr_accessor :completion_tokens

        # A unix timestamp recording when the section of code which produced the
        # experiment event finished
        sig { returns(T.nilable(Float)) }
        attr_accessor :end_

        # The number of tokens in the prompt used to generate the experiment event (only
        # set if this is an LLM span)
        sig { returns(T.nilable(Integer)) }
        attr_accessor :prompt_tokens

        # A unix timestamp recording when the section of code which produced the
        # experiment event started
        sig { returns(T.nilable(Float)) }
        attr_accessor :start

        # The total number of tokens in the input and output of the experiment event.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :tokens

        # Metrics are numerical measurements tracking the execution of the code that
        # produced the experiment event. Use "start" and "end" to track the time span over
        # which the experiment event was produced
        sig do
          params(
            caller_filename: T.anything,
            caller_functionname: T.anything,
            caller_lineno: T.anything,
            completion_tokens: T.nilable(Integer),
            end_: T.nilable(Float),
            prompt_tokens: T.nilable(Integer),
            start: T.nilable(Float),
            tokens: T.nilable(Integer)
          )
            .returns(T.attached_class)
        end
        def self.new(
          caller_filename: nil,
          caller_functionname: nil,
          caller_lineno: nil,
          completion_tokens: nil,
          end_: nil,
          prompt_tokens: nil,
          start: nil,
          tokens: nil
        ); end
        sig do
          override
            .returns(
              {
                caller_filename: T.anything,
                caller_functionname: T.anything,
                caller_lineno: T.anything,
                completion_tokens: T.nilable(Integer),
                end_: T.nilable(Float),
                prompt_tokens: T.nilable(Integer),
                start: T.nilable(Float),
                tokens: T.nilable(Integer)
              }
            )
        end
        def to_hash; end
      end
    end
  end
end
