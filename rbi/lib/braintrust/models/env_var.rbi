# typed: strong

module Braintrust
  module Models
    class EnvVar < Braintrust::Internal::Type::BaseModel
      # Unique identifier for the environment variable
      sig { returns(String) }
      attr_accessor :id

      # The name of the environment variable
      sig { returns(String) }
      attr_accessor :name

      # The id of the object the environment variable is scoped for
      sig { returns(String) }
      attr_accessor :object_id_

      # The type of the object the environment variable is scoped for
      sig { returns(Braintrust::Models::EnvVar::ObjectType::TaggedSymbol) }
      attr_accessor :object_type

      # Date of environment variable creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Date the environment variable was last used
      sig { returns(T.nilable(Time)) }
      attr_accessor :used

      sig do
        params(
          id: String,
          name: String,
          object_id_: String,
          object_type: Braintrust::Models::EnvVar::ObjectType::OrSymbol,
          created: T.nilable(Time),
          used: T.nilable(Time)
        )
          .returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the environment variable
        id:,
        # The name of the environment variable
        name:,
        # The id of the object the environment variable is scoped for
        object_id_:,
        # The type of the object the environment variable is scoped for
        object_type:,
        # Date of environment variable creation
        created: nil,
        # Date the environment variable was last used
        used: nil
      ); end
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
      def to_hash; end

      # The type of the object the environment variable is scoped for
      module ObjectType
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::EnvVar::ObjectType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ORGANIZATION = T.let(:organization, Braintrust::Models::EnvVar::ObjectType::TaggedSymbol)
        PROJECT = T.let(:project, Braintrust::Models::EnvVar::ObjectType::TaggedSymbol)
        FUNCTION = T.let(:function, Braintrust::Models::EnvVar::ObjectType::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::EnvVar::ObjectType::TaggedSymbol]) }
        def self.values; end
      end
    end
  end
end
