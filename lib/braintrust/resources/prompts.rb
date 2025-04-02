# frozen_string_literal: true

module Braintrust
  module Resources
    class Prompts
      # Create a new prompt. If there is an existing prompt in the project with the same
      #   slug as the one specified in the request, will return the existing prompt
      #   unmodified
      #
      # @overload create(name:, project_id:, slug:, description: nil, function_type: nil, prompt_data: nil, tags: nil, request_options: {})
      #
      # @param name [String]
      # @param project_id [String]
      # @param slug [String]
      # @param description [String, nil]
      # @param function_type [Symbol, Braintrust::Models::PromptCreateParams::FunctionType, nil]
      # @param prompt_data [Braintrust::Models::PromptData, nil]
      # @param tags [Array<String>, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload retrieve(prompt_id, request_options: {})
      #
      # @param prompt_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload update(prompt_id, description: nil, name: nil, prompt_data: nil, slug: nil, tags: nil, request_options: {})
      #
      # @param prompt_id [String]
      # @param description [String, nil]
      # @param name [String, nil]
      # @param prompt_data [Braintrust::Models::PromptData, nil]
      # @param slug [String, nil]
      # @param tags [Array<String>, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload list(ending_before: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, prompt_name: nil, slug: nil, starting_after: nil, version: nil, request_options: {})
      #
      # @param ending_before [String]
      # @param ids [String, Array<String>]
      # @param limit [Integer, nil]
      # @param org_name [String]
      # @param project_id [String]
      # @param project_name [String]
      # @param prompt_name [String]
      # @param slug [String]
      # @param starting_after [String]
      # @param version [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload delete(prompt_id, request_options: {})
      #
      # @param prompt_id [String]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
      # @overload replace(name:, project_id:, slug:, description: nil, function_type: nil, prompt_data: nil, tags: nil, request_options: {})
      #
      # @param name [String]
      # @param project_id [String]
      # @param slug [String]
      # @param description [String, nil]
      # @param function_type [Symbol, Braintrust::Models::PromptReplaceParams::FunctionType, nil]
      # @param prompt_data [Braintrust::Models::PromptData, nil]
      # @param tags [Array<String>, nil]
      # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}, nil]
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
