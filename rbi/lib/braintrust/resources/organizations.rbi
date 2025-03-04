# typed: strong

module Braintrust
  module Resources
    class Organizations
      sig { returns(Braintrust::Resources::Organizations::Members) }
      def members
      end

      sig do
        params(
          organization_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Organization)
      end
      def retrieve(organization_id, request_options: {})
      end

      sig do
        params(
          organization_id: String,
          api_url: T.nilable(String),
          is_universal_api: T.nilable(T::Boolean),
          name: T.nilable(String),
          proxy_url: T.nilable(String),
          realtime_url: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Organization)
      end
      def update(
        organization_id,
        api_url: nil,
        is_universal_api: nil,
        name: nil,
        proxy_url: nil,
        realtime_url: nil,
        request_options: {}
      )
      end

      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::Organization])
      end
      def list(
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
          organization_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Organization)
      end
      def delete(organization_id, request_options: {})
      end

      sig { params(client: Braintrust::Client).void }
      def initialize(client:)
      end
    end
  end
end
