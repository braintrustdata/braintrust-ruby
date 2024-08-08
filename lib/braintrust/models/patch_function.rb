# frozen_string_literal: true

module Braintrust
  module Models
    class PatchFunction < BaseModel
      # @!attribute [rw] description
      #   Textual description of the prompt
      #   @return [String]
      optional :description, String

      # @!attribute [rw] function_data
      #   @return [Braintrust::Models::PatchFunction::FunctionData::UnnamedTypeWithunionParent10|Braintrust::Models::PatchFunction::FunctionData::UnnamedTypeWithunionParent7|Braintrust::Models::PatchFunction::FunctionData::UnnamedTypeWithunionParent8|Braintrust::Models::PatchFunction::FunctionData::UnnamedTypeWithunionParent9]
      optional :function_data, Braintrust::Unknown

      # @!attribute [rw] name_
      #   Name of the prompt
      #   @return [String]
      optional :name_, String

      # @!attribute [rw] prompt_data
      #   The prompt, model, and its parameters
      #   @return [Braintrust::Models::PromptData]
      optional :prompt_data, -> { Braintrust::Models::PromptData }

      # @!attribute [rw] tags
      #   A list of tags for the prompt
      #   @return [Array<String>]
      optional :tags, Braintrust::ArrayOf.new(String)
    end
  end
end
