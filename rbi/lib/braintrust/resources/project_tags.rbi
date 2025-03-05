# typed: strong

module Braintrust
  module Resources
    class ProjectTags
      sig do
        params(
          name: String,
          project_id: String,
          color: T.nilable(String),
          description: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectTag)
      end
      def create(name:, project_id:, color: nil, description: nil, request_options: {})
      end

      sig do
        params(
          project_tag_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectTag)
      end
      def retrieve(project_tag_id, request_options: {})
      end

      sig do
        params(
          project_tag_id: String,
          color: T.nilable(String),
          description: T.nilable(String),
          name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectTag)
      end
      def update(project_tag_id, color: nil, description: nil, name: nil, request_options: {})
      end

      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_id: String,
          project_name: String,
          project_tag_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::ProjectTag])
      end
      def list(
        ending_before: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        project_id: nil,
        project_name: nil,
        project_tag_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        params(
          project_tag_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectTag)
      end
      def delete(project_tag_id, request_options: {})
      end

      sig do
        params(
          name: String,
          project_id: String,
          color: T.nilable(String),
          description: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectTag)
      end
      def replace(name:, project_id:, color: nil, description: nil, request_options: {})
      end

      sig { params(client: Braintrust::Client).void }
      def initialize(client:)
      end
    end
  end
end
