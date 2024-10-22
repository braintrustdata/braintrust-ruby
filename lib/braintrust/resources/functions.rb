# frozen_string_literal: true

module Braintrust
  module Resources
    class Functions
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Create a new function. If there is an existing function in the project with the
      #   same slug as the one specified in the request, will return the existing function
      #   unmodified
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [FunctionData::UnnamedTypeWithunionParent21, FunctionData::UnnamedTypeWithunionParent22, FunctionData::UnnamedTypeWithunionParent23] :function_data
      #   @option params [String] :name Name of the prompt
      #   @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      #   @option params [String] :slug Unique identifier for the prompt
      #   @option params [String, nil] :description Textual description of the prompt
      #   @option params [FunctionSchema, nil] :function_schema JSON schema for the function's parameters and return type
      #   @option params [Symbol, FunctionType, nil] :function_type
      #   @option params [Origin, nil] :origin
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Function]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/function",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Function
        }
        @client.request(req, opts)
      end

      # Get a function object by its id
      #
      # @param function_id [String] Function id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Function]
      def retrieve(function_id, opts = {})
        req = {
          method: :get,
          path: "/v1/function/#{function_id}",
          model: Braintrust::Models::Function
        }
        @client.request(req, opts)
      end

      # Partially update a function object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param function_id [String] Function id
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :description Textual description of the prompt
      #   @option params [FunctionData::UnnamedTypeWithunionParent24, FunctionData::UnnamedTypeWithunionParent25, FunctionData::UnnamedTypeWithunionParent26, FunctionData::UnnamedTypeWithunionParent27, nil] :function_data
      #   @option params [String, nil] :name Name of the prompt
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Function]
      def update(function_id, params = {}, opts = {})
        req = {
          method: :patch,
          path: "/v1/function/#{function_id}",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Function
        }
        @client.request(req, opts)
      end

      # List out all functions. The functions are sorted by creation date, with the most
      #   recently-created functions coming first
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [String, nil] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #   @option params [String, nil] :function_name Name of the function to search for
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :org_name Filter search results to within a particular organization
      #   @option params [String, nil] :project_id Project id
      #   @option params [String, nil] :project_name Name of the project to search for
      #   @option params [String, nil] :slug Retrieve prompt with a specific slug
      #   @option params [String, nil] :starting_after Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #   @option params [String, nil] :version Retrieve prompt at a specific version.
      #
      #     The version id can either be a transaction id (e.g. '1000192656880881099') or a
      #     version identifier (e.g. '81cd05ee665fdfb3').
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Function>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/function",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Function
        }
        @client.request(req, opts)
      end

      # Delete a function object by its id
      #
      # @param function_id [String] Function id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Function]
      def delete(function_id, opts = {})
        req = {
          method: :delete,
          path: "/v1/function/#{function_id}",
          model: Braintrust::Models::Function
        }
        @client.request(req, opts)
      end

      # Invoke a function.
      #
      # @param function_id [String] Function id
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [Object, nil] :input Argument to the function, which can be any JSON serializable value
      #   @option params [Array<Message::UnnamedTypeWithunionParent28, Message::UnnamedTypeWithunionParent29, Message::UnnamedTypeWithunionParent30, Message::UnnamedTypeWithunionParent31, Message::UnnamedTypeWithunionParent32, Message::UnnamedTypeWithunionParent33>, nil] :messages If the function is an LLM, additional messages to pass along to it
      #   @option params [Symbol, Mode, nil] :mode The mode format of the returned value (defaults to 'auto')
      #   @option params [Parent::UnnamedTypeWithunionParent34, String, nil] :parent Options for tracing the function call
      #   @option params [Boolean, nil] :stream Whether to stream the response. If true, results will be returned in the
      #     Braintrust SSE format.
      #   @option params [String, nil] :version The version of the function
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Object]
      def invoke(function_id, params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/function/#{function_id}/invoke",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Unknown
        }
        @client.request(req, opts)
      end

      # Create or replace function. If there is an existing function in the project with
      #   the same slug as the one specified in the request, will replace the existing
      #   function with the provided fields
      #
      # @param params [Hash{Symbol => Object}] Attributes to send in this request.
      #   @option params [FunctionData::UnnamedTypeWithunionParent35, FunctionData::UnnamedTypeWithunionParent36, FunctionData::UnnamedTypeWithunionParent37] :function_data
      #   @option params [String] :name Name of the prompt
      #   @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      #   @option params [String] :slug Unique identifier for the prompt
      #   @option params [String, nil] :description Textual description of the prompt
      #   @option params [FunctionSchema, nil] :function_schema JSON schema for the function's parameters and return type
      #   @option params [Symbol, FunctionType, nil] :function_type
      #   @option params [Origin, nil] :origin
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Function]
      def replace(params = {}, opts = {})
        req = {
          method: :put,
          path: "/v1/function",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Function
        }
        @client.request(req, opts)
      end
    end
  end
end
