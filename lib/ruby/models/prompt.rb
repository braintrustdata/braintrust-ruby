# frozen_string_literal: true

module Ruby
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
      required :log_id, Ruby::Enum.new(:'p')

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
      #   @return [Ruby::Models::Prompt::PromptData]
      optional :prompt_data, -> { Ruby::Models::Prompt::PromptData }

      # @!attribute [rw] tags
      #   A list of tags for the prompt
      #   @return [Array<String>]
      optional :tags, Ruby::ArrayOf.new(String)

      class PromptData < BaseModel
        # @!attribute [rw] options
        #   @return [Ruby::Models::Prompt::PromptData::Options]
        optional :options, -> { Ruby::Models::Prompt::PromptData::Options }

        # @!attribute [rw] origin
        #   @return [Ruby::Models::Prompt::PromptData::Origin]
        optional :origin, -> { Ruby::Models::Prompt::PromptData::Origin }

        # @!attribute [rw] prompt
        #   @return [Ruby::Models::Prompt::PromptData::Prompt::UnnamedTypeWithunionParent4|Ruby::Models::Prompt::PromptData::Prompt::UnnamedTypeWithunionParent5|Ruby::Models::Prompt::PromptData::Prompt::UnnamedTypeWithunionParent6]
        optional :prompt, Ruby::Unknown

        class Options < BaseModel
          # @!attribute [rw] model
          #   @return [String]
          optional :model, String

          # @!attribute [rw] params
          #   @return [Ruby::Models::Prompt::PromptData::Options::Params::UnnamedTypeWithunionParent0|Ruby::Models::Prompt::PromptData::Options::Params::UnnamedTypeWithunionParent1|Ruby::Models::Prompt::PromptData::Options::Params::UnnamedTypeWithunionParent2|Ruby::Models::Prompt::PromptData::Options::Params::UnnamedTypeWithunionParent3]
          optional :params, Ruby::Unknown

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
