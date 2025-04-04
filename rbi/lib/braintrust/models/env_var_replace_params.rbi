# typed: strong

module Braintrust
  module Models
    class EnvVarReplaceParams < Braintrust::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # The name of the environment variable
      sig { returns(String) }
      attr_accessor :name

      # The id of the object the environment variable is scoped for
      sig { returns(String) }
      attr_accessor :object_id_

      # The type of the object the environment variable is scoped for
      sig { returns(Braintrust::Models::EnvVarReplaceParams::ObjectType::OrSymbol) }
      attr_accessor :object_type

      # The value of the environment variable. Will be encrypted at rest.
      sig { returns(T.nilable(String)) }
      attr_accessor :value

      sig do
        params(
          name: String,
          object_id_: String,
          object_type: Braintrust::Models::EnvVarReplaceParams::ObjectType::OrSymbol,
          value: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(name:, object_id_:, object_type:, value: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              name: String,
              object_id_: String,
              object_type: Braintrust::Models::EnvVarReplaceParams::ObjectType::OrSymbol,
              value: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # The type of the object the environment variable is scoped for
      module ObjectType
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::EnvVarReplaceParams::ObjectType) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Braintrust::Models::EnvVarReplaceParams::ObjectType::TaggedSymbol) }

        ORGANIZATION = T.let(:organization, Braintrust::Models::EnvVarReplaceParams::ObjectType::TaggedSymbol)
        PROJECT = T.let(:project, Braintrust::Models::EnvVarReplaceParams::ObjectType::TaggedSymbol)
        FUNCTION = T.let(:function, Braintrust::Models::EnvVarReplaceParams::ObjectType::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::EnvVarReplaceParams::ObjectType::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
