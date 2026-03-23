# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Prompts#update
    class PromptUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute description
      #   Textual description of the prompt
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute name
      #   Name of the prompt
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute prompt_data
      #   The prompt, model, and its parameters
      #
      #   @return [Braintrust::Models::PromptData, nil]
      optional :prompt_data, -> { Braintrust::PromptData }, nil?: true

      # @!attribute slug
      #   Unique identifier for the prompt
      #
      #   @return [String, nil]
      optional :slug, String, nil?: true

      # @!attribute tags
      #   A list of tags for the prompt
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(description: nil, name: nil, prompt_data: nil, slug: nil, tags: nil, request_options: {})
      #   @param description [String, nil] Textual description of the prompt
      #
      #   @param name [String, nil] Name of the prompt
      #
      #   @param prompt_data [Braintrust::Models::PromptData, nil] The prompt, model, and its parameters
      #
      #   @param slug [String, nil] Unique identifier for the prompt
      #
      #   @param tags [Array<String>, nil] A list of tags for the prompt
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
