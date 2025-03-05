# typed: strong

module Braintrust
  module Resources
    class APIKeys
      sig do
        params(
          name: String,
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::CreateAPIKeyOutput)
      end
      def create(name:, org_name: nil, request_options: {})
      end

      sig do
        params(
          api_key_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::APIKey)
      end
      def retrieve(api_key_id, request_options: {})
      end

      sig do
        params(
          api_key_name: String,
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::APIKey])
      end
      def list(
        api_key_name: nil,
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
          api_key_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::APIKey)
      end
      def delete(api_key_id, request_options: {})
      end

      sig { params(client: Braintrust::Client).void }
      def initialize(client:)
      end
    end
  end
end
