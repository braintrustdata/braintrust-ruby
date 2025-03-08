# typed: strong

module Braintrust
  module Resources
    class AISecrets
      sig do
        params(
          name: String,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          org_name: T.nilable(String),
          secret: T.nilable(String),
          type: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def create(name:, metadata: nil, org_name: nil, secret: nil, type: nil, request_options: {})
      end

      sig do
        params(
          ai_secret_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def retrieve(ai_secret_id, request_options: {})
      end

      sig do
        params(
          ai_secret_id: String,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          secret: T.nilable(String),
          type: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def update(ai_secret_id, metadata: nil, name: nil, secret: nil, type: nil, request_options: {})
      end

      sig do
        params(
          ai_secret_name: String,
          ai_secret_type: T.any(String, T::Array[String]),
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::AISecret])
      end
      def list(
        ai_secret_name: nil,
        ai_secret_type: nil,
        ending_before: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        params(
          ai_secret_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def delete(ai_secret_id, request_options: {})
      end

      sig do
        params(
          name: String,
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def find_and_delete(name:, org_name: nil, request_options: {})
      end

      sig do
        params(
          name: String,
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          org_name: T.nilable(String),
          secret: T.nilable(String),
          type: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::AISecret)
      end
      def replace(name:, metadata: nil, org_name: nil, secret: nil, type: nil, request_options: {})
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
