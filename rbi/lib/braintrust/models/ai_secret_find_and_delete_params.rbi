# typed: strong

module Braintrust
  module Models
    class AISecretFindAndDeleteParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(T.nilable(String)) }
      def org_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def org_name=(_)
      end

      sig do
        params(
          name: String,
          org_name: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(name:, org_name: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            name: String,
            org_name: T.nilable(String),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
