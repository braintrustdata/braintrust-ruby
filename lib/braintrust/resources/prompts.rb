# frozen_string_literal: true

module Braintrust
  module Resources
    class Prompts
      # Create a new prompt. If there is an existing prompt in the project with the same
      #   slug as the one specified in the request, will return the existing prompt
      #   unmodified
      #
      # @param params [Braintrust::Models::PromptCreateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the prompt
      #
      #   @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      #
      #   @option params [String] :slug Unique identifier for the prompt
      #
      #   @option params [String, nil] :description Textual description of the prompt
      #
      #   @option params [Symbol, Braintrust::Models::PromptCreateParams::FunctionType, nil] :function_type
      #
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Prompt]
      #
      # @see Braintrust::Models::PromptCreateParams
      def create(params)
        parsed, options = Braintrust::Models::PromptCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/prompt",
          body: parsed,
          model: Braintrust::Models::Prompt,
          options: options
        )
      end

      # Get a prompt object by its id
      #
      # @param prompt_id [String] Prompt id
      #
      # @param params [Braintrust::Models::PromptRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Prompt]
      #
      # @see Braintrust::Models::PromptRetrieveParams
      def retrieve(prompt_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/prompt/%1$s", prompt_id],
          model: Braintrust::Models::Prompt,
          options: params[:request_options]
        )
      end

      # Partially update a prompt object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      #
      # @param prompt_id [String] Prompt id
      #
      # @param params [Braintrust::Models::PromptUpdateParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String, nil] :description Textual description of the prompt
      #
      #   @option params [String, nil] :name Name of the prompt
      #
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #
      #   @option params [String, nil] :slug Unique identifier for the prompt
      #
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Prompt]
      #
      # @see Braintrust::Models::PromptUpdateParams
      def update(prompt_id, params = {})
        parsed, options = Braintrust::Models::PromptUpdateParams.dump_request(params)
        @client.request(
          method: :patch,
          path: ["v1/prompt/%1$s", prompt_id],
          body: parsed,
          model: Braintrust::Models::Prompt,
          options: options
        )
      end

      # List out all prompts. The prompts are sorted by creation date, with the most
      #   recently-created prompts coming first
      #
      # @param params [Braintrust::Models::PromptListParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :ending_before Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
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
      #   @option params [String] :prompt_name Name of the prompt to search for
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
      # @return [Braintrust::ListObjects<Braintrust::Models::Prompt>]
      #
      # @see Braintrust::Models::PromptListParams
      def list(params = {})
        parsed, options = Braintrust::Models::PromptListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/prompt",
          query: parsed,
          page: Braintrust::ListObjects,
          model: Braintrust::Models::Prompt,
          options: options
        )
      end

      # Delete a prompt object by its id
      #
      # @param prompt_id [String] Prompt id
      #
      # @param params [Braintrust::Models::PromptDeleteParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Prompt]
      #
      # @see Braintrust::Models::PromptDeleteParams
      def delete(prompt_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/prompt/%1$s", prompt_id],
          model: Braintrust::Models::Prompt,
          options: params[:request_options]
        )
      end

      # Create or replace prompt. If there is an existing prompt in the project with the
      #   same slug as the one specified in the request, will replace the existing prompt
      #   with the provided fields
      #
      # @param params [Braintrust::Models::PromptReplaceParams, Hash{Symbol=>Object}] .
      #
      #   @option params [String] :name Name of the prompt
      #
      #   @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      #
      #   @option params [String] :slug Unique identifier for the prompt
      #
      #   @option params [String, nil] :description Textual description of the prompt
      #
      #   @option params [Symbol, Braintrust::Models::PromptReplaceParams::FunctionType, nil] :function_type
      #
      #   @option params [Braintrust::Models::PromptData, nil] :prompt_data The prompt, model, and its parameters
      #
      #   @option params [Array<String>, nil] :tags A list of tags for the prompt
      #
      #   @option params [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Braintrust::Models::Prompt]
      #
      # @see Braintrust::Models::PromptReplaceParams
      def replace(params)
        parsed, options = Braintrust::Models::PromptReplaceParams.dump_request(params)
        @client.request(
          method: :put,
          path: "v1/prompt",
          body: parsed,
          model: Braintrust::Models::Prompt,
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
