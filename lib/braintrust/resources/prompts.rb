# frozen_string_literal: true

module Braintrust
  module Resources
    class Prompts
      # @param client [Braintrust::Client]
      def initialize(client:)
        @client = client
      end

      # Create a new prompt. If there is an existing prompt in the project with the same
      #   slug as the one specified in the request, will return the existing prompt
      #   unmodified
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String] :name Name of the prompt
      #   @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      #   @option params [String] :slug Unique identifier for the prompt
      #   @option params [String, nil] :description Textual description of the prompt
      #   @option params [Symbol, FunctionType, nil] :function_type
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Prompt]
      def create(params = {}, opts = {})
        req = {
          method: :post,
          path: "/v1/prompt",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Prompt
        }
        @client.request(req, opts)
      end

      # Get a prompt object by its id
      #
      # @param prompt_id [String] Prompt id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Prompt]
      def retrieve(prompt_id, opts = {})
        req = {
          method: :get,
          path: "/v1/prompt/#{prompt_id}",
          model: Braintrust::Models::Prompt
        }
        @client.request(req, opts)
      end

      # Partially update a prompt object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param prompt_id [String] Prompt id
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String, nil] :description Textual description of the prompt
      #   @option params [String, nil] :name Name of the prompt
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #   @option params [String, nil] :slug Unique identifier for the prompt
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Prompt]
      def update(prompt_id, params = {}, opts = {})
        req = {
          method: :patch,
          path: "/v1/prompt/#{prompt_id}",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Prompt
        }
        @client.request(req, opts)
      end

      # List out all prompts. The prompts are sorted by creation date, with the most
      #   recently-created prompts coming first
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String, nil] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #   @option params [Array<String>, String, nil] :ids Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #   @option params [Integer, nil] :limit Limit the number of objects to return
      #   @option params [String, nil] :org_name Filter search results to within a particular organization
      #   @option params [String, nil] :project_id Project id
      #   @option params [String, nil] :project_name Name of the project to search for
      #   @option params [String, nil] :prompt_name Name of the prompt to search for
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
      # @return [Braintrust::ListObjects<Braintrust::Models::Prompt>]
      def list(params = {}, opts = {})
        req = {
          method: :get,
          path: "/v1/prompt",
          query: params,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Prompt
        }
        @client.request(req, opts)
      end

      # Delete a prompt object by its id
      #
      # @param prompt_id [String] Prompt id
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Prompt]
      def delete(prompt_id, opts = {})
        req = {
          method: :delete,
          path: "/v1/prompt/#{prompt_id}",
          model: Braintrust::Models::Prompt
        }
        @client.request(req, opts)
      end

      # Create or replace prompt. If there is an existing prompt in the project with the
      #   same slug as the one specified in the request, will replace the existing prompt
      #   with the provided fields
      #
      # @param params [Hash] Attributes to send in this request.
      #   @option params [String] :name Name of the prompt
      #   @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      #   @option params [String] :slug Unique identifier for the prompt
      #   @option params [String, nil] :description Textual description of the prompt
      #   @option params [Symbol, FunctionType, nil] :function_type
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      # @param opts [Hash, Braintrust::RequestOptions] Options to specify HTTP behaviour for this request.
      #
      # @return [Braintrust::Models::Prompt]
      def replace(params = {}, opts = {})
        req = {
          method: :put,
          path: "/v1/prompt",
          body: params,
          headers: {"Content-Type" => "application/json"},
          model: Braintrust::Models::Prompt
        }
        @client.request(req, opts)
      end
    end
  end
end
