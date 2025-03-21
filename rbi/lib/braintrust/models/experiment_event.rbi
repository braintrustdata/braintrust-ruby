# typed: strong

module Braintrust
  module Models
    class ExperimentEvent < Braintrust::BaseModel
      # A unique identifier for the experiment event. If you don't provide one,
      #   BrainTrust will generate one for you
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # The transaction id of an event is unique to the network operation that processed
      #   the event insertion. Transaction ids are monotonically increasing over time and
      #   can be used to retrieve a versioned snapshot of the experiment (see the
      #   `version` parameter)
      sig { returns(String) }
      def _xact_id
      end

      sig { params(_: String).returns(String) }
      def _xact_id=(_)
      end

      # The timestamp the experiment event was created
      sig { returns(Time) }
      def created
      end

      sig { params(_: Time).returns(Time) }
      def created=(_)
      end

      # Unique identifier for the experiment
      sig { returns(String) }
      def experiment_id
      end

      sig { params(_: String).returns(String) }
      def experiment_id=(_)
      end

      # Unique identifier for the project that the experiment belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # A unique identifier for the trace this experiment event belongs to
      sig { returns(String) }
      def root_span_id
      end

      sig { params(_: String).returns(String) }
      def root_span_id=(_)
      end

      # A unique identifier used to link different experiment events together as part of
      #   a full trace. See the
      #   [tracing guide](https://www.braintrust.dev/docs/guides/tracing) for full details
      #   on tracing
      sig { returns(String) }
      def span_id
      end

      sig { params(_: String).returns(String) }
      def span_id=(_)
      end

      # Context is additional information about the code that produced the experiment
      #   event. It is essentially the textual counterpart to `metrics`. Use the
      #   `caller_*` attributes to track the location in code which produced the
      #   experiment event
      sig { returns(T.nilable(Braintrust::Models::ExperimentEvent::Context)) }
      def context
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Context, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::ExperimentEvent::Context, Braintrust::Util::AnyHash)))
      end
      def context=(_)
      end

      # The error that occurred, if any.
      sig { returns(T.nilable(T.anything)) }
      def error
      end

      sig { params(_: T.anything).returns(T.anything) }
      def error=(_)
      end

      # The ground truth value (an arbitrary, JSON serializable object) that you'd
      #   compare to `output` to determine if your `output` value is correct or not.
      #   Braintrust currently does not compare `output` to `expected` for you, since
      #   there are so many different ways to do that correctly. Instead, these values are
      #   just used to help you navigate your experiments while digging into analyses.
      #   However, we may later use these values to re-score outputs or fine-tune your
      #   models
      sig { returns(T.nilable(T.anything)) }
      def expected
      end

      sig { params(_: T.anything).returns(T.anything) }
      def expected=(_)
      end

      # The arguments that uniquely define a test case (an arbitrary, JSON serializable
      #   object). Later on, Braintrust will use the `input` to know whether two test
      #   cases are the same between experiments, so they should not contain
      #   experiment-specific state. A simple rule of thumb is that if you run the same
      #   experiment twice, the `input` should be identical
      sig { returns(T.nilable(T.anything)) }
      def input
      end

      sig { params(_: T.anything).returns(T.anything) }
      def input=(_)
      end

      # Whether this span is a root span
      sig { returns(T.nilable(T::Boolean)) }
      def is_root
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def is_root=(_)
      end

      # A dictionary with additional data about the test example, model outputs, or just
      #   about anything else that's relevant, that you can use to help find and analyze
      #   examples later. For example, you could log the `prompt`, example's `id`, or
      #   anything else that would be useful to slice/dice later. The values in `metadata`
      #   can be any JSON-serializable type, but its keys must be strings
      sig { returns(T.nilable(Braintrust::Models::ExperimentEvent::Metadata)) }
      def metadata
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Metadata, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::ExperimentEvent::Metadata, Braintrust::Util::AnyHash)))
      end
      def metadata=(_)
      end

      # Metrics are numerical measurements tracking the execution of the code that
      #   produced the experiment event. Use "start" and "end" to track the time span over
      #   which the experiment event was produced
      sig { returns(T.nilable(Braintrust::Models::ExperimentEvent::Metrics)) }
      def metrics
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Metrics, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::ExperimentEvent::Metrics, Braintrust::Util::AnyHash)))
      end
      def metrics=(_)
      end

      # Indicates the event was copied from another object.
      sig { returns(T.nilable(Braintrust::Models::ObjectReference)) }
      def origin
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Util::AnyHash)))
      end
      def origin=(_)
      end

      # The output of your application, including post-processing (an arbitrary, JSON
      #   serializable object), that allows you to determine whether the result is correct
      #   or not. For example, in an app that generates SQL queries, the `output` should
      #   be the _result_ of the SQL query generated by the model, not the query itself,
      #   because there may be multiple valid queries that answer a single question
      sig { returns(T.nilable(T.anything)) }
      def output
      end

      sig { params(_: T.anything).returns(T.anything) }
      def output=(_)
      end

      # A dictionary of numeric values (between 0 and 1) to log. The scores should give
      #   you a variety of signals that help you determine how accurate the outputs are
      #   compared to what you expect and diagnose failures. For example, a summarization
      #   app might have one score that tells you how accurate the summary is, and another
      #   that measures the word similarity between the generated and grouth truth
      #   summary. The word similarity score could help you determine whether the
      #   summarization was covering similar concepts or not. You can use these scores to
      #   help you sort, filter, and compare experiments
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(Float)])) }
      def scores
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(Float)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(Float)]))
      end
      def scores=(_)
      end

      # Human-identifying attributes of the span, such as name, type, etc.
      sig { returns(T.nilable(Braintrust::Models::SpanAttributes)) }
      def span_attributes
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::SpanAttributes, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::SpanAttributes, Braintrust::Util::AnyHash)))
      end
      def span_attributes=(_)
      end

      # An array of the parent `span_ids` of this experiment event. This should be empty
      #   for the root span of a trace, and should most often contain just one parent
      #   element for subspans
      sig { returns(T.nilable(T::Array[String])) }
      def span_parents
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def span_parents=(_)
      end

      # A list of tags to log
      sig { returns(T.nilable(T::Array[String])) }
      def tags
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def tags=(_)
      end

      sig do
        params(
          id: String,
          _xact_id: String,
          created: Time,
          experiment_id: String,
          project_id: String,
          root_span_id: String,
          span_id: String,
          context: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Context, Braintrust::Util::AnyHash)),
          error: T.anything,
          expected: T.anything,
          input: T.anything,
          is_root: T.nilable(T::Boolean),
          metadata: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Metadata, Braintrust::Util::AnyHash)),
          metrics: T.nilable(T.any(Braintrust::Models::ExperimentEvent::Metrics, Braintrust::Util::AnyHash)),
          origin: T.nilable(T.any(Braintrust::Models::ObjectReference, Braintrust::Util::AnyHash)),
          output: T.anything,
          scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
          span_attributes: T.nilable(T.any(Braintrust::Models::SpanAttributes, Braintrust::Util::AnyHash)),
          span_parents: T.nilable(T::Array[String]),
          tags: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        _xact_id:,
        created:,
        experiment_id:,
        project_id:,
        root_span_id:,
        span_id:,
        context: nil,
        error: nil,
        expected: nil,
        input: nil,
        is_root: nil,
        metadata: nil,
        metrics: nil,
        origin: nil,
        output: nil,
        scores: nil,
        span_attributes: nil,
        span_parents: nil,
        tags: nil
      )
      end

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
      def to_hash
      end

      class Context < Braintrust::BaseModel
        # Name of the file in code where the experiment event was created
        sig { returns(T.nilable(String)) }
        def caller_filename
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def caller_filename=(_)
        end

        # The function in code which created the experiment event
        sig { returns(T.nilable(String)) }
        def caller_functionname
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def caller_functionname=(_)
        end

        # Line of code where the experiment event was created
        sig { returns(T.nilable(Integer)) }
        def caller_lineno
        end

        sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def caller_lineno=(_)
        end

        # Context is additional information about the code that produced the experiment
        #   event. It is essentially the textual counterpart to `metrics`. Use the
        #   `caller_*` attributes to track the location in code which produced the
        #   experiment event
        sig do
          params(
            caller_filename: T.nilable(String),
            caller_functionname: T.nilable(String),
            caller_lineno: T.nilable(Integer)
          )
            .returns(T.attached_class)
        end
        def self.new(caller_filename: nil, caller_functionname: nil, caller_lineno: nil)
        end

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
        def to_hash
        end
      end

      class Metadata < Braintrust::BaseModel
        # The model used for this example
        sig { returns(T.nilable(String)) }
        def model
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def model=(_)
        end

        # A dictionary with additional data about the test example, model outputs, or just
        #   about anything else that's relevant, that you can use to help find and analyze
        #   examples later. For example, you could log the `prompt`, example's `id`, or
        #   anything else that would be useful to slice/dice later. The values in `metadata`
        #   can be any JSON-serializable type, but its keys must be strings
        sig { params(model: T.nilable(String)).returns(T.attached_class) }
        def self.new(model: nil)
        end

        sig { override.returns({model: T.nilable(String)}) }
        def to_hash
        end
      end

      class Metrics < Braintrust::BaseModel
        # This metric is deprecated
        sig { returns(T.nilable(T.anything)) }
        def caller_filename
        end

        sig { params(_: T.anything).returns(T.anything) }
        def caller_filename=(_)
        end

        # This metric is deprecated
        sig { returns(T.nilable(T.anything)) }
        def caller_functionname
        end

        sig { params(_: T.anything).returns(T.anything) }
        def caller_functionname=(_)
        end

        # This metric is deprecated
        sig { returns(T.nilable(T.anything)) }
        def caller_lineno
        end

        sig { params(_: T.anything).returns(T.anything) }
        def caller_lineno=(_)
        end

        # The number of tokens in the completion generated by the model (only set if this
        #   is an LLM span)
        sig { returns(T.nilable(Integer)) }
        def completion_tokens
        end

        sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def completion_tokens=(_)
        end

        # A unix timestamp recording when the section of code which produced the
        #   experiment event finished
        sig { returns(T.nilable(Float)) }
        def end_
        end

        sig { params(_: T.nilable(Float)).returns(T.nilable(Float)) }
        def end_=(_)
        end

        # The number of tokens in the prompt used to generate the experiment event (only
        #   set if this is an LLM span)
        sig { returns(T.nilable(Integer)) }
        def prompt_tokens
        end

        sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def prompt_tokens=(_)
        end

        # A unix timestamp recording when the section of code which produced the
        #   experiment event started
        sig { returns(T.nilable(Float)) }
        def start
        end

        sig { params(_: T.nilable(Float)).returns(T.nilable(Float)) }
        def start=(_)
        end

        # The total number of tokens in the input and output of the experiment event.
        sig { returns(T.nilable(Integer)) }
        def tokens
        end

        sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def tokens=(_)
        end

        # Metrics are numerical measurements tracking the execution of the code that
        #   produced the experiment event. Use "start" and "end" to track the time span over
        #   which the experiment event was produced
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
        )
        end

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
        def to_hash
        end
      end
    end
  end
end
