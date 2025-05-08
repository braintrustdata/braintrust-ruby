# typed: strong

module Braintrust
  module Resources
    class Prompts
      # Create a new prompt. If there is an existing prompt in the project with the same
      # slug as the one specified in the request, will return the existing prompt
      # unmodified
      sig do
        params(
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_type:
            T.nilable(Braintrust::PromptCreateParams::FunctionType::OrSymbol),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          tags: T.nilable(T::Array[String]),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Prompt)
      end
      def create(
        # Name of the prompt
        name:,
        # Unique identifier for the project that the prompt belongs under
        project_id:,
        # Unique identifier for the prompt
        slug:,
        # Textual description of the prompt
        description: nil,
        function_type: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # A list of tags for the prompt
        tags: nil,
        request_options: {}
      )
      end

      # Get a prompt object by its id
      sig do
        params(
          prompt_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Prompt)
      end
      def retrieve(
        # Prompt id
        prompt_id,
        request_options: {}
      )
      end

      # Partially update a prompt object. Specify the fields to update in the payload.
      # Any object-type fields will be deep-merged with existing content. Currently we
      # do not support removing fields or setting them to null.
      sig do
        params(
          prompt_id: String,
          description: T.nilable(String),
          name: T.nilable(String),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          slug: T.nilable(String),
          tags: T.nilable(T::Array[String]),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Prompt)
      end
      def update(
        # Prompt id
        prompt_id,
        # Textual description of the prompt
        description: nil,
        # Name of the prompt
        name: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # Unique identifier for the prompt
        slug: nil,
        # A list of tags for the prompt
        tags: nil,
        request_options: {}
      )
      end

      # List out all prompts. The prompts are sorted by creation date, with the most
      # recently-created prompts coming first
      sig do
        params(
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_id: String,
          project_name: String,
          prompt_name: String,
          slug: String,
          starting_after: String,
          version: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Internal::ListObjects[Braintrust::Prompt])
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
        # Name of the prompt to search for
        prompt_name: nil,
        # Retrieve prompt with a specific slug
        slug: nil,
        # Pagination cursor id.
        #
        # For example, if the final item in the last page you fetched had an id of `foo`,
        # pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
        # `starting_after` and `ending_before`
        starting_after: nil,
        # Retrieve prompt at a specific version.
        #
        # The version id can either be a transaction id (e.g. '1000192656880881099') or a
        # version identifier (e.g. '81cd05ee665fdfb3').
        version: nil,
        request_options: {}
      )
      end

      # Delete a prompt object by its id
      sig do
        params(
          prompt_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Prompt)
      end
      def delete(
        # Prompt id
        prompt_id,
        request_options: {}
      )
      end

      # Create or replace prompt. If there is an existing prompt in the project with the
      # same slug as the one specified in the request, will replace the existing prompt
      # with the provided fields
      sig do
        params(
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_type:
            T.nilable(Braintrust::PromptReplaceParams::FunctionType::OrSymbol),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          tags: T.nilable(T::Array[String]),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Prompt)
      end
      def replace(
        # Name of the prompt
        name:,
        # Unique identifier for the project that the prompt belongs under
        project_id:,
        # Unique identifier for the prompt
        slug:,
        # Textual description of the prompt
        description: nil,
        function_type: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # A list of tags for the prompt
        tags: nil,
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
