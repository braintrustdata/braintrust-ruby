# frozen_string_literal: true

module Braintrust
  module Resources
    class Users
      # Get a user object by its id
      #
      # @overload retrieve(user_id, request_options: {})
      #
      # @param user_id [String] User id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::User]
      #
      # @see Braintrust::Models::UserRetrieveParams
      def retrieve(user_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/user/%1$s", user_id],
          model: Braintrust::Models::User,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::UserListParams} for more details.
      #
      # List out all users. The users are sorted by creation date, with the most
      # recently-created users coming first
      #
      # @overload list(email: nil, ending_before: nil, family_name: nil, given_name: nil, ids: nil, limit: nil, org_name: nil, starting_after: nil, request_options: {})
      #
      # @param email [String, Array<String>] Email of the user to search for. You may pass the param multiple times to filter
      # ...
      #
      # @param ending_before [String] Pagination cursor id. ...
      #
      # @param family_name [String, Array<String>] Family name of the user to search for. You may pass the param multiple times to
      # ...
      #
      # @param given_name [String, Array<String>] Given name of the user to search for. You may pass the param multiple times to f
      # ...
      #
      # @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      # ...
      #
      # @param limit [Integer, nil] Limit the number of objects to return
      #
      # @param org_name [String] Filter search results to within a particular organization
      #
      # @param starting_after [String] Pagination cursor id. ...
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::User>]
      #
      # @see Braintrust::Models::UserListParams
      def list(params = {})
        parsed, options = Braintrust::Models::UserListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/user",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Models::User,
          options: options
        )
      end

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
