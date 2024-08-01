# frozen_string_literal: true

module Braintrust
  module Models
    class Prompt < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the prompt
      #   @return [String]
      required :id, String

      # @!attribute [rw] _xact_id
      #   The transaction id of an event is unique to the network operation that processed the event insertion. Transaction ids are monotonically increasing over time and can be used to retrieve a versioned snapshot of the prompt (see the `version` parameter)
      #   @return [String]
      required :_xact_id, String

      # @!attribute [rw] log_id
      #   A literal 'p' which identifies the object as a project prompt
      #   @return [Symbol]
      required :log_id, Braintrust::Enum.new(:'p')

      # @!attribute [rw] name_
      #   Name of the prompt
      #   @return [String]
      required :name_, String

      # @!attribute [rw] org_id
      #   Unique identifier for the organization
      #   @return [String]
      required :org_id, String

      # @!attribute [rw] project_id
      #   Unique identifier for the project that the prompt belongs under
      #   @return [String]
      required :project_id, String

      # @!attribute [rw] slug
      #   Unique identifier for the prompt
      #   @return [String]
      required :slug, String

      # @!attribute [rw] created
      #   Date of prompt creation
      #   @return [String]
      optional :created, String

      # @!attribute [rw] description
      #   Textual description of the prompt
      #   @return [String]
      optional :description, String

      # @!attribute [rw] metadata
      #   User-controlled metadata about the prompt
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] prompt_data
      #   The prompt, model, and its parameters
      #   @return [Braintrust::Models::Prompt::PromptData]
      optional :prompt_data, -> { Braintrust::Models::Prompt::PromptData }

      # @!attribute [rw] tags
      #   A list of tags for the prompt
      #   @return [Array<String>]
      optional :tags, Braintrust::ArrayOf.new(String)

      class PromptData < BaseModel
        # @!attribute [rw] options
        #   @return [Braintrust::Models::Prompt::PromptData::Options]
        optional :options, -> { Braintrust::Models::Prompt::PromptData::Options }

        # @!attribute [rw] origin
        #   @return [Braintrust::Models::Prompt::PromptData::Origin]
        optional :origin, -> { Braintrust::Models::Prompt::PromptData::Origin }

        # @!attribute [rw] prompt
        #   @return [Braintrust::Models::Prompt::PromptData::Prompt::UnnamedTypeWithunionParent5|Braintrust::Models::Prompt::PromptData::Prompt::UnnamedTypeWithunionParent6|Braintrust::Models::Prompt::PromptData::Prompt::UnnamedTypeWithunionParent7]
        optional :prompt, Braintrust::Unknown

        class Options < BaseModel
          # @!attribute [rw] model
          #   @return [String]
          optional :model, String

          # @!attribute [rw] params
          #   @return [Braintrust::Models::Prompt::PromptData::Options::Params::UnnamedTypeWithunionParent0|Braintrust::Models::Prompt::PromptData::Options::Params::UnnamedTypeWithunionParent1|Braintrust::Models::Prompt::PromptData::Options::Params::UnnamedTypeWithunionParent2|Braintrust::Models::Prompt::PromptData::Options::Params::UnnamedTypeWithunionParent3|Braintrust::Models::Prompt::PromptData::Options::Params::UnnamedTypeWithunionParent4]
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
end
