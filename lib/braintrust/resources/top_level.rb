# frozen_string_literal: true

module Braintrust
  module Resources
    class TopLevel
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Default endpoint. Simply replies with 'Hello, World!'. Authorization is not
      #   required
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [String]
      def hello_world(opts = {})
        req = {
          method: :get,
          path: "/v1",
          headers: {"Accept" => "text/plain"},
          model: String
        }
        @client.request(req, opts)
      end
    end
  end
end
