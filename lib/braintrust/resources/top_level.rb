# frozen_string_literal: true

module Braintrust
  module Resources
    class TopLevel
      # Default endpoint. Simply replies with 'Hello, World!'. Authorization is not
      #   required
      #
      # @overload hello_world(request_options: {})
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [String]
      #
      # @see Braintrust::Models::TopLevelHelloWorldParams
      def hello_world(params = {})
        @client.request(
          method: :get,
          path: "v1",
          headers: {"accept" => "text/plain"},
          model: String,
          options: params[:request_options]
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
