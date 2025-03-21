# typed: strong

module Braintrust
  module Models
    class EnvVarCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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
      sig { returns(Braintrust::Models::EnvVarCreateParams::ObjectType::OrSymbol) }
      def object_type
      end

      sig do
        params(_: Braintrust::Models::EnvVarCreateParams::ObjectType::OrSymbol)
          .returns(Braintrust::Models::EnvVarCreateParams::ObjectType::OrSymbol)
      end
      def object_type=(_)
      end

      # The value of the environment variable. Will be encrypted at rest.
      sig { returns(T.nilable(String)) }
      def value
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def value=(_)
      end

      sig do
        params(
          name: String,
          object_id_: String,
          object_type: Braintrust::Models::EnvVarCreateParams::ObjectType::OrSymbol,
          value: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
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
              object_type: Braintrust::Models::EnvVarCreateParams::ObjectType::OrSymbol,
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

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::EnvVarCreateParams::ObjectType) }
        OrSymbol =
          T.type_alias { T.any(Symbol, Braintrust::Models::EnvVarCreateParams::ObjectType::TaggedSymbol) }

        ORGANIZATION = T.let(:organization, Braintrust::Models::EnvVarCreateParams::ObjectType::OrSymbol)
        PROJECT = T.let(:project, Braintrust::Models::EnvVarCreateParams::ObjectType::OrSymbol)
        FUNCTION = T.let(:function, Braintrust::Models::EnvVarCreateParams::ObjectType::OrSymbol)
      end
    end
  end
end
