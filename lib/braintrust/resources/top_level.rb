# frozen_string_literal: true

module Braintrust
  module Resources
    class TopLevel
      # Default endpoint. Simply replies with 'Hello, World!'. Authorization is not
      #   required
      #
      # @param params [Braintrust::Models::TopLevelHelloWorldParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [String]
      #
      def hello_world(params = {})
        @client.request(
          method: :get,
          path: "v1",
          headers: {"accept" => "text/plain"},
          model: String,
          options: params[:request_options]
        )
      end

      # @param client [Braintrust::Client]
      #
      def initialize(client:)
        @client = client
      end
    end
  end
end
