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

      # @!attribute [rw] prompt
      #   @return [Braintrust::Models::PromptData::Prompt::UnnamedTypeWithunionParent5|Braintrust::Models::PromptData::Prompt::UnnamedTypeWithunionParent6|Braintrust::Models::PromptData::Prompt::UnnamedTypeWithunionParent7]
      optional :prompt, Braintrust::Unknown

      class Options < BaseModel
        # @!attribute [rw] model
        #   @return [String]
        optional :model, String

        # @!attribute [rw] params
        #   @return [Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent0|Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent1|Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent2|Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent3|Braintrust::Models::PromptData::Options::Params::UnnamedTypeWithunionParent4]
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
    end
  end
end
