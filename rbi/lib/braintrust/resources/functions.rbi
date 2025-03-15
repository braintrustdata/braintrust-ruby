# typed: strong

module Braintrust
  module Resources
    class Functions
      # Create a new function. If there is an existing function in the project with the
      #   same slug as the one specified in the request, will return the existing function
      #   unmodified
      sig do
        params(
          function_data: T.any(
            Braintrust::Models::FunctionCreateParams::FunctionData::Prompt,
            Braintrust::Models::FunctionCreateParams::FunctionData::Code,
            Braintrust::Models::FunctionCreateParams::FunctionData::Global
          ),
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_schema: T.nilable(Braintrust::Models::FunctionCreateParams::FunctionSchema),
          function_type: T.nilable(Symbol),
          origin: T.nilable(Braintrust::Models::FunctionCreateParams::Origin),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          tags: T.nilable(T::Array[String]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Function)
      end
      def create(
        function_data:,
        name:,
        project_id:,
        slug:,
        description: nil,
        function_schema: nil,
        function_type: nil,
        origin: nil,
        prompt_data: nil,
        tags: nil,
        request_options: {}
      )
      end

      # Get a function object by its id
      sig do
        params(
          function_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Function)
      end
      def retrieve(function_id, request_options: {})
      end

      # Partially update a function object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      sig do
        params(
          function_id: String,
          description: T.nilable(String),
          function_data: T.nilable(
            T.any(
              Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Code,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Global
            )
          ),
          name: T.nilable(String),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          tags: T.nilable(T::Array[String]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Function)
      end
      def update(
        function_id,
        description: nil,
        function_data: nil,
        name: nil,
        prompt_data: nil,
        tags: nil,
        request_options: {}
      )
      end

      # List out all functions. The functions are sorted by creation date, with the most
      #   recently-created functions coming first
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
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::ListObjects[Braintrust::Models::Function])
      end
      def list(
        ending_before: nil,
        function_name: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        project_id: nil,
        project_name: nil,
        slug: nil,
        starting_after: nil,
        version: nil,
        request_options: {}
      )
      end

      # Delete a function object by its id
      sig do
        params(
          function_id: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Function)
      end
      def delete(function_id, request_options: {})
      end

      # Invoke a function.
      sig do
        params(
          function_id: String,
          expected: T.anything,
          input: T.anything,
          messages: T::Array[
          T.any(
            Braintrust::Models::FunctionInvokeParams::Message::System,
            Braintrust::Models::FunctionInvokeParams::Message::User,
            Braintrust::Models::FunctionInvokeParams::Message::Assistant,
            Braintrust::Models::FunctionInvokeParams::Message::Tool,
            Braintrust::Models::FunctionInvokeParams::Message::Function,
            Braintrust::Models::FunctionInvokeParams::Message::Fallback
          )
          ],
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          mode: T.nilable(Symbol),
          parent: T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String),
          stream: T.nilable(T::Boolean),
          version: String,
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(T.nilable(T.anything))
      end
      def invoke(
        function_id,
        expected: nil,
        input: nil,
        messages: nil,
        metadata: nil,
        mode: nil,
        parent: nil,
        stream: nil,
        version: nil,
        request_options: {}
      )
      end

      # Create or replace function. If there is an existing function in the project with
      #   the same slug as the one specified in the request, will replace the existing
      #   function with the provided fields
      sig do
        params(
          function_data: T.any(
            Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt,
            Braintrust::Models::FunctionReplaceParams::FunctionData::Code,
            Braintrust::Models::FunctionReplaceParams::FunctionData::Global
          ),
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_schema: T.nilable(Braintrust::Models::FunctionReplaceParams::FunctionSchema),
          function_type: T.nilable(Symbol),
          origin: T.nilable(Braintrust::Models::FunctionReplaceParams::Origin),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          tags: T.nilable(T::Array[String]),
          request_options: T.nilable(T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Braintrust::Models::Function)
      end
      def replace(
        function_data:,
        name:,
        project_id:,
        slug:,
        description: nil,
        function_schema: nil,
        function_type: nil,
        origin: nil,
        prompt_data: nil,
        tags: nil,
        request_options: {}
      )
      end

      sig { params(client: Braintrust::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
