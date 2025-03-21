# typed: strong

module Braintrust
  module Models
    class ObjectReference < Braintrust::BaseModel
      # ID of the original event.
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # Transaction ID of the original event.
      sig { returns(String) }
      def _xact_id
      end

      sig { params(_: String).returns(String) }
      def _xact_id=(_)
      end

      # ID of the object the event is originating from.
      sig { returns(String) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      # Type of the object the event is originating from.
      sig { returns(Braintrust::Models::ObjectReference::ObjectType::OrSymbol) }
      def object_type
      end

      sig do
        params(_: Braintrust::Models::ObjectReference::ObjectType::OrSymbol)
          .returns(Braintrust::Models::ObjectReference::ObjectType::OrSymbol)
      end
      def object_type=(_)
      end

      # Created timestamp of the original event. Used to help sort in the UI
      sig { returns(T.nilable(String)) }
      def created
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def created=(_)
      end

      # Indicates the event was copied from another object.
      sig do
        params(
          id: String,
          _xact_id: String,
          object_id_: String,
          object_type: Braintrust::Models::ObjectReference::ObjectType::OrSymbol,
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
              object_type: Braintrust::Models::ObjectReference::ObjectType::OrSymbol,
              created: T.nilable(String)
            }
          )
      end
      def to_hash
      end

      # Type of the object the event is originating from.
      module ObjectType
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ObjectReference::ObjectType) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::ObjectReference::ObjectType::TaggedSymbol) }

        EXPERIMENT = T.let(:experiment, Braintrust::Models::ObjectReference::ObjectType::TaggedSymbol)
        DATASET = T.let(:dataset, Braintrust::Models::ObjectReference::ObjectType::TaggedSymbol)
        PROMPT = T.let(:prompt, Braintrust::Models::ObjectReference::ObjectType::TaggedSymbol)
        FUNCTION = T.let(:function, Braintrust::Models::ObjectReference::ObjectType::TaggedSymbol)
        PROMPT_SESSION = T.let(:prompt_session, Braintrust::Models::ObjectReference::ObjectType::TaggedSymbol)
        PROJECT_LOGS = T.let(:project_logs, Braintrust::Models::ObjectReference::ObjectType::TaggedSymbol)

        class << self
          sig { override.returns(T::Array[Braintrust::Models::ObjectReference::ObjectType::TaggedSymbol]) }
          def values
          end
        end
      end
    end
  end
end
