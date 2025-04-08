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
      # @param name [String]
      # @param project_id [String]
      # @param slug [String]
      # @param description [String, nil]
      # @param function_schema [Braintrust::Models::FunctionCreateParams::FunctionSchema, nil]
      # @param function_type [Symbol, Braintrust::Models::FunctionCreateParams::FunctionType, nil]
      # @param origin [Braintrust::Models::FunctionCreateParams::Origin, nil]
      # @param prompt_data [Braintrust::Models::PromptData, nil]
      # @param tags [Array<String>, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Function]
      #
      # @see Braintrust::Models::FunctionCreateParams
      def create(params)
        parsed, options = Braintrust::Models::FunctionCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/function",
          body: parsed,
          model: Braintrust::Models::Function,
          options: options
        )
      end

      # Get a function object by its id
      #
      # @overload retrieve(function_id, request_options: {})
      #
      # @param function_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Function]
      #
      # @see Braintrust::Models::FunctionRetrieveParams
      def retrieve(function_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/function/%1$s", function_id],
          model: Braintrust::Models::Function,
          options: params[:request_options]
        )
      end

      # Partially update a function object. Specify the fields to update in the payload.
      # Any object-type fields will be deep-merged with existing content. Currently we
      # do not support removing fields or setting them to null.
      #
      # @overload update(function_id, description: nil, function_data: nil, name: nil, prompt_data: nil, tags: nil, request_options: {})
      #
      # @param function_id [String]
      # @param description [String, nil]
      # @param function_data [Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt, Braintrust::Models::FunctionUpdateParams::FunctionData::Code, Braintrust::Models::FunctionUpdateParams::FunctionData::Global, nil]
      # @param name [String, nil]
      # @param prompt_data [Braintrust::Models::PromptData, nil]
      # @param tags [Array<String>, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Function]
      #
      # @see Braintrust::Models::FunctionUpdateParams
      def update(function_id, params = {})
        parsed, options = Braintrust::Models::FunctionUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/function/%1$s", function_id],
          body: parsed,
          model: Braintrust::Models::Function,
          options: options
        )
      end

      # List out all functions. The functions are sorted by creation date, with the most
      # recently-created functions coming first
      #
      # @overload list(ending_before: nil, function_name: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, slug: nil, starting_after: nil, version: nil, request_options: {})
      #
      # @param ending_before [String]
      # @param function_name [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param org_name [String]
      # @param project_id [String]
      # @param project_name [String]
      # @param slug [String]
      # @param starting_after [String]
      # @param version [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Internal::ListObjects<Braintrust::Models::Function>]
      #
      # @see Braintrust::Models::FunctionListParams
      def list(params = {})
        parsed, options = Braintrust::Models::FunctionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/function",
          query: parsed,
          page: Braintrust::Internal::ListObjects,
          model: Braintrust::Models::Function,
          options: options
        )
      end

      # Delete a function object by its id
      #
      # @overload delete(function_id, request_options: {})
      #
      # @param function_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Function]
      #
      # @see Braintrust::Models::FunctionDeleteParams
      def delete(function_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/function/%1$s", function_id],
          model: Braintrust::Models::Function,
          options: params[:request_options]
        )
      end

      # Invoke a function.
      #
      # @overload invoke(function_id, expected: nil, input: nil, messages: nil, metadata: nil, mode: nil, parent: nil, stream: nil, version: nil, request_options: {})
      #
      # @param function_id [String]
      # @param expected [Object]
      # @param input [Object]
      # @param messages [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>]
      # @param metadata [Hash{Symbol=>Object, nil}, nil]
      # @param mode [Symbol, Braintrust::Models::FunctionInvokeParams::Mode, nil]
      # @param parent [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String]
      # @param stream [Boolean, nil]
      # @param version [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object, nil]
      #
      # @see Braintrust::Models::FunctionInvokeParams
      def invoke(function_id, params = {})
        parsed, options = Braintrust::Models::FunctionInvokeParams.dump_request(params)
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
      # @param name [String]
      # @param project_id [String]
      # @param slug [String]
      # @param description [String, nil]
      # @param function_schema [Braintrust::Models::FunctionReplaceParams::FunctionSchema, nil]
      # @param function_type [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionType, nil]
      # @param origin [Braintrust::Models::FunctionReplaceParams::Origin, nil]
      # @param prompt_data [Braintrust::Models::PromptData, nil]
      # @param tags [Array<String>, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Braintrust::Models::Function]
      #
      # @see Braintrust::Models::FunctionReplaceParams
      def replace(params)
        parsed, options = Braintrust::Models::FunctionReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/function",
          body: parsed,
          model: Braintrust::Models::Function,
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
