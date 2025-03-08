# typed: strong

module Braintrust
  module Resources
    class Projects
      sig { returns(Braintrust::Resources::Projects::Logs) }
      def logs
      end

      sig do
        params(
          name: String,
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Project)
      end
      def create(name:, org_name: nil, request_options: {})
      end

      sig do
        params(
          project_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Project)
      end
      def retrieve(project_id, request_options: {})
      end

      sig do
        params(
          project_id: String,
          name: T.nilable(String),
          settings: T.nilable(Braintrust::Models::ProjectSettings),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Project)
      end
      def update(project_id, name: nil, settings: nil, request_options: {})
      end

      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::Project])
      end
      def list(
        ending_before: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        project_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        params(
          project_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Project)
      end
      def delete(project_id, request_options: {})
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
