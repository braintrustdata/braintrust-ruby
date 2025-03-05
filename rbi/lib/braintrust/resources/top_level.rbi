# typed: strong

module Braintrust
  module Resources
    class TopLevel
      sig do
        params(request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])))
          .returns(String)
      end
      def hello_world(request_options: {})
      end

      sig { params(client: Braintrust::Client).void }
      def initialize(client:)
      end
    end
  end
end
