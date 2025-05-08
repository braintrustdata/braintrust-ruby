# typed: strong

module Braintrust
  module Resources
    class Functions
      # Create a new function. If there is an existing function in the project with the
      # same slug as the one specified in the request, will return the existing function
      # unmodified
      sig do
        params(
          function_data:
            T.any(
              Braintrust::FunctionCreateParams::FunctionData::Prompt::OrHash,
              Braintrust::FunctionCreateParams::FunctionData::Code::OrHash,
              Braintrust::FunctionCreateParams::FunctionData::Global::OrHash
            ),
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_schema:
            T.nilable(Braintrust::FunctionCreateParams::FunctionSchema::OrHash),
          function_type:
            T.nilable(Braintrust::FunctionCreateParams::FunctionType::OrSymbol),
          origin: T.nilable(Braintrust::FunctionCreateParams::Origin::OrHash),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          tags: T.nilable(T::Array[String]),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Function)
      end
      def create(
        function_data:,
        # Name of the prompt
        name:,
        # Unique identifier for the project that the prompt belongs under
        project_id:,
        # Unique identifier for the prompt
        slug:,
        # Textual description of the prompt
        description: nil,
        # JSON schema for the function's parameters and return type
        function_schema: nil,
        function_type: nil,
        origin: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # A list of tags for the prompt
        tags: nil,
        request_options: {}
      )
      end

      # Get a function object by its id
      sig do
        params(
          function_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Function)
      end
      def retrieve(
        # Function id
        function_id,
        request_options: {}
      )
      end

      # Partially update a function object. Specify the fields to update in the payload.
      # Any object-type fields will be deep-merged with existing content. Currently we
      # do not support removing fields or setting them to null.
      sig do
        params(
          function_id: String,
          description: T.nilable(String),
          function_data:
            T.nilable(
              T.any(
                Braintrust::FunctionUpdateParams::FunctionData::Prompt::OrHash,
                Braintrust::FunctionUpdateParams::FunctionData::Code::OrHash,
                Braintrust::FunctionUpdateParams::FunctionData::Global::OrHash
              )
            ),
          name: T.nilable(String),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          tags: T.nilable(T::Array[String]),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Function)
      end
      def update(
        # Function id
        function_id,
        # Textual description of the prompt
        description: nil,
        function_data: nil,
        # Name of the prompt
        name: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # A list of tags for the prompt
        tags: nil,
        request_options: {}
      )
      end

      # List out all functions. The functions are sorted by creation date, with the most
      # recently-created functions coming first
      sig do
        params(
          ending_before: String,
          function_name: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_id: String,
          project_name: String,
          slug: String,
          starting_after: String,
          version: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Internal::ListObjects[Braintrust::Function])
      end
      def list(
        # Pagination cursor id.
        #
        # For example, if the initial item in the last page you fetched had an id of
        # `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
        # pass one of `starting_after` and `ending_before`
        ending_before: nil,
        # Name of the function to search for
        function_name: nil,
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

      # Delete a function object by its id
      sig do
        params(
          function_id: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Function)
      end
      def delete(
        # Function id
        function_id,
        request_options: {}
      )
      end

      # Invoke a function.
      sig do
        params(
          function_id: String,
          expected: T.anything,
          input: T.anything,
          messages:
            T::Array[
              T.any(
                Braintrust::FunctionInvokeParams::Message::System::OrHash,
                Braintrust::FunctionInvokeParams::Message::User::OrHash,
                Braintrust::FunctionInvokeParams::Message::Assistant::OrHash,
                Braintrust::FunctionInvokeParams::Message::Tool::OrHash,
                Braintrust::FunctionInvokeParams::Message::Function::OrHash,
                Braintrust::FunctionInvokeParams::Message::Fallback::OrHash
              )
            ],
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          mode: T.nilable(Braintrust::FunctionInvokeParams::Mode::OrSymbol),
          parent:
            T.any(
              Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::OrHash,
              String
            ),
          stream: T.nilable(T::Boolean),
          version: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.nilable(T.anything))
      end
      def invoke(
        # Function id
        function_id,
        # The expected output of the function
        expected: nil,
        # Argument to the function, which can be any JSON serializable value
        input: nil,
        # If the function is an LLM, additional messages to pass along to it
        messages: nil,
        # Any relevant metadata
        metadata: nil,
        # The mode format of the returned value (defaults to 'auto')
        mode: nil,
        # Options for tracing the function call
        parent: nil,
        # Whether to stream the response. If true, results will be returned in the
        # Braintrust SSE format.
        stream: nil,
        # The version of the function
        version: nil,
        request_options: {}
      )
      end

      # Create or replace function. If there is an existing function in the project with
      # the same slug as the one specified in the request, will replace the existing
      # function with the provided fields
      sig do
        params(
          function_data:
            T.any(
              Braintrust::FunctionReplaceParams::FunctionData::Prompt::OrHash,
              Braintrust::FunctionReplaceParams::FunctionData::Code::OrHash,
              Braintrust::FunctionReplaceParams::FunctionData::Global::OrHash
            ),
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_schema:
            T.nilable(
              Braintrust::FunctionReplaceParams::FunctionSchema::OrHash
            ),
          function_type:
            T.nilable(
              Braintrust::FunctionReplaceParams::FunctionType::OrSymbol
            ),
          origin: T.nilable(Braintrust::FunctionReplaceParams::Origin::OrHash),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          tags: T.nilable(T::Array[String]),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(Braintrust::Function)
      end
      def replace(
        function_data:,
        # Name of the prompt
        name:,
        # Unique identifier for the project that the prompt belongs under
        project_id:,
        # Unique identifier for the prompt
        slug:,
        # Textual description of the prompt
        description: nil,
        # JSON schema for the function's parameters and return type
        function_schema: nil,
        function_type: nil,
        origin: nil,
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
