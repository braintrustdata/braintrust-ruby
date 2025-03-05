# typed: strong

module Braintrust
  module Models
    class InsertDatasetEvent < Braintrust::BaseModel
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

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
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

      sig { returns(T.nilable(String)) }
      def root_span_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def root_span_id=(_)
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
          created: T.nilable(Time),
          expected: T.anything,
          input: T.anything,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          root_span_id: T.nilable(String),
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
        created: nil,
        expected: nil,
        input: nil,
        metadata: nil,
        root_span_id: nil,
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
              created: T.nilable(Time),
              expected: T.anything,
              input: T.anything,
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              root_span_id: T.nilable(String),
              span_id: T.nilable(String),
              span_parents: T.nilable(T::Array[String]),
              tags: T.nilable(T::Array[String])
            }
          )
      end
      def to_hash
      end
    end
  end
end
