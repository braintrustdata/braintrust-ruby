# typed: strong

module Braintrust
  module Resources
    class Users
      # Get a user object by its id
      sig do
        params(
          user_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::User)
      end
      def retrieve(
        # User id
        user_id,
        request_options: {}
      )
      end

      # List out all users. The users are sorted by creation date, with the most
      # recently-created users coming first
      sig do
        params(
          email: T.any(String, T::Array[String]),
          ending_before: String,
          family_name: T.any(String, T::Array[String]),
          given_name: T.any(String, T::Array[String]),
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Internal::ListObjects[Braintrust::User])
      end
      def list(
        # Email of the user to search for. You may pass the param multiple times to filter
        # for more than one email
        email: nil,
        # Pagination cursor id.
        #
        # For example, if the initial item in the last page you fetched had an id of
        # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        # pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Family name of the user to search for. You may pass the param multiple times to
        # filter for more than one family name
        family_name: nil,
        # Given name of the user to search for. You may pass the param multiple times to
        # filter for more than one given name
        given_name: nil,
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

      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
