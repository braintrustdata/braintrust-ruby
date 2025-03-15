# typed: strong

module Braintrust
  module Resources
    class ProjectTags
      # Create a new project_tag. If there is an existing project_tag in the project
      #   with the same name as the one specified in the request, will return the existing
      #   project_tag unmodified
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

      # Get a project_tag object by its id
      sig do
        params(
          project_tag_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectTag)
      end
      def retrieve(project_tag_id, request_options: {})
      end

      # Partially update a project_tag object. Specify the fields to update in the
      #   payload. Any object-type fields will be deep-merged with existing content.
      #   Currently we do not support removing fields or setting them to null.
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

      # List out all project_tags. The project_tags are sorted by creation date, with
      #   the most recently-created project_tags coming first
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

      # Delete a project_tag object by its id
      sig do
        params(
          project_tag_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::ProjectTag)
      end
      def delete(project_tag_id, request_options: {})
      end

      # Create or replace project_tag. If there is an existing project_tag in the
      #   project with the same name as the one specified in the request, will replace the
      #   existing project_tag with the provided fields
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

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
