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
      #   @return [Braintrust::Models::PromptData::Prompt::UnnamedTypeWithunionParent13, Braintrust::Models::PromptData::Prompt::UnnamedTypeWithunionParent14, Braintrust::Models::PromptData::Prompt::UnnamedTypeWithunionParent15]
      optional :prompt, Braintrust::Unknown

      # @!attribute [rw] tool_functions
      #   @return [Array<Braintrust::Models::PromptData::ToolFunction::UnnamedTypeWithunionParent16, Braintrust::Models::PromptData::ToolFunction::UnnamedTypeWithunionParent17>]
      optional :tool_functions, Braintrust::ArrayOf.new(Braintrust::Unknown)

      class Options < BaseModel
        # @!attribute [rw] model
        #   @return [String]
        optional :model, String

        # @!attribute [rw] params
        #   @return [Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent10, Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent11, Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent12, Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent8, Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent9]
        optional :params, Braintrust::Unknown

        # @!attribute [rw] position
        #   @return [String]
        optional :position, String

        # @!parse
        #   # Create a new instance of Options from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String, nil] :model
        #   #   @option data [Object, nil] :params
        #   #   @option data [String, nil] :position
        #   def initialize(data = {}) = super
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

        # @!parse
        #   # Create a new instance of Origin from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String, nil] :project_id
        #   #   @option data [String, nil] :prompt_id
        #   #   @option data [String, nil] :prompt_version
        #   def initialize(data = {}) = super
      end

      class Parser < BaseModel
        # @!attribute [rw] choice_scores
        #   @return [Hash]
        required :choice_scores, Hash

        # @!attribute [rw] type
        #   @return [Symbol, Braintrust::Models::PromptData::Parser::Type]
        required :type, enum: -> { Braintrust::Models::PromptData::Parser::Type }

        # @!attribute [rw] use_cot
        #   @return [Boolean]
        required :use_cot, Braintrust::BooleanModel

        class Type < Braintrust::Enum
          LLM_CLASSIFIER = :llm_classifier
        end

        # @!parse
        #   # Create a new instance of Parser from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [Hash] :choice_scores
        #   #   @option data [String] :type
        #   #   @option data [Hash] :use_cot
        #   def initialize(data = {}) = super
      end

      # @!parse
      #   # Create a new instance of PromptData from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Object, nil] :options
      #   #   @option data [Object, nil] :origin
      #   #   @option data [Object, nil] :parser
      #   #   @option data [Object, nil] :prompt
      #   #   @option data [Array<Object>, nil] :tool_functions
      #   def initialize(data = {}) = super
    end
  end
end
