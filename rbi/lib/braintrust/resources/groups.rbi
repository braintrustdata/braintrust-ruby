# typed: strong

module Braintrust
  module Resources
    class Groups
      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_groups: T.nilable(T::Array[String]),
          member_users: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Group)
      end
      def create(
        name:,
        description: nil,
        member_groups: nil,
        member_users: nil,
        org_name: nil,
        request_options: {}
      )
      end

      sig do
        params(
          group_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Group)
      end
      def retrieve(group_id, request_options: {})
      end

      sig do
        params(
          group_id: String,
          add_member_groups: T.nilable(T::Array[String]),
          add_member_users: T.nilable(T::Array[String]),
          description: T.nilable(String),
          name: T.nilable(String),
          remove_member_groups: T.nilable(T::Array[String]),
          remove_member_users: T.nilable(T::Array[String]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Group)
      end
      def update(
        group_id,
        add_member_groups: nil,
        add_member_users: nil,
        description: nil,
        name: nil,
        remove_member_groups: nil,
        remove_member_users: nil,
        request_options: {}
      )
      end

      sig do
        params(
          ending_before: String,
          group_name: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::Group])
      end
      def list(
        ending_before: nil,
        group_name: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        params(
          group_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Group)
      end
      def delete(group_id, request_options: {})
      end

      sig do
        params(
          name: String,
          description: T.nilable(String),
          member_groups: T.nilable(T::Array[String]),
          member_users: T.nilable(T::Array[String]),
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Group)
      end
      def replace(
        name:,
        description: nil,
        member_groups: nil,
        member_users: nil,
        org_name: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
