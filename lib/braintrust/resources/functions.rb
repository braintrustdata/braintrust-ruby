# frozen_string_literal: true

module Braintrust
  module Resources
    class Functions
      # Create a new function. If there is an existing function in the project with the
      # same slug as the one specified in the request, will return the existing function
      # unmodified
      #
      # @overload create(function_data:, name:, project_id:, slug:, description: nil, function_schema: nil, function_type: nil, origin: nil, prompt_data: nil, tags: nil, request_options: {})
      #
      # @param function_data [Braintrust::Models::FunctionCreateParams::FunctionData::Prompt, Braintrust::Models::FunctionCreateParams::FunctionData::Code, Braintrust::Models::FunctionCreateParams::FunctionData::Global]
      #
      # @param name [String] Name of the prompt
      #
      # @param project_id [String] Unique identifier for the project that the prompt belongs under
      #
      # @param slug [String] Unique identifier for the prompt
      #
      # @param description [String, nil] Textual description of the prompt
      #
      # @param function_schema [Braintrust::Models::FunctionCreateParams::FunctionSchema, nil] JSON schema for the function's parameters and return type
      #
      # @param function_type [Symbol, Braintrust::Models::FunctionCreateParams::FunctionType, nil]
      #
      # @param origin [Braintrust::Models::FunctionCreateParams::Origin, nil]
      #
      # @param prompt_data [Braintrust::Models::PromptData, nil] The prompt, model, and its parameters
      #
      # @param tags [Array<String>, nil] A list of tags for the prompt
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Function]
      #
      # @see Braintrust::Models::FunctionCreateParams
      def create(params)
        parsed, options = Braintrust::FunctionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/function",
          body: parsed,
          model: Braintrust::Function,
          options: options
        )
      end

      # Get a function object by its id
      #
      # @overload retrieve(function_id, request_options: {})
      #
      # @param function_id [String] Function id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Function]
      #
      # @see Braintrust::Models::FunctionRetrieveParams
      def retrieve(function_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/function/%1$s", function_id],
          model: Braintrust::Function,
          options: params[:request_options]
        )
      end

      # Partially update a function object. Specify the fields to update in the payload.
      # Any object-type fields will be deep-merged with existing content. Currently we
      # do not support removing fields or setting them to null.
      #
      # @overload update(function_id, description: nil, function_data: nil, name: nil, prompt_data: nil, tags: nil, request_options: {})
      #
      # @param function_id [String] Function id
      #
      # @param description [String, nil] Textual description of the prompt
      #
      # @param function_data [Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt, Braintrust::Models::FunctionUpdateParams::FunctionData::Code, Braintrust::Models::FunctionUpdateParams::FunctionData::Global, nil]
      #
      # @param name [String, nil] Name of the prompt
      #
      # @param prompt_data [Braintrust::Models::PromptData, nil] The prompt, model, and its parameters
      #
      # @param tags [Array<String>, nil] A list of tags for the prompt
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Function]
      #
      # @see Braintrust::Models::FunctionUpdateParams
      def update(function_id, params = {})
        parsed, options = Braintrust::FunctionUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/function/%1$s", function_id],
          body: parsed,
          model: Braintrust::Function,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::FunctionListParams} for more details.
      #
      # List out all functions. The functions are sorted by creation date, with the most
      # recently-created functions coming first
      #
      # @overload list(ending_before: nil, function_name: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, slug: nil, starting_after: nil, version: nil, request_options: {})
      #
      # @param ending_before [String] Pagination cursor id.
      #
      # @param function_name [String] Name of the function to search for
      #
      # @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      #
      # @param limit [Integer, nil] Limit the number of objects to return
      #
      # @param org_name [String] Filter search results to within a particular organization
      #
      # @param project_id [String] Project id
      #
      # @param project_name [String] Name of the project to search for
      #
      # @param slug [String] Retrieve prompt with a specific slug
      #
      # @param starting_after [String] Pagination cursor id.
      #
      # @param version [String] Retrieve prompt at a specific version.
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::Function>]
      #
      # @see Braintrust::Models::FunctionListParams
      def list(params = {})
        parsed, options = Braintrust::FunctionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/function",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Function,
          options: options
        )
      end

      # Delete a function object by its id
      #
      # @overload delete(function_id, request_options: {})
      #
      # @param function_id [String] Function id
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Function]
      #
      # @see Braintrust::Models::FunctionDeleteParams
      def delete(function_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/function/%1$s", function_id],
          model: Braintrust::Function,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Braintrust::Models::FunctionInvokeParams} for more details.
      #
      # Invoke a function.
      #
      # @overload invoke(function_id, expected: nil, input: nil, messages: nil, metadata: nil, mode: nil, parent: nil, stream: nil, version: nil, request_options: {})
      #
      # @param function_id [String] Function id
      #
      # @param expected [Object] The expected output of the function
      #
      # @param input [Object] Argument to the function, which can be any JSON serializable value
      #
      # @param messages [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>] If the function is an LLM, additional messages to pass along to it
      #
      # @param metadata [Hash{Symbol=>Object, nil}, nil] Any relevant metadata
      #
      # @param mode [Symbol, Braintrust::Models::FunctionInvokeParams::Mode, nil] The mode format of the returned value (defaults to 'auto')
      #
      # @param parent [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String] Options for tracing the function call
      #
      # @param stream [Boolean, nil] Whether to stream the response. If true, results will be returned in the Braintr
      #
      # @param version [String] The version of the function
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object, nil]
      #
      # @see Braintrust::Models::FunctionInvokeParams
      def invoke(function_id, params = {})
        parsed, options = Braintrust::FunctionInvokeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/function/%1$s/invoke", function_id],
          body: parsed,
          model: Braintrust::Internal::Type::Unknown,
          options: options
        )
      end

      # Create or replace function. If there is an existing function in the project with
      # the same slug as the one specified in the request, will replace the existing
      # function with the provided fields
      #
      # @overload replace(function_data:, name:, project_id:, slug:, description: nil, function_schema: nil, function_type: nil, origin: nil, prompt_data: nil, tags: nil, request_options: {})
      #
      # @param function_data [Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt, Braintrust::Models::FunctionReplaceParams::FunctionData::Code, Braintrust::Models::FunctionReplaceParams::FunctionData::Global]
      #
      # @param name [String] Name of the prompt
      #
      # @param project_id [String] Unique identifier for the project that the prompt belongs under
      #
      # @param slug [String] Unique identifier for the prompt
      #
      # @param description [String, nil] Textual description of the prompt
      #
      # @param function_schema [Braintrust::Models::FunctionReplaceParams::FunctionSchema, nil] JSON schema for the function's parameters and return type
      #
      # @param function_type [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionType, nil]
      #
      # @param origin [Braintrust::Models::FunctionReplaceParams::Origin, nil]
      #
      # @param prompt_data [Braintrust::Models::PromptData, nil] The prompt, model, and its parameters
      #
      # @param tags [Array<String>, nil] A list of tags for the prompt
      #
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Function]
      #
      # @see Braintrust::Models::FunctionReplaceParams
      def replace(params)
        parsed, options = Braintrust::FunctionReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/function",
          body: parsed,
          model: Braintrust::Function,
          options: options
        )
      end

      # @api private
      #
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
