# typed: strong

module Braintrust
  module Models
    class ObjectReference < Braintrust::BaseModel
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

      sig { returns(T.nilable(String)) }
      def created
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def created=(_)
      end

      sig do
        params(
          id: String,
          _xact_id: String,
          object_id_: String,
          object_type: Symbol,
          created: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(id:, _xact_id:, object_id_:, object_type:, created: nil)
      end

      sig do
        override
          .returns(
            {
              id: String,
              _xact_id: String,
              object_id_: String,
              object_type: Symbol,
              created: T.nilable(String)
            }
          )
      end
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
