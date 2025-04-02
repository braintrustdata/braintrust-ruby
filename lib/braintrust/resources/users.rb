# frozen_string_literal: true

module Braintrust
  module Resources
    class Users
      # Get a user object by its id
      #
      # @param user_id [String] User id
      #
      # @param params [Braintrust::Models::UserRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::User]
      def retrieve(user_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/user/%1$s", user_id],
          model: Braintrust::Models::User,
          options: params[:request_options]
        )
      end

      # List out all users. The users are sorted by creation date, with the most
      #   recently-created users coming first
      #
      # @param params [Braintrust::Models::UserListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String, Array<String>] :email Email of the user to search for. You may pass the param multiple times to filter
      #     for more than one email
      #
      #   @option params [String] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #
      #   @option params [String, Array<String>] :family_name Family name of the user to search for. You may pass the param multiple times to
      #     filter for more than one family name
      #
      #   @option params [String, Array<String>] :given_name Given name of the user to search for. You may pass the param multiple times to
      #     filter for more than one given name
      #
      #   @option params [String, Array<String>] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #
      #   @option params [String] :org_name Filter search results to within a particular organization
      #
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::User>]
      def list(params = {})
        parsed, options = Braintrust::Models::UserListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/user",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::User,
          options: options
        )
      end

      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
