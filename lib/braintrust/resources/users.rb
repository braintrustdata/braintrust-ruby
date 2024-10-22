# frozen_string_literal: true

module Braintrust
  module Resources
    class Users
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Get a user object by its id
      #
      # @param user_id [String] User id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::User]
      def retrieve(user_id, opts = {})
        req = {
          method: :get,
          path: "/v1/user/#{user_id}",
          model: Braintrust::Models::User
        }
        @client.request(req, opts)
      end

      # List out all users. The users are sorted by creation date, with the most
      #   recently-created users coming first
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [Array<String>, String, nil] :email Email of the user to search for. You may pass the param multiple times to filter
      #     for more than one email
      #   @option params [String, nil] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #   @option params [Array<String>, String, nil] :family_name Family name of the user to search for. You may pass the param multiple times to
      #     filter for more than one family name
      #   @option params [Array<String>, String, nil] :given_name Given name of the user to search for. You may pass the param multiple times to
      #     filter for more than one given name
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :org_name Filter search results to within a particular organization
      #   @option params [String, nil] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::User>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/user",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::User
        }
        @client.request(req, opts)
      end
    end
  end
end
