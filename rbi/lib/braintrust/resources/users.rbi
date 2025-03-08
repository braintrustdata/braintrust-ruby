# typed: strong

module Braintrust
  module Resources
    class Users
      sig do
        params(
          user_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::User)
      end
      def retrieve(user_id, request_options: {})
      end

      sig do
        params(
          email: T.any(String, T::Array[String]),
          ending_before: String,
          family_name: T.any(String, T::Array[String]),
          given_name: T.any(String, T::Array[String]),
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::User])
      end
      def list(
        email: nil,
        ending_before: nil,
        family_name: nil,
        given_name: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
