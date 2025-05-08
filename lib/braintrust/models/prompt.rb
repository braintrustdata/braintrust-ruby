# frozen_string_literal: true

module Braintrust
  module Models
    class Prompt < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the prompt
      #
      #   @return [String]
      required :id, String

      # @!attribute _xact_id
      #   The transaction id of an event is unique to the network operation that processed
      #   the event insertion. Transaction ids are monotonically increasing over time and
      #   can be used to retrieve a versioned snapshot of the prompt (see the `version`
      #   parameter)
      #
      #   @return [String]
      required :_xact_id, String

      # @!attribute log_id
      #   A literal 'p' which identifies the object as a project prompt
      #
      #   @return [Symbol, Braintrust::Prompt::LogID]
      required :log_id, enum: -> { Braintrust::Prompt::LogID }

      # @!attribute name
      #   Name of the prompt
      #
      #   @return [String]
      required :name, String

      # @!attribute org_id
      #   Unique identifier for the organization
      #
      #   @return [String]
      required :org_id, String

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

      # @!attribute created
      #   Date of prompt creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute description
      #   Textual description of the prompt
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute function_type
      #
      #   @return [Symbol, Braintrust::Prompt::FunctionType, nil]
      optional :function_type, enum: -> { Braintrust::Prompt::FunctionType }, nil?: true

      # @!attribute metadata
      #   User-controlled metadata about the prompt
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute prompt_data
      #   The prompt, model, and its parameters
      #
      #   @return [Braintrust::PromptData, nil]
      optional :prompt_data, -> { Braintrust::PromptData }, nil?: true

      # @!attribute tags
      #   A list of tags for the prompt
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(id:, _xact_id:, log_id:, name:, org_id:, project_id:, slug:, created: nil, description: nil, function_type: nil, metadata: nil, prompt_data: nil, tags: nil)
      #   Some parameter documentations has been truncated, see {Braintrust::Prompt} for
      #   more details.
      #
      #   @param id [String] Unique identifier for the prompt
      #
      #   @param _xact_id [String] The transaction id of an event is unique to the network operation that processed
      #
      #   @param log_id [Symbol, Braintrust::Prompt::LogID] A literal 'p' which identifies the object as a project prompt
      #
      #   @param name [String] Name of the prompt
      #
      #   @param org_id [String] Unique identifier for the organization
      #
      #   @param project_id [String] Unique identifier for the project that the prompt belongs under
      #
      #   @param slug [String] Unique identifier for the prompt
      #
      #   @param created [Time, nil] Date of prompt creation
      #
      #   @param description [String, nil] Textual description of the prompt
      #
      #   @param function_type [Symbol, Braintrust::Prompt::FunctionType, nil]
      #
      #   @param metadata [Hash{Symbol=>Object, nil}, nil] User-controlled metadata about the prompt
      #
      #   @param prompt_data [Braintrust::PromptData, nil] The prompt, model, and its parameters
      #
      #   @param tags [Array<String>, nil] A list of tags for the prompt

      # A literal 'p' which identifies the object as a project prompt
      #
      # @see Braintrust::Prompt#log_id
      module LogID
        extend Braintrust::Internal::Type::Enum

        P = :p

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Braintrust::Prompt#function_type
      module FunctionType
        extend Braintrust::Internal::Type::Enum

        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
