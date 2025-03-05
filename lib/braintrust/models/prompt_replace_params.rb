# frozen_string_literal: true

module Braintrust
  module Models
    class PromptReplaceParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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
      #   @return [Symbol, Braintrust::Models::PromptReplaceParams::FunctionType, nil]
      optional :function_type, enum: -> { Braintrust::Models::PromptReplaceParams::FunctionType }, nil?: true

      # @!attribute prompt_data
      #   The prompt, model, and its parameters
      #
      #   @return [Braintrust::Models::PromptData, nil]
      optional :prompt_data, -> { Braintrust::Models::PromptData }, nil?: true

      # @!attribute tags
      #   A list of tags for the prompt
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::ArrayOf[String], nil?: true

      # @!parse
      #   # @param name [String]
      #   # @param project_id [String]
      #   # @param slug [String]
      #   # @param description [String, nil]
      #   # @param function_type [Symbol, Braintrust::Models::PromptReplaceParams::FunctionType, nil]
      #   # @param prompt_data [Braintrust::Models::PromptData, nil]
      #   # @param tags [Array<String>, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     name:,
      #     project_id:,
      #     slug:,
      #     description: nil,
      #     function_type: nil,
      #     prompt_data: nil,
      #     tags: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # @example
      # ```ruby
      # case function_type
      # in :llm
      #   # ...
      # in :scorer
      #   # ...
      # in :task
      #   # ...
      # in :tool
      #   # ...
      # end
      # ```
      class FunctionType < Braintrust::Enum
        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end
    end
  end
end
