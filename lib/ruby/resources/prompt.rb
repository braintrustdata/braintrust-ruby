# frozen_string_literal: true

module Ruby
  module Resources
    class Prompt
      def initialize(client:)
        @client = client
      end

      # Create a new prompt. If there is an existing prompt in the project with the same
      #   slug as the one specified in the request, will return the existing prompt
      #   unmodified
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the prompt
      # @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      # @option params [String] :slug Unique identifier for the prompt
      # @option params [String] :description Textual description of the prompt
      # @option params [PromptData] :prompt_data The prompt, model, and its parameters
      # @option params [Array<String>] :tags A list of tags for the prompt
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::Models::Prompt]
      def create(params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/prompt"
        req[:body] = params
        req[:model] = Ruby::Models::Prompt
        @client.request(req, opts)
      end

      # Get a prompt object by its id
      # 
      # @param prompt_id [String] Prompt id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::Models::Prompt]
      def retrieve(prompt_id, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/prompt/#{prompt_id}"
        req[:model] = Ruby::Models::Prompt
        @client.request(req, opts)
      end

      # Partially update a prompt object. Specify the fields to update in the payload.
      #   Any object-type fields will be deep-merged with existing content. Currently we
      #   do not support removing fields or setting them to null.
      # 
      # @param prompt_id [String] Prompt id
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :description Textual description of the prompt
      # @option params [String] :name Name of the prompt
      # @option params [PromptData] :prompt_data The prompt, model, and its parameters
      # @option params [Array<String>] :tags A list of tags for the prompt
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::Models::Prompt]
      def update(prompt_id, params = {}, opts = {})
        req = {}
        req[:method] = :patch
        req[:path] = "/v1/prompt/#{prompt_id}"
        req[:body] = params
        req[:model] = Ruby::Models::Prompt
        @client.request(req, opts)
      end

      # List out all prompts. The prompts are sorted by creation date, with the most
      #   recently-created prompts coming first
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :ending_before Pagination cursor id.
      # 
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      # @option params [Array<String>|String] :ids Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      # @option params [Integer] :limit Limit the number of objects to return
      # @option params [String] :org_name Filter search results to within a particular organization
      # @option params [String] :project_name Name of the project to search for
      # @option params [String] :prompt_name Name of the prompt to search for
      # @option params [String] :slug Retrieve prompt with a specific slug
      # @option params [String] :starting_after Pagination cursor id.
      # 
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      # @option params [String] :version Retrieve a snapshot of events from a past time
      # 
      #   The version id is essentially a filter on the latest event transaction id. You
      #   can use the `max_xact_id` returned by a past fetch as the version to reproduce
      #   that exact fetch.
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::ListObjects<Ruby::Models::Prompt>]
      def list(params = {}, opts = {})
        req = {}
        req[:method] = :get
        req[:path] = "/v1/prompt"
        req[:query] = params
        req[:page] = Ruby::ListObjects
        req[:model] = Ruby::Models::Prompt
        @client.request(req, opts)
      end

      # Delete a prompt object by its id
      # 
      # @param prompt_id [String] Prompt id
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::Models::Prompt]
      def delete(prompt_id, opts = {})
        req = {}
        req[:method] = :delete
        req[:path] = "/v1/prompt/#{prompt_id}"
        req[:model] = Ruby::Models::Prompt
        @client.request(req, opts)
      end

      # Log feedback for a set of prompt events
      # 
      # @param prompt_id [String] Prompt id
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [Array<Feedback>] :feedback A list of prompt feedback items
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [nil]
      def feedback(prompt_id, params = {}, opts = {})
        req = {}
        req[:method] = :post
        req[:path] = "/v1/prompt/#{prompt_id}/feedback"
        req[:body] = params
        req[:model] = NilClass
        @client.request(req, opts)
      end

      # NOTE: This operation is deprecated and will be removed in a future revision of
      #   the API. Create or replace a new prompt. If there is an existing prompt in the
      #   project with the same slug as the one specified in the request, will return the
      #   existing prompt unmodified, will replace the existing prompt with the provided
      #   fields
      # 
      # @param params [Hash] Attributes to send in this request.
      # @option params [String] :name Name of the prompt
      # @option params [String] :project_id Unique identifier for the project that the prompt belongs under
      # @option params [String] :slug Unique identifier for the prompt
      # @option params [String] :description Textual description of the prompt
      # @option params [PromptData] :prompt_data The prompt, model, and its parameters
      # @option params [Array<String>] :tags A list of tags for the prompt
      # 
      # @param opts [Hash|RequestOptions] Options to specify HTTP behaviour for this request.
      # 
      # @return [Ruby::Models::Prompt]
      def replace(params = {}, opts = {})
        req = {}
        req[:method] = :put
        req[:path] = "/v1/prompt"
        req[:body] = params
        req[:model] = Ruby::Models::Prompt
        @client.request(req, opts)
      end
    end
  end
end
