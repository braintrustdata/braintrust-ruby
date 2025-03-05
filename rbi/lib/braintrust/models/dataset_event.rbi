# typed: strong

module Braintrust
  module Models
    class DatasetEvent < Braintrust::BaseModel
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
      def dataset_id
      end

      sig { params(_: String).returns(String) }
      def dataset_id=(_)
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

      sig { returns(T.nilable(Braintrust::Models::DatasetEvent::Origin)) }
      def origin
      end

      sig do
        params(_: T.nilable(Braintrust::Models::DatasetEvent::Origin))
          .returns(T.nilable(Braintrust::Models::DatasetEvent::Origin))
      end
      def origin=(_)
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
          dataset_id: String,
          project_id: String,
          root_span_id: String,
          span_id: String,
          expected: T.anything,
          input: T.anything,
          is_root: T.nilable(T::Boolean),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          origin: T.nilable(Braintrust::Models::DatasetEvent::Origin),
          tags: T.nilable(T::Array[String])
        )
          .void
      end
      def initialize(
        id:,
        _xact_id:,
        created:,
        dataset_id:,
        project_id:,
        root_span_id:,
        span_id:,
        expected: nil,
        input: nil,
        is_root: nil,
        metadata: nil,
        origin: nil,
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
              dataset_id: String,
              project_id: String,
              root_span_id: String,
              span_id: String,
              expected: T.anything,
              input: T.anything,
              is_root: T.nilable(T::Boolean),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              origin: T.nilable(Braintrust::Models::DatasetEvent::Origin),
              tags: T.nilable(T::Array[String])
            }
          )
      end
      def to_hash
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

          sig { override.returns(T::Array[Symbol]) }
          def self.values
          end
        end
      end
    end
  end
end
