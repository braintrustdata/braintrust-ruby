# typed: strong

module Braintrust
  module Resources
    class TopLevel
      # Default endpoint. Simply replies with 'Hello, World!'. Authorization is not
      # required
      sig { params(request_options: Braintrust::RequestOpts).returns(String) }
      def hello_world(request_options: {}); end

      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:); end
    end
  end
end
