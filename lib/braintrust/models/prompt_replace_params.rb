# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Prompts#replace
    class PromptReplaceParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the prompt
      #
      #   @return [String]
      required :name, String

      # @!attribute project_id
      #   Unique identifier for the project that the prompt belongs under
      #
      #   @return [String]
      required :project_id, String

      # @!attribute slug
      #   Unique identifier for the prompt
      #
      #   @return [String]
      required :slug, String

      # @!attribute description
      #   Textual description of the prompt
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute function_type
      #
      #   @return [Symbol, Braintrust::PromptReplaceParams::FunctionType, nil]
      optional :function_type, enum: -> { Braintrust::PromptReplaceParams::FunctionType }, nil?: true

      # @!attribute prompt_data
      #   The prompt, model, and its parameters
      #
      #   @return [Braintrust::PromptData, nil]
      optional :prompt_data, -> { Braintrust::PromptData }, nil?: true

      # @!attribute tags
      #   A list of tags for the prompt
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(name:, project_id:, slug:, description: nil, function_type: nil, prompt_data: nil, tags: nil, request_options: {})
      #   @param name [String] Name of the prompt
      #
      #   @param project_id [String] Unique identifier for the project that the prompt belongs under
      #
      #   @param slug [String] Unique identifier for the prompt
      #
      #   @param description [String, nil] Textual description of the prompt
      #
      #   @param function_type [Symbol, Braintrust::PromptReplaceParams::FunctionType, nil]
      #
      #   @param prompt_data [Braintrust::PromptData, nil] The prompt, model, and its parameters
      #
      #   @param tags [Array<String>, nil] A list of tags for the prompt
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      module FunctionType
        extend Braintrust::Internal::Type::Enum

        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
