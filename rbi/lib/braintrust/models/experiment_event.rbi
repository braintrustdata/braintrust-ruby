# typed: strong

module Braintrust
  module Models
    class ExperimentEvent < Braintrust::Internal::Type::BaseModel
      # A unique identifier for the experiment event. If you don't provide one,
      # BrainTrust will generate one for you
      sig { returns(String) }
      attr_accessor :id

      # The transaction id of an event is unique to the network operation that processed
      # the event insertion. Transaction ids are monotonically increasing over time and
      # can be used to retrieve a versioned snapshot of the experiment (see the
      # `version` parameter)
      sig { returns(String) }
      attr_accessor :_xact_id

      # The timestamp the experiment event was created
      sig { returns(Time) }
      attr_accessor :created

      # Unique identifier for the experiment
      sig { returns(String) }
      attr_accessor :experiment_id

      # Unique identifier for the project that the experiment belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # A unique identifier for the trace this experiment event belongs to
      sig { returns(String) }
      attr_accessor :root_span_id

      # A unique identifier used to link different experiment events together as part of
      # a full trace. See the
      # [tracing guide](https://www.braintrust.dev/docs/guides/tracing) for full details
      # on tracing
      sig { returns(String) }
      attr_accessor :span_id

      # Context is additional information about the code that produced the experiment
      # event. It is essentially the textual counterpart to `metrics`. Use the
      # `caller_*` attributes to track the location in code which produced the
      # experiment event
      sig { returns(T.nilable(Braintrust::Models::ExperimentEvent::Context)) }
      attr_reader :context

      sig do
        params(
          context: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Context, Braintrust::Internal::AnyHash))
        )
          .void
      end
      attr_writer :context

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

      # Whether this span is a root span
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_root

      # A dictionary with additional data about the test example, model outputs, or just
      # about anything else that's relevant, that you can use to help find and analyze
      # examples later. For example, you could log the `prompt`, example's `id`, or
      # anything else that would be useful to slice/dice later. The values in `metadata`
      # can be any JSON-serializable type, but its keys must be strings
      sig { returns(T.nilable(Braintrust::Models::ExperimentEvent::Metadata)) }
      attr_reader :metadata

      sig do
        params(
          metadata: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Metadata, Braintrust::Internal::AnyHash))
        )
          .void
      end
      attr_writer :metadata

      # Metrics are numerical measurements tracking the execution of the code that
      # produced the experiment event. Use "start" and "end" to track the time span over
      # which the experiment event was produced
      sig { returns(T.nilable(Braintrust::Models::ExperimentEvent::Metrics)) }
      attr_reader :metrics

      sig do
        params(
          metrics: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Metrics, Braintrust::Internal::AnyHash))
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

      # An array of the parent `span_ids` of this experiment event. This should be empty
      # for the root span of a trace, and should most often contain just one parent
      # element for subspans
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :span_parents

      # A list of tags to log
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          id: String,
          _xact_id: String,
          created: Time,
          experiment_id: String,
          project_id: String,
          root_span_id: String,
          span_id: String,
          context: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Context, Braintrust::Internal::AnyHash)),
          error: T.anything,
          expected: T.anything,
          input: T.anything,
          is_root: T.nilable(T::Boolean),
          metadata: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Metadata, Braintrust::Internal::AnyHash)),
          metrics: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Metrics, Braintrust::Internal::AnyHash)),
          origin: T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Internal::AnyHash)),
          output: T.anything,
          scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
          span_attributes: T.nilable(T.any(Braintrust::Models::SpanAttributes, Braintrust::Internal::AnyHash)),
          span_parents: T.nilable(T::Array[String]),
          tags: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(
        # A unique identifier for the experiment event. If you don't provide one,
        # BrainTrust will generate one for you
        id:,
        # The transaction id of an event is unique to the network operation that processed
        # the event insertion. Transaction ids are monotonically increasing over time and
        # can be used to retrieve a versioned snapshot of the experiment (see the
        # `version` parameter)
        _xact_id:,
        # The timestamp the experiment event was created
        created:,
        # Unique identifier for the experiment
        experiment_id:,
        # Unique identifier for the project that the experiment belongs under
        project_id:,
        # A unique identifier for the trace this experiment event belongs to
        root_span_id:,
        # A unique identifier used to link different experiment events together as part of
        # a full trace. See the
        # [tracing guide](https://www.braintrust.dev/docs/guides/tracing) for full details
        # on tracing
        span_id:,
        # Context is additional information about the code that produced the experiment
        # event. It is essentially the textual counterpart to `metrics`. Use the
        # `caller_*` attributes to track the location in code which produced the
        # experiment event
        context: nil,
        # The error that occurred, if any.
        error: nil,
        # The ground truth value (an arbitrary, JSON serializable object) that you'd
        # compare to `output` to determine if your `output` value is correct or not.
        # Braintrust currently does not compare `output` to `expected` for you, since
        # there are so many different ways to do that correctly. Instead, these values are
        # just used to help you navigate your experiments while digging into analyses.
        # However, we may later use these values to re-score outputs or fine-tune your
        # models
        expected: nil,
        # The arguments that uniquely define a test case (an arbitrary, JSON serializable
        # object). Later on, Braintrust will use the `input` to know whether two test
        # cases are the same between experiments, so they should not contain
        # experiment-specific state. A simple rule of thumb is that if you run the same
        # experiment twice, the `input` should be identical
        input: nil,
        # Whether this span is a root span
        is_root: nil,
        # A dictionary with additional data about the test example, model outputs, or just
        # about anything else that's relevant, that you can use to help find and analyze
        # examples later. For example, you could log the `prompt`, example's `id`, or
        # anything else that would be useful to slice/dice later. The values in `metadata`
        # can be any JSON-serializable type, but its keys must be strings
        metadata: nil,
        # Metrics are numerical measurements tracking the execution of the code that
        # produced the experiment event. Use "start" and "end" to track the time span over
        # which the experiment event was produced
        metrics: nil,
        # Indicates the event was copied from another object.
        origin: nil,
        # The output of your application, including post-processing (an arbitrary, JSON
        # serializable object), that allows you to determine whether the result is correct
        # or not. For example, in an app that generates SQL queries, the `output` should
        # be the _result_ of the SQL query generated by the model, not the query itself,
        # because there may be multiple valid queries that answer a single question
        output: nil,
        # A dictionary of numeric values (between 0 and 1) to log. The scores should give
        # you a variety of signals that help you determine how accurate the outputs are
        # compared to what you expect and diagnose failures. For example, a summarization
        # app might have one score that tells you how accurate the summary is, and another
        # that measures the word similarity between the generated and grouth truth
        # summary. The word similarity score could help you determine whether the
        # summarization was covering similar concepts or not. You can use these scores to
        # help you sort, filter, and compare experiments
        scores: nil,
        # Human-identifying attributes of the span, such as name, type, etc.
        span_attributes: nil,
        # An array of the parent `span_ids` of this experiment event. This should be empty
        # for the root span of a trace, and should most often contain just one parent
        # element for subspans
        span_parents: nil,
        # A list of tags to log
        tags: nil
      ); end
      sig do
        override
          .returns(
            {
              id: String,
              _xact_id: String,
              created: Time,
              experiment_id: String,
              project_id: String,
              root_span_id: String,
              span_id: String,
              context: T.nilable(Braintrust::Models::ExperimentEvent::Context),
              error: T.anything,
              expected: T.anything,
              input: T.anything,
              is_root: T.nilable(T::Boolean),
              metadata: T.nilable(Braintrust::Models::ExperimentEvent::Metadata),
              metrics: T.nilable(Braintrust::Models::ExperimentEvent::Metrics),
              origin: T.nilable(Braintrust::Models::ObjectReference),
              output: T.anything,
              scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
              span_attributes: T.nilable(Braintrust::Models::SpanAttributes),
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
        def self.new(
          # Name of the file in code where the experiment event was created
          caller_filename: nil,
          # The function in code which created the experiment event
          caller_functionname: nil,
          # Line of code where the experiment event was created
          caller_lineno: nil
        ); end
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
        def self.new(
          # The model used for this example
          model: nil
        ); end
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
          # This metric is deprecated
          caller_filename: nil,
          # This metric is deprecated
          caller_functionname: nil,
          # This metric is deprecated
          caller_lineno: nil,
          # The number of tokens in the completion generated by the model (only set if this
          # is an LLM span)
          completion_tokens: nil,
          # A unix timestamp recording when the section of code which produced the
          # experiment event finished
          end_: nil,
          # The number of tokens in the prompt used to generate the experiment event (only
          # set if this is an LLM span)
          prompt_tokens: nil,
          # A unix timestamp recording when the section of code which produced the
          # experiment event started
          start: nil,
          # The total number of tokens in the input and output of the experiment event.
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
