# frozen_string_literal: true

module Braintrust
  module Resources
    class Users
      # Get a user object by its id
      #
      # @overload retrieve(user_id, request_options: {})
      #
      # @param user_id [String]
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

      # List out all users. The users are sorted by creation date, with the most
      #   recently-created users coming first
      #
      # @overload list(email: nil, ending_before: nil, family_name: nil, given_name: nil, ids: nil, limit: nil, org_name: nil, starting_after: nil, request_options: {})
      #
      # @param email [String, Array<String>]
      # @param ending_before [String]
      # @param family_name [String, Array<String>]
      # @param given_name [String, Array<String>]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param org_name [String]
      # @param starting_after [String]
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
