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
      #   @return [Symbol, Braintrust::Models::Prompt::LogID]
      required :log_id, enum: -> { Braintrust::Models::Prompt::LogID }

      # @!attribute [rw] name_
      #   Name of the prompt
      #   @return [String]
      required :name_, String, api_name: :name

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
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] description
      #   Textual description of the prompt
      #   @return [String]
      optional :description, String

      # @!attribute [rw] function_type
      #   @return [Symbol, Braintrust::Models::Prompt::FunctionType]
      optional :function_type, enum: -> { Braintrust::Models::Prompt::FunctionType }

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

      # A literal 'p' which identifies the object as a project prompt
      class LogID < Braintrust::Enum
        P = :p
      end

      class FunctionType < Braintrust::Enum
        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool
      end

      # @!parse
      #   # Create a new instance of Prompt from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the prompt
      #   #   @option data [String] :_xact_id The transaction id of an event is unique to the network operation that processed
      #   #     the event insertion. Transaction ids are monotonically increasing over time and
      #   #     can be used to retrieve a versioned snapshot of the prompt (see the `version`
      #   #     parameter)
      #   #   @option data [String] :log_id A literal 'p' which identifies the object as a project prompt
      #   #   @option data [String] :name Name of the prompt
      #   #   @option data [String] :org_id Unique identifier for the organization
      #   #   @option data [String] :project_id Unique identifier for the project that the prompt belongs under
      #   #   @option data [String] :slug Unique identifier for the prompt
      #   #   @option data [String, nil] :created Date of prompt creation
      #   #   @option data [String, nil] :description Textual description of the prompt
      #   #   @option data [String, nil] :function_type
      #   #   @option data [Hash, nil] :metadata User-controlled metadata about the prompt
      #   #   @option data [Object, nil] :prompt_data The prompt, model, and its parameters
      #   #   @option data [Array<String>, nil] :tags A list of tags for the prompt
      #   def initialize(data = {}) = super
    end
  end
end
