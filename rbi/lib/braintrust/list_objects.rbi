# typed: strong

module Braintrust
  class ListObjects
    include Braintrust::BasePage

    Elem = type_member

    sig { returns(T::Array[Elem]) }
    def objects
    end

    sig { params(_: T::Array[Elem]).returns(T::Array[Elem]) }
    def objects=(_)
    end

    sig do
      params(
        client: Braintrust::BaseClient,
        req: Braintrust::BaseClient::RequestComponentsShape,
        headers: T.any(T::Hash[String, String], Net::HTTPHeader),
        unwrapped: T::Hash[Symbol, T.anything]
      )
        .void
    end
    def initialize(client:, req:, headers:, unwrapped:)
    end
  end
end
