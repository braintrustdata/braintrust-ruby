# typed: strong

module Braintrust
  module Resources
    class TopLevel
      # Default endpoint. Simply replies with 'Hello, World!'. Authorization is not
      #   required
      sig do
        params(request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)))
          .returns(String)
      end
      def hello_world(request_options: {}); end

      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:); end
    end
  end
end
