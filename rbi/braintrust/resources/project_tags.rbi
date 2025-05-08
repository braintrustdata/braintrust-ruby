# typed: strong

module Braintrust
  module Resources
    class ProjectTags
      # Create a new project_tag. If there is an existing project_tag in the project
      # with the same name as the one specified in the request, will return the existing
      # project_tag unmodified
      sig do
        params(
          name: String,
          project_id: String,
          color: T.nilable(String),
          description: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::ProjectTag)
      end
      def create(
        # Name of the project tag
        name:,
        # Unique identifier for the project that the project tag belongs under
        project_id:,
        # Color of the tag for the UI
        color: nil,
        # Textual description of the project tag
        description: nil,
        request_options: {}
      )
      end

      # Get a project_tag object by its id
      sig do
        params(
          project_tag_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::ProjectTag)
      end
      def retrieve(
        # ProjectTag id
        project_tag_id,
        request_options: {}
      )
      end

      # Partially update a project_tag object. Specify the fields to update in the
      # payload. Any object-type fields will be deep-merged with existing content.
      # Currently we do not support removing fields or setting them to null.
      sig do
        params(
          project_tag_id: String,
          color: T.nilable(String),
          description: T.nilable(String),
          name: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::ProjectTag)
      end
      def update(
        # ProjectTag id
        project_tag_id,
        # Color of the tag for the UI
        color: nil,
        # Textual description of the project tag
        description: nil,
        # Name of the project tag
        name: nil,
        request_options: {}
      )
      end

      # List out all project_tags. The project_tags are sorted by creation date, with
      # the most recently-created project_tags coming first
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
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Internal::ListObjects[Braintrust::ProjectTag])
      end
      def list(
        # Pagination cursor id.
        #
        # For example, if the initial item in the last page you fetched had an id of
        # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        # pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Filter search results to a particular set of object IDs. To specify a list of
        # IDs, include the query param multiple times
        ids: nil,
        # Limit the number of objects to return
        limit: nil,
        # Filter search results to within a particular organization
        org_name: nil,
        # Project id
        project_id: nil,
        # Name of the project to search for
        project_name: nil,
        # Name of the project_tag to search for
        project_tag_name: nil,
        # Pagination cursor id.
        #
        # For example, if the final item in the last page you fetched had an id of `foo`,
        # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        # `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      )
      end

      # Delete a project_tag object by its id
      sig do
        params(
          project_tag_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::ProjectTag)
      end
      def delete(
        # ProjectTag id
        project_tag_id,
        request_options: {}
      )
      end

      # Create or replace project_tag. If there is an existing project_tag in the
      # project with the same name as the one specified in the request, will replace the
      # existing project_tag with the provided fields
      sig do
        params(
          name: String,
          project_id: String,
          color: T.nilable(String),
          description: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::ProjectTag)
      end
      def replace(
        # Name of the project tag
        name:,
        # Unique identifier for the project that the project tag belongs under
        project_id:,
        # Color of the tag for the UI
        color: nil,
        # Textual description of the project tag
        description: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
