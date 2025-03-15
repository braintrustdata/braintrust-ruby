# typed: strong

module Braintrust
  module Models
    class AISecretReplaceParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the AI secret
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      # For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the AI Secret belongs in.
      sig { returns(T.nilable(String)) }
      def org_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def org_name=(_)
      end

      # Secret value. If omitted in a PUT request, the existing secret value will be
      #   left intact, not replaced with null.
      sig { returns(T.nilable(String)) }
      def secret
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def secret=(_)
      end

      sig { returns(T.nilable(String)) }
      def type
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def type=(_)
      end

      sig do
        params(
          name: String,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          org_name: T.nilable(String),
          secret: T.nilable(String),
          type: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(name:, metadata: nil, org_name: nil, secret: nil, type: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              name: String,
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              org_name: T.nilable(String),
              secret: T.nilable(String),
              type: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
