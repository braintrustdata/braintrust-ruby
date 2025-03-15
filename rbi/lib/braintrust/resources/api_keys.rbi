# typed: strong

module Braintrust
  module Resources
    class APIKeys
      # Create a new api_key. It is possible to have multiple API keys with the same
      #   name. There is no de-duplication
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

      # Get an api_key object by its id
      sig do
        params(
          api_key_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::APIKey)
      end
      def retrieve(api_key_id, request_options: {})
      end

      # List out all api_keys. The api_keys are sorted by creation date, with the most
      #   recently-created api_keys coming first
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

      # Delete an api_key object by its id
      sig do
        params(
          api_key_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::APIKey)
      end
      def delete(api_key_id, request_options: {})
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
