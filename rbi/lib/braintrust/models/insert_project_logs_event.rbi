# typed: strong

module Braintrust
  module Models
    class InsertProjectLogsEvent < Braintrust::BaseModel
      sig { returns(T.nilable(String)) }
      def id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def id=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def _is_merge
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def _is_merge=(_)
      end

      sig { returns(T.nilable(T::Array[T::Array[String]])) }
      def _merge_paths
      end

      sig { params(_: T.nilable(T::Array[T::Array[String]])).returns(T.nilable(T::Array[T::Array[String]])) }
      def _merge_paths=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def _object_delete
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def _object_delete=(_)
      end

      sig { returns(T.nilable(String)) }
      def _parent_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def _parent_id=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::InsertProjectLogsEvent::Context)) }
      def context
      end

      sig do
        params(_: T.nilable(Braintrust::Models::InsertProjectLogsEvent::Context))
          .returns(T.nilable(Braintrust::Models::InsertProjectLogsEvent::Context))
      end
      def context=(_)
      end

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
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

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::InsertProjectLogsEvent::Metrics)) }
      def metrics
      end

      sig do
        params(_: T.nilable(Braintrust::Models::InsertProjectLogsEvent::Metrics))
          .returns(T.nilable(Braintrust::Models::InsertProjectLogsEvent::Metrics))
      end
      def metrics=(_)
      end

      sig { returns(T.nilable(T.anything)) }
      def output
      end

      sig { params(_: T.anything).returns(T.anything) }
      def output=(_)
      end

      sig { returns(T.nilable(String)) }
      def root_span_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def root_span_id=(_)
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

      sig { returns(T.nilable(String)) }
      def span_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def span_id=(_)
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
          id: T.nilable(String),
          _is_merge: T.nilable(T::Boolean),
          _merge_paths: T.nilable(T::Array[T::Array[String]]),
          _object_delete: T.nilable(T::Boolean),
          _parent_id: T.nilable(String),
          context: T.nilable(Braintrust::Models::InsertProjectLogsEvent::Context),
          created: T.nilable(Time),
          error: T.anything,
          expected: T.anything,
          input: T.anything,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          metrics: T.nilable(Braintrust::Models::InsertProjectLogsEvent::Metrics),
          output: T.anything,
          root_span_id: T.nilable(String),
          scores: T.nilable(T::Hash[Symbol, T.nilable(Float)]),
          span_attributes: T.nilable(Braintrust::Models::SpanAttributes),
          span_id: T.nilable(String),
          span_parents: T.nilable(T::Array[String]),
          tags: T.nilable(T::Array[String])
        )
          .void
      end
      def initialize(
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
        output: nil,
        root_span_id: nil,
        scores: nil,
        span_attributes: nil,
        span_id: nil,
        span_parents: nil,
        tags: nil
      )
      end

      sig do
        override
          .returns(
            {
              id: T.nilable(String),
              _is_merge: T.nilable(T::Boolean),
              _merge_paths: T.nilable(T::Array[T::Array[String]]),
              _object_delete: T.nilable(T::Boolean),
              _parent_id: T.nilable(String),
              context: T.nilable(Braintrust::Models::InsertProjectLogsEvent::Context),
              created: T.nilable(Time),
              error: T.anything,
              expected: T.anything,
              input: T.anything,
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              metrics: T.nilable(Braintrust::Models::InsertProjectLogsEvent::Metrics),
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
    end
  end
end
