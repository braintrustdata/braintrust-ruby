# typed: strong

module Braintrust
  module Resources
    class APIKeys
      # Create a new api_key. It is possible to have multiple API keys with the same
      # name. There is no de-duplication
      sig do
        params(
          name: String,
          org_name: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::CreateAPIKeyOutput)
      end
      def create(
        # Name of the api key. Does not have to be unique
        name:,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        # that your API key belongs to multiple organizations, you may specify the name of
        # the organization the API key belongs in.
        org_name: nil,
        request_options: {}
      )
      end

      # Get an api_key object by its id
      sig do
        params(
          api_key_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::APIKey)
      end
      def retrieve(
        # ApiKey id
        api_key_id,
        request_options: {}
      )
      end

      # List out all api_keys. The api_keys are sorted by creation date, with the most
      # recently-created api_keys coming first
      sig do
        params(
          api_key_name: String,
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Internal::ListObjects[Braintrust::APIKey])
      end
      def list(
        # Name of the api_key to search for
        api_key_name: nil,
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

      # Delete an api_key object by its id
      sig do
        params(
          api_key_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::APIKey)
      end
      def delete(
        # ApiKey id
        api_key_id,
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
