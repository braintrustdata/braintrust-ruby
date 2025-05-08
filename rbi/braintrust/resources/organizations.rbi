# typed: strong

module Braintrust
  module Resources
    class Organizations
      sig { returns(Braintrust::Resources::Organizations::Members) }
      attr_reader :members

      # Get an organization object by its id
      sig do
        params(
          organization_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Organization)
      end
      def retrieve(
        # Organization id
        organization_id,
        request_options: {}
      )
      end

      # Partially update an organization object. Specify the fields to update in the
      # payload. Any object-type fields will be deep-merged with existing content.
      # Currently we do not support removing fields or setting them to null.
      sig do
        params(
          organization_id: String,
          api_url: T.nilable(String),
          is_universal_api: T.nilable(T::Boolean),
          name: T.nilable(String),
          proxy_url: T.nilable(String),
          realtime_url: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Organization)
      end
      def update(
        # Organization id
        organization_id,
        api_url: nil,
        is_universal_api: nil,
        # Name of the organization
        name: nil,
        proxy_url: nil,
        realtime_url: nil,
        request_options: {}
      )
      end

      # List out all organizations. The organizations are sorted by creation date, with
      # the most recently-created organizations coming first
      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Internal::ListObjects[Braintrust::Organization])
      end
      def list(
        # Pagination cursor id.
        #
        # For example, if the initial item in the last page you fetched had an id of
        # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        # pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        # IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Filter search results to within a particular organization
        org_name: nil,
        # Pagination cursor id.
        #
        # For example, if the final item in the last page you fetched had an id of `foo`,
        # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        # `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      )
      end

      # Delete an organization object by its id
      sig do
        params(
          organization_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Organization)
      end
      def delete(
        # Organization id
        organization_id,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
