# typed: strong

module Braintrust
  module Resources
    class Organizations
      sig { returns(Braintrust::Resources::Organizations::Members) }
      def members
      end

      # Get an organization object by its id
      sig do
        params(
          organization_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Organization)
      end
      def retrieve(organization_id, request_options: {})
      end

      # Partially update an organization object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
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

      # List out all organizations. The organizations are sorted by creation date, with
      #   the most recently-created organizations coming first
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

      # Delete an organization object by its id
      sig do
        params(
          organization_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Organization)
      end
      def delete(organization_id, request_options: {})
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
