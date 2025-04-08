# typed: strong

module Braintrust
  module Resources
    class Projects
      sig { returns(Braintrust::Resources::Projects::Logs) }
      attr_reader :logs

      # Create a new project. If there is an existing project with the same name as the
      # one specified in the request, will return the existing project unmodified
      sig do
        params(
          name: String,
          org_name: T.nilable(String),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Project)
      end
      def create(
        # Name of the project
        name:,
        # For nearly all users, this parameter should be unnecessary. But in the rare case
        # that your API key belongs to multiple organizations, you may specify the name of
        # the organization the project belongs in.
        org_name: nil,
        request_options: {}
      ); end
      # Get a project object by its id
      sig do
        params(
          project_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Project)
      end
      def retrieve(
        # Project id
        project_id,
        request_options: {}
      ); end
      # Partially update a project object. Specify the fields to update in the payload.
      # Any object-type fields will be deep-merged with existing content. Currently we
      # do not support removing fields or setting them to null.
      sig do
        params(
          project_id: String,
          name: T.nilable(String),
          settings: T.nilable(T.any(Braintrust::Models::ProjectSettings, Braintrust::Internal::AnyHash)),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Project)
      end
      def update(
        # Project id
        project_id,
        # Name of the project
        name: nil,
        # Project settings. Patch operations replace all settings, so make sure you
        # include all settings you want to keep.
        settings: nil,
        request_options: {}
      ); end
      # List out all projects. The projects are sorted by creation date, with the most
      # recently-created projects coming first
      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_name: String,
          starting_after: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Internal::ListObjects[Braintrust::Models::Project])
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
        # Name of the project to search for
        project_name: nil,
        # Pagination cursor id.
        #
        # For example, if the final item in the last page you fetched had an id of `foo`,
        # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        # `starting_after` and `ending_before`
        starting_after: nil,
        request_options: {}
      ); end
      # Delete a project object by its id
      sig do
        params(
          project_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
        )
          .returns(Braintrust::Models::Project)
      end
      def delete(
        # Project id
        project_id,
        request_options: {}
      ); end
      # @api private
      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:); end
    end
  end
end
