# frozen_string_literal: true

module Braintrust
  module Resources
    class Functions
      # Create a new function. If there is an existing function in the project with the
      #   same slug as the one specified in the request, will return the existing function
      #   unmodified
      #
      # @param params [Braintrust::Models::FunctionCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::Models::FunctionCreateParams::FunctionData::Prompt, Braintrust::Models::FunctionCreateParams::FunctionData::Code, Braintrust::Models::FunctionCreateParams::FunctionData::Global] :function_data
      #
      #   @option params [String] :name Name of the prompt
      #
      #   @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      #
      #   @option params [String] :slug Unique identifier for the prompt
      #
      #   @option params [String, nil] :description Textual description of the prompt
      #
      #   @option params [Braintrust::Models::FunctionCreateParams::FunctionSchema, nil] :function_schema JSON schema for the function's parameters and return type
      #
      #   @option params [Symbol, Braintrust::Models::FunctionCreateParams::FunctionType, nil] :function_type
      #
      #   @option params [Braintrust::Models::FunctionCreateParams::Origin, nil] :origin
      #
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Function]
      #
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
      # @param function_id [String] Function id
      #
      # @param params [Braintrust::Models::FunctionRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Function]
      #
      def retrieve(function_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/function/%0s", function_id],
          model: Braintrust::Models::Function,
          options: params[:request_options]
        )
      end

      # Partially update a function object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param function_id [String] Function id
      #
      # @param params [Braintrust::Models::FunctionUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String, nil] :description Textual description of the prompt
      #
      #   @option params [Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt, Braintrust::Models::FunctionUpdateParams::FunctionData::Code, Braintrust::Models::FunctionUpdateParams::FunctionData::Global, nil] :function_data
      #
      #   @option params [String, nil] :name Name of the prompt
      #
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Function]
      #
      def update(function_id, params = {})
        parsed, options = Braintrust::Models::FunctionUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/function/%0s", function_id],
          body: parsed,
          model: Braintrust::Models::Function,
          options: options
        )
      end

      # List out all functions. The functions are sorted by creation date, with the most
      #   recently-created functions coming first
      #
      # @param params [Braintrust::Models::FunctionListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #
      #   @option params [String] :function_name Name of the function to search for
      #
      #   @option params [String, Array<String>] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #
      #   @option params [String] :org_name Filter search results to within a particular organization
      #
      #   @option params [String] :project_id Project id
      #
      #   @option params [String] :project_name Name of the project to search for
      #
      #   @option params [String] :slug Retrieve prompt with a specific slug
      #
      #   @option params [String] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @option params [String] :version Retrieve prompt at a specific version.
      #
      #     The version id can either be a transaction id (e.g. '1000192656880881099') or a
      #     version identifier (e.g. '81cd05ee665fdfb3').
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Function>]
      #
      def list(params = {})
        parsed, options = Braintrust::Models::FunctionListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/function",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Function,
          options: options
        )
      end

      # Delete a function object by its id
      #
      # @param function_id [String] Function id
      #
      # @param params [Braintrust::Models::FunctionDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Function]
      #
      def delete(function_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/function/%0s", function_id],
          model: Braintrust::Models::Function,
          options: params[:request_options]
        )
      end

      # Invoke a function.
      #
      # @param function_id [String] Function id
      #
      # @param params [Braintrust::Models::FunctionInvokeParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Object] :expected The expected output of the function
      #
      #   @option params [Object] :input Argument to the function, which can be any JSON serializable value
      #
      #   @option params [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>] :messages If the function is an LLM, additional messages to pass along to it
      #
      #   @option params [Hash{Symbol=>Object, nil}, nil] :metadata Any relevant metadata
      #
      #   @option params [Symbol, Braintrust::Models::FunctionInvokeParams::Mode, nil] :mode The mode format of the returned value (defaults to 'auto')
      #
      #   @option params [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String] :parent Options for tracing the function call
      #
      #   @option params [Boolean, nil] :stream Whether to stream the response. If true, results will be returned in the
      #     Braintrust SSE format.
      #
      #   @option params [String] :version The version of the function
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Object, nil]
      #
      def invoke(function_id, params = {})
        parsed, options = Braintrust::Models::FunctionInvokeParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["v1/function/%0s/invoke", function_id],
          body: parsed,
          model: Braintrust::Unknown,
          options: options
        )
      end

      # Create or replace function. If there is an existing function in the project with
      #   the same slug as the one specified in the request, will replace the existing
      #   function with the provided fields
      #
      # @param params [Braintrust::Models::FunctionReplaceParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt, Braintrust::Models::FunctionReplaceParams::FunctionData::Code, Braintrust::Models::FunctionReplaceParams::FunctionData::Global] :function_data
      #
      #   @option params [String] :name Name of the prompt
      #
      #   @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      #
      #   @option params [String] :slug Unique identifier for the prompt
      #
      #   @option params [String, nil] :description Textual description of the prompt
      #
      #   @option params [Braintrust::Models::FunctionReplaceParams::FunctionSchema, nil] :function_schema JSON schema for the function's parameters and return type
      #
      #   @option params [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionType, nil] :function_type
      #
      #   @option params [Braintrust::Models::FunctionReplaceParams::Origin, nil] :origin
      #
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Function]
      #
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

      # @param client [Braintrust::Client]
      #
      def initialize(client:)
        @client = client
      end
    end
  end
end
