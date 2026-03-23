# typed: strong

module Braintrust
  module Models
    class EnvVarReplaceParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Braintrust::EnvVarReplaceParams, Braintrust::Internal::AnyHash)
        end

      # The name of the environment variable
      sig { returns(String) }
      attr_accessor :name

      # The id of the object the environment variable is scoped for
      sig { returns(String) }
      attr_accessor :object_id_

      # The type of the object the environment variable is scoped for
      sig { returns(Braintrust::EnvVarReplaceParams::ObjectType::OrSymbol) }
      attr_accessor :object_type

      # The value of the environment variable. Will be encrypted at rest.
      sig { returns(T.nilable(String)) }
      attr_accessor :value

      sig do
        params(
          name: String,
          object_id_: String,
          object_type: Braintrust::EnvVarReplaceParams::ObjectType::OrSymbol,
          value: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The name of the environment variable
        name:,
        # The id of the object the environment variable is scoped for
        object_id_:,
        # The type of the object the environment variable is scoped for
        object_type:,
        # The value of the environment variable. Will be encrypted at rest.
        value: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            object_id_: String,
            object_type: Braintrust::EnvVarReplaceParams::ObjectType::OrSymbol,
            value: T.nilable(String),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The type of the object the environment variable is scoped for
      module ObjectType
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Braintrust::EnvVarReplaceParams::ObjectType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ORGANIZATION =
          T.let(
            :organization,
            Braintrust::EnvVarReplaceParams::ObjectType::TaggedSymbol
          )
        PROJECT =
          T.let(
            :project,
            Braintrust::EnvVarReplaceParams::ObjectType::TaggedSymbol
          )
        FUNCTION =
          T.let(
            :function,
            Braintrust::EnvVarReplaceParams::ObjectType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Braintrust::EnvVarReplaceParams::ObjectType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
