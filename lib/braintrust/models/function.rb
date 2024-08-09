# frozen_string_literal: true

module Braintrust
  module Models
    class Function < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the prompt
      #   @return [String]
      required :id, String

      # @!attribute [rw] _xact_id
      #   The transaction id of an event is unique to the network operation that processed the event insertion. Transaction ids are monotonically increasing over time and can be used to retrieve a versioned snapshot of the prompt (see the `version` parameter)
      #   @return [String]
      required :_xact_id, String

      # @!attribute [rw] function_data
      #   @return [Braintrust::Models::Function::FunctionData::UnnamedTypeWithunionParent0|Braintrust::Models::Function::FunctionData::UnnamedTypeWithunionParent1|Braintrust::Models::Function::FunctionData::UnnamedTypeWithunionParent2]
      required :function_data, Braintrust::Unknown

      # @!attribute [rw] log_id
      #   A literal 'p' which identifies the object as a project prompt
      #   @return [Symbol]
      required :log_id, Braintrust::Enum.new(:p)

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
      #   @return [Braintrust::Models::PromptData]
      optional :prompt_data, -> { Braintrust::Models::PromptData }

      # @!attribute [rw] tags
      #   A list of tags for the prompt
      #   @return [Array<String>]
      optional :tags, Braintrust::ArrayOf.new(String)
    end
  end
end
