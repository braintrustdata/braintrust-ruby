# frozen_string_literal: true

module Braintrust
  module Resources
    class Functions
      def initialize(client:)
        @client = client
      end

      # Create a new function. If there is an existing function in the project with the
      #   same slug as the one specified in the request, will return the existing function
      #   unmodified
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Braintrust::Models::Code|FunctionData::UnnamedTypeWithunionParent20|FunctionData::UnnamedTypeWithunionParent21] :function_data
      # @option params [String] :name Name of the prompt
      # @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      # @option params [String] :slug Unique identifier for the prompt
      # @option params [String] :description Textual description of the prompt
      # @option params [FunctionSchema] :function_schema JSON schema for the function's parameters and return type
      # @option params [Symbol] :function_type
      # @option params [Origin] :origin
      # @option params [Braintrust::Models::PromptData] :prompt_data The prompt, model, and its parameters
      # @option params [Array<String>] :tags A list of tags for the prompt
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Function]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/function"
        req[:body] = params
        req[:model] = Braintrust::Models::Function
        @client.request(req, opts)
      end

      # Get a function object by its id
      #
      # @param function_id [String] Function id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Function]
      def retrieve(function_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/function/#{function_id}"
        req[:model] = Braintrust::Models::Function
        @client.request(req, opts)
      end

      # Partially update a function object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param function_id [String] Function id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :description Textual description of the prompt
      # @option params [Braintrust::Models::Code|FunctionData::UnnamedTypeWithunionParent22|FunctionData::UnnamedTypeWithunionParent23|FunctionData::UnnamedTypeWithunionParent24] :function_data
      # @option params [String] :name Name of the prompt
      # @option params [Braintrust::Models::PromptData] :prompt_data The prompt, model, and its parameters
      # @option params [Array<String>] :tags A list of tags for the prompt
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Function]
      def update(function_id, params = {}, opts = {})
        req = {}
        req[:method] = :patch
        req[:path] = "/v1/function/#{function_id}"
        req[:body] = params
        req[:model] = Braintrust::Models::Function
        @client.request(req, opts)
      end

      # List out all functions. The functions are sorted by creation date, with the most
      #   recently-created functions coming first
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :ending_before Pagination cursor id.
      #
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      # @option params [String] :function_name Name of the function to search for
      # @option params [Array<String>|String] :ids Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      # @option params [Integer] :limit Limit the number of objects to return
      # @option params [String] :org_name Filter search results to within a particular organization
      # @option params [String] :project_id Project id
      # @option params [String] :project_name Name of the project to search for
      # @option params [String] :slug Retrieve prompt with a specific slug
      # @option params [String] :starting_after Pagination cursor id.
      #
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      # @option params [String] :version Retrieve prompt at a specific version.
      #
      #   The version id can either be a transaction id (e.g. '1000192656880881099') or a
      #   version identifier (e.g. '81cd05ee665fdfb3').
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::ListObjects<Braintrust::Models::Function>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/function"
        req[:query] = params
        req[:page] = Braintrust::ListObjects
        req[:model] = Braintrust::Models::Function
        @client.request(req, opts)
      end

      # Delete a function object by its id
      #
      # @param function_id [String] Function id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Function]
      def delete(function_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/function/#{function_id}"
        req[:model] = Braintrust::Models::Function
        @client.request(req, opts)
      end

      # Invoke a function.
      #
      # @param function_id [String] Function id
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Object] :input Argument to the function, which can be any JSON serializable value
      # @option params [Array<Braintrust::Models::Messages::UnnamedTypeWithunionParent25|Braintrust::Models::Messages::UnnamedTypeWithunionParent26|Braintrust::Models::Messages::UnnamedTypeWithunionParent27|Braintrust::Models::Messages::UnnamedTypeWithunionParent28|Braintrust::Models::Messages::UnnamedTypeWithunionParent29|Braintrust::Models::Messages::UnnamedTypeWithunionParent30>] :messages If the function is an LLM, additional messages to pass along to it
      # @option params [Symbol] :mode The mode format of the returned value (defaults to 'auto')
      # @option params [Parent::UnnamedTypeWithunionParent31|String] :parent Options for tracing the function call
      # @option params [Boolean] :stream Whether to stream the response. If true, results will be returned in the
      #   Braintrust SSE format.
      # @option params [String] :version The version of the function
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Object]
      def invoke(function_id, params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/function/#{function_id}/invoke"
        req[:body] = params
        req[:model] = Braintrust::Unknown
        @client.request(req, opts)
      end

      # Create or replace function. If there is an existing function in the project with
      #   the same slug as the one specified in the request, will replace the existing
      #   function with the provided fields
      #
      # @param params [Hash] Attributes to send in this request.
      # @option params [Braintrust::Models::Code|FunctionData::UnnamedTypeWithunionParent32|FunctionData::UnnamedTypeWithunionParent33] :function_data
      # @option params [String] :name Name of the prompt
      # @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      # @option params [String] :slug Unique identifier for the prompt
      # @option params [String] :description Textual description of the prompt
      # @option params [FunctionSchema] :function_schema JSON schema for the function's parameters and return type
      # @option params [Symbol] :function_type
      # @option params [Origin] :origin
      # @option params [Braintrust::Models::PromptData] :prompt_data The prompt, model, and its parameters
      # @option params [Array<String>] :tags A list of tags for the prompt
      #
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Function]
      def replace(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/v1/function"
        req[:body] = params
        req[:model] = Braintrust::Models::Function
        @client.request(req, opts)
      end
    end
  end
end
