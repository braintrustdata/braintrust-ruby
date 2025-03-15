# typed: strong

module Braintrust
  module Models
    class EnvVarUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # The name of the environment variable
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
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
          value: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(name:, value: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            name: String,
            value: T.nilable(String),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
