# frozen_string_literal: true

module Braintrust
  module Models
    class PromptData < BaseModel
      # @!attribute [rw] options
      #   @return [Braintrust::Models::PromptData::Options]
      optional :options, -> { Braintrust::Models::PromptData::Options }

      # @!attribute [rw] origin
      #   @return [Braintrust::Models::PromptData::Origin]
      optional :origin, -> { Braintrust::Models::PromptData::Origin }

      # @!attribute [rw] parser
      #   @return [Braintrust::Models::PromptData::Parser]
      optional :parser, -> { Braintrust::Models::PromptData::Parser }

      # @!attribute [rw] prompt
      #   @return [Braintrust::Models::PromptData::Prompt::UnnamedTypeWithunionParent12|Braintrust::Models::PromptData::Prompt::UnnamedTypeWithunionParent13|Braintrust::Models::PromptData::Prompt::UnnamedTypeWithunionParent14]
      optional :prompt, Braintrust::Unknown

      # @!attribute [rw] tool_functions
      #   @return [Array<Braintrust::Models::PromptData::ToolFunction::UnnamedTypeWithunionParent15|Braintrust::Models::PromptData::ToolFunction::UnnamedTypeWithunionParent16>]
      optional :tool_functions, Braintrust::ArrayOf.new(Braintrust::Unknown)

      class Options < BaseModel
        # @!attribute [rw] model
        #   @return [String]
        optional :model, String

        # @!attribute [rw] params
        #   @return [Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent10|Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent11|Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent7|Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent8|Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent9]
        optional :params, Braintrust::Unknown

        # @!attribute [rw] position
        #   @return [String]
        optional :position, String
      end

      class Origin < BaseModel
        # @!attribute [rw] project_id
        #   @return [String]
        optional :project_id, String

        # @!attribute [rw] prompt_id
        #   @return [String]
        optional :prompt_id, String

        # @!attribute [rw] prompt_version
        #   @return [String]
        optional :prompt_version, String
      end

      class Parser < BaseModel
        # @!attribute [rw] choice_scores
        #   @return [Hash]
        required :choice_scores, Hash

        # @!attribute [rw] type
        #   One of the constants defined in {Braintrust::Models::PromptData::Parser::Type}
        #   @return [Symbol]
        required :type, enum: -> { Braintrust::Models::PromptData::Parser::Type }

        # @!attribute [rw] use_cot
        #   @return [Boolean]
        required :use_cot, Braintrust::BooleanModel

        class Type < Braintrust::Enum
          LLM_CLASSIFIER = :llm_classifier
        end
      end
    end
  end
end
