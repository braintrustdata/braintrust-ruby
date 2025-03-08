# typed: strong

module Braintrust
  module Models
    class ExperimentEvent < Braintrust::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig { returns(String) }
      def _xact_id
      end

      sig { params(_: String).returns(String) }
      def _xact_id=(_)
      end

      sig { returns(Time) }
      def created
      end

      sig { params(_: Time).returns(Time) }
      def created=(_)
      end

      sig { returns(String) }
      def experiment_id
      end

      sig { params(_: String).returns(String) }
      def experiment_id=(_)
      end

      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      sig { returns(String) }
      def root_span_id
      end

      sig { params(_: String).returns(String) }
      def root_span_id=(_)
      end

      sig { returns(String) }
      def span_id
      end

      sig { params(_: String).returns(String) }
      def span_id=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::ExperimentEvent::Context)) }
      def context
      end

      sig do
        params(_: T.nilable(Braintrust::Models::ExperimentEvent::Context))
          .returns(T.nilable(Braintrust::Models::ExperimentEvent::Context))
      end
      def context=(_)
      end

      sig { returns(T.nilable(String)) }
      def dataset_record_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def dataset_record_id=(_)
      end

      sig { returns(T.nilable(T.anything)) }
      def error
      end

      sig { params(_: T.anything).returns(T.anything) }
      def error=(_)
      end

      sig { returns(T.nilable(T.anything)) }
      def expected
      end

      sig { params(_: T.anything).returns(T.anything) }
      def expected=(_)
      end

      sig { returns(T.nilable(T.anything)) }
      def input
      end

      sig { params(_: T.anything).returns(T.anything) }
      def input=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def is_root
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def is_root=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::ExperimentEvent::Metrics)) }
      def metrics
      end

      sig do
        params(_: T.nilable(Braintrust::Models::ExperimentEvent::Metrics))
          .returns(T.nilable(Braintrust::Models::ExperimentEvent::Metrics))
      end
      def metrics=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::ExperimentEvent::Origin)) }
      def origin
      end

      sig do
        params(_: T.nilable(Braintrust::Models::ExperimentEvent::Origin))
          .returns(T.nilable(Braintrust::Models::ExperimentEvent::Origin))
      end
      def origin=(_)
      end

      sig { returns(T.nilable(T.anything)) }
      def output
      end

      sig { params(_: T.anything).returns(T.anything) }
      def output=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(Float)])) }
      def scores
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(Float)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(Float)]))
      end
      def scores=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::SpanAttributes)) }
      def span_attributes
      end

      sig do
        params(_: T.nilable(Braintrust::Models::SpanAttributes))
          .returns(T.nilable(Braintrust::Models::SpanAttributes))
      end
      def span_attributes=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def span_parents
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def span_parents=(_)
      end

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
          context: T.nilable(Braintrust::Models::ExperimentEvent::Context),
          dataset_record_id: T.nilable(String),
          error: T.anything,
          expected: T.anything,
          input: T.anything,
          is_root: T.nilable(T::Boolean),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          metrics: T.nilable(Braintrust::Models::ExperimentEvent::Metrics),
          origin: T.nilable(Braintrust::Models::ExperimentEvent::Origin),
          output: T.anything,
          scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
          span_attributes: T.nilable(Braintrust::Models::SpanAttributes),
          span_parents: T.nilable(T::Array[String]),
          tags: T.nilable(T::Array[String])
        )
          .void
      end
      def initialize(
        id:,
        _xact_id:,
        created:,
        experiment_id:,
        project_id:,
        root_span_id:,
        span_id:,
        context: nil,
        dataset_record_id: nil,
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
              dataset_record_id: T.nilable(String),
              error: T.anything,
              expected: T.anything,
              input: T.anything,
              is_root: T.nilable(T::Boolean),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              metrics: T.nilable(Braintrust::Models::ExperimentEvent::Metrics),
              origin: T.nilable(Braintrust::Models::ExperimentEvent::Origin),
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
        sig { returns(T.nilable(String)) }
        def caller_filename
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def caller_filename=(_)
        end

        sig { returns(T.nilable(String)) }
        def caller_functionname
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def caller_functionname=(_)
        end

        sig { returns(T.nilable(Integer)) }
        def caller_lineno
        end

        sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def caller_lineno=(_)
        end

        sig do
          params(
            caller_filename: T.nilable(String),
            caller_functionname: T.nilable(String),
            caller_lineno: T.nilable(Integer)
          )
            .void
        end
        def initialize(caller_filename: nil, caller_functionname: nil, caller_lineno: nil)
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

      class Metrics < Braintrust::BaseModel
        sig { returns(T.nilable(T.anything)) }
        def caller_filename
        end

        sig { params(_: T.anything).returns(T.anything) }
        def caller_filename=(_)
        end

        sig { returns(T.nilable(T.anything)) }
        def caller_functionname
        end

        sig { params(_: T.anything).returns(T.anything) }
        def caller_functionname=(_)
        end

        sig { returns(T.nilable(T.anything)) }
        def caller_lineno
        end

        sig { params(_: T.anything).returns(T.anything) }
        def caller_lineno=(_)
        end

        sig { returns(T.nilable(Integer)) }
        def completion_tokens
        end

        sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def completion_tokens=(_)
        end

        sig { returns(T.nilable(Float)) }
        def end_
        end

        sig { params(_: T.nilable(Float)).returns(T.nilable(Float)) }
        def end_=(_)
        end

        sig { returns(T.nilable(Integer)) }
        def prompt_tokens
        end

        sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def prompt_tokens=(_)
        end

        sig { returns(T.nilable(Float)) }
        def start
        end

        sig { params(_: T.nilable(Float)).returns(T.nilable(Float)) }
        def start=(_)
        end

        sig { returns(T.nilable(Integer)) }
        def tokens
        end

        sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def tokens=(_)
        end

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
            .void
        end
        def initialize(
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

      class Origin < Braintrust::BaseModel
        sig { returns(String) }
        def id
        end

        sig { params(_: String).returns(String) }
        def id=(_)
        end

        sig { returns(String) }
        def _xact_id
        end

        sig { params(_: String).returns(String) }
        def _xact_id=(_)
        end

        sig { returns(String) }
        def object_id_
        end

        sig { params(_: String).returns(String) }
        def object_id_=(_)
        end

        sig { returns(Symbol) }
        def object_type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def object_type=(_)
        end

        sig { params(id: String, _xact_id: String, object_id_: String, object_type: Symbol).void }
        def initialize(id:, _xact_id:, object_id_:, object_type:)
        end

        sig { override.returns({id: String, _xact_id: String, object_id_: String, object_type: Symbol}) }
        def to_hash
        end

        class ObjectType < Braintrust::Enum
          abstract!

          EXPERIMENT = :experiment
          DATASET = :dataset
          PROMPT = :prompt
          FUNCTION = :function
          PROMPT_SESSION = :prompt_session
          PROJECT_LOGS = :project_logs

          class << self
            sig { override.returns(T::Array[Symbol]) }
            def values
            end
          end
        end
      end
    end
  end
end
