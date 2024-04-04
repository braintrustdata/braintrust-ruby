# frozen_string_literal: true

module Braintrust
  module Resources
    class TopLevel
          def initialize(client:)
              @client = client
          end

          # Default endpoint. Simply replies with 'Hello, World!'. Authorization is not
          #   required
          # 
          # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
          # 
          # @return [String]
          def hello_world(opts = {})
              req = {}
              req[:method] = :get
              req[:path] = "/v1"
              req[:headers] = {"Accept" => "text/plain", }
              req[:model] = String
              @client.request(req, opts)
          end
    end
  end
end
