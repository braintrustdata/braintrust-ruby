# typed: strong

module Braintrust
  module Models
    class ProjectLogsEvent < Braintrust::Internal::Type::BaseModel
      # A unique identifier for the project logs event. If you don't provide one,
      # BrainTrust will generate one for you
      sig { returns(String) }
      attr_accessor :id

      # The transaction id of an event is unique to the network operation that processed
      # the event insertion. Transaction ids are monotonically increasing over time and
      # can be used to retrieve a versioned snapshot of the project logs (see the
      # `version` parameter)
      sig { returns(String) }
      attr_accessor :_xact_id

      # The timestamp the project logs event was created
      sig { returns(Time) }
      attr_accessor :created

      # A literal 'g' which identifies the log as a project log
      sig { returns(Braintrust::Models::ProjectLogsEvent::LogID::TaggedSymbol) }
      attr_accessor :log_id

      # Unique id for the organization that the project belongs under
      sig { returns(String) }
      attr_accessor :org_id

      # Unique identifier for the project
      sig { returns(String) }
      attr_accessor :project_id

      # A unique identifier for the trace this project logs event belongs to
      sig { returns(String) }
      attr_accessor :root_span_id

      # A unique identifier used to link different project logs events together as part
      # of a full trace. See the
      # [tracing guide](https://www.braintrust.dev/docs/guides/tracing) for full details
      # on tracing
      sig { returns(String) }
      attr_accessor :span_id

      # Context is additional information about the code that produced the project logs
      # event. It is essentially the textual counterpart to `metrics`. Use the
      # `caller_*` attributes to track the location in code which produced the project
      # logs event
      sig { returns(T.nilable(Braintrust::Models::ProjectLogsEvent::Context)) }
      attr_reader :context

      sig do
        params(
          context: T.nilable(T.any(Braintrust::Models::ProjectLogsEvent::Context, Braintrust::Internal::AnyHash))
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
      # just used to help you navigate while digging into analyses. However, we may
      # later use these values to re-score outputs or fine-tune your models.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :expected

      sig { params(expected: T.anything).void }
      attr_writer :expected

      # The arguments that uniquely define a user input (an arbitrary, JSON serializable
      # object).
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
      sig { returns(T.nilable(Braintrust::Models::ProjectLogsEvent::Metadata)) }
      attr_reader :metadata

      sig do
        params(
          metadata: T.nilable(T.any(Braintrust::Models::ProjectLogsEvent::Metadata, Braintrust::Internal::AnyHash))
        )
          .void
      end
      attr_writer :metadata

      # Metrics are numerical measurements tracking the execution of the code that
      # produced the project logs event. Use "start" and "end" to track the time span
      # over which the project logs event was produced
      sig { returns(T.nilable(Braintrust::Models::ProjectLogsEvent::Metrics)) }
      attr_reader :metrics

      sig do
        params(
          metrics: T.nilable(T.any(Braintrust::Models::ProjectLogsEvent::Metrics, Braintrust::Internal::AnyHash))
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
      # because there may be multiple valid queries that answer a single question.
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
      # help you sort, filter, and compare logs.
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

      # An array of the parent `span_ids` of this project logs event. This should be
      # empty for the root span of a trace, and should most often contain just one
      # parent element for subspans
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
          log_id: Braintrust::Models::ProjectLogsEvent::LogID::OrSymbol,
          org_id: String,
          project_id: String,
          root_span_id: String,
          span_id: String,
          context: T.nilable(T.any(Braintrust::Models::ProjectLogsEvent::Context, Braintrust::Internal::AnyHash)),
          error: T.anything,
          expected: T.anything,
          input: T.anything,
          is_root: T.nilable(T::Boolean),
          metadata: T.nilable(T.any(Braintrust::Models::ProjectLogsEvent::Metadata, Braintrust::Internal::AnyHash)),
          metrics: T.nilable(T.any(Braintrust::Models::ProjectLogsEvent::Metrics, Braintrust::Internal::AnyHash)),
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
        id:,
        _xact_id:,
        created:,
        log_id:,
        org_id:,
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
      ); end
      sig do
        override
          .returns(
            {
              id: String,
              _xact_id: String,
              created: Time,
              log_id: Braintrust::Models::ProjectLogsEvent::LogID::TaggedSymbol,
              org_id: String,
              project_id: String,
              root_span_id: String,
              span_id: String,
              context: T.nilable(Braintrust::Models::ProjectLogsEvent::Context),
              error: T.anything,
              expected: T.anything,
              input: T.anything,
              is_root: T.nilable(T::Boolean),
              metadata: T.nilable(Braintrust::Models::ProjectLogsEvent::Metadata),
              metrics: T.nilable(Braintrust::Models::ProjectLogsEvent::Metrics),
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

      # A literal 'g' which identifies the log as a project log
      module LogID
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ProjectLogsEvent::LogID) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Braintrust::Models::ProjectLogsEvent::LogID::TaggedSymbol) }

        G = T.let(:g, Braintrust::Models::ProjectLogsEvent::LogID::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::ProjectLogsEvent::LogID::TaggedSymbol]) }
        def self.values; end
      end

      class Context < Braintrust::Internal::Type::BaseModel
        # Name of the file in code where the project logs event was created
        sig { returns(T.nilable(String)) }
        attr_accessor :caller_filename

        # The function in code which created the project logs event
        sig { returns(T.nilable(String)) }
        attr_accessor :caller_functionname

        # Line of code where the project logs event was created
        sig { returns(T.nilable(Integer)) }
        attr_accessor :caller_lineno

        # Context is additional information about the code that produced the project logs
        # event. It is essentially the textual counterpart to `metrics`. Use the
        # `caller_*` attributes to track the location in code which produced the project
        # logs event
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

        # A unix timestamp recording when the section of code which produced the project
        # logs event finished
        sig { returns(T.nilable(Float)) }
        attr_accessor :end_

        # The number of tokens in the prompt used to generate the project logs event (only
        # set if this is an LLM span)
        sig { returns(T.nilable(Integer)) }
        attr_accessor :prompt_tokens

        # A unix timestamp recording when the section of code which produced the project
        # logs event started
        sig { returns(T.nilable(Float)) }
        attr_accessor :start

        # The total number of tokens in the input and output of the project logs event.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :tokens

        # Metrics are numerical measurements tracking the execution of the code that
        # produced the project logs event. Use "start" and "end" to track the time span
        # over which the project logs event was produced
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
