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
      sig { returns(Braintrust::Models::EnvVar::ObjectType::TaggedSymbol) }
      def object_type
      end

      sig do
        params(_: Braintrust::Models::EnvVar::ObjectType::TaggedSymbol)
          .returns(Braintrust::Models::EnvVar::ObjectType::TaggedSymbol)
      end
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
          object_type: Braintrust::Models::EnvVar::ObjectType::TaggedSymbol,
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
              object_type: Braintrust::Models::EnvVar::ObjectType::TaggedSymbol,
              created: T.nilable(Time),
              used: T.nilable(Time)
            }
          )
      end
      def to_hash
      end

      # The type of the object the environment variable is scoped for
      module ObjectType
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::EnvVar::ObjectType) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::EnvVar::ObjectType::TaggedSymbol) }

        ORGANIZATION = T.let(:organization, Braintrust::Models::EnvVar::ObjectType::TaggedSymbol)
        PROJECT = T.let(:project, Braintrust::Models::EnvVar::ObjectType::TaggedSymbol)
        FUNCTION = T.let(:function, Braintrust::Models::EnvVar::ObjectType::TaggedSymbol)

        class << self
          sig { override.returns(T::Array[Braintrust::Models::EnvVar::ObjectType::TaggedSymbol]) }
          def values
          end
        end
      end
    end
  end
end
