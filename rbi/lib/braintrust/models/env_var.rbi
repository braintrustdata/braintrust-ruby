# typed: strong

module Braintrust
  module Models
    class EnvVar < Braintrust::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
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

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      sig { returns(T.nilable(Time)) }
      def used
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def used=(_)
      end

      sig do
        params(
          id: String,
          name: String,
          object_id_: String,
          object_type: Symbol,
          created: T.nilable(Time),
          used: T.nilable(Time)
        )
          .void
      end
      def initialize(id:, name:, object_id_:, object_type:, created: nil, used: nil)
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              object_id_: String,
              object_type: Symbol,
              created: T.nilable(Time),
              used: T.nilable(Time)
            }
          )
      end
      def to_hash
      end

      class ObjectType < Braintrust::Enum
        abstract!

        ORGANIZATION = :organization
        PROJECT = :project
        FUNCTION = :function

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end
    end
  end
end
