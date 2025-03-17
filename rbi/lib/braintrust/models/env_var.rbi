# typed: strong

module Braintrust
  module Models
    class EnvVar < Braintrust::BaseModel
      # Unique identifier for the environment variable
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # The name of the environment variable
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # The id of the object the environment variable is scoped for
      sig { returns(String) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      # The type of the object the environment variable is scoped for
      sig { returns(Symbol) }
      def object_type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def object_type=(_)
      end

      # Date of environment variable creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      # Date the environment variable was last used
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
          .returns(T.attached_class)
      end
      def self.new(id:, name:, object_id_:, object_type:, created: nil, used: nil)
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

      # The type of the object the environment variable is scoped for
      class ObjectType < Braintrust::Enum
        abstract!

        Value = type_template(:out) { {fixed: Symbol} }

        ORGANIZATION = :organization
        PROJECT = :project
        FUNCTION = :function
      end
    end
  end
end
