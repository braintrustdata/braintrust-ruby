# frozen_string_literal: true

module Braintrust
  module Models
    class Prompt < Braintrust::BaseModel
      # @!attribute id
      #   Unique identifier for the prompt
      #
      #   @return [String]
      required :id, String

      # @!attribute _xact_id
      #   The transaction id of an event is unique to the network operation that processed
      #     the event insertion. Transaction ids are monotonically increasing over time and
      #     can be used to retrieve a versioned snapshot of the prompt (see the `version`
      #     parameter)
      #
      #   @return [String]
      required :_xact_id, String

      # @!attribute log_id
      #   A literal 'p' which identifies the object as a project prompt
      #
      #   @return [Symbol, Braintrust::Models::Prompt::LogID]
      required :log_id, enum: -> { Braintrust::Models::Prompt::LogID }

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
      #   @return [Symbol, Braintrust::Models::Prompt::FunctionType, nil]
      optional :function_type, enum: -> { Braintrust::Models::Prompt::FunctionType }, nil?: true

      # @!attribute metadata
      #   User-controlled metadata about the prompt
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata, Braintrust::HashOf[Braintrust::Unknown, nil?: true], nil?: true

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
      #   # @param id [String]
      #   # @param _xact_id [String]
      #   # @param log_id [Symbol, Braintrust::Models::Prompt::LogID]
      #   # @param name [String]
      #   # @param org_id [String]
      #   # @param project_id [String]
      #   # @param slug [String]
      #   # @param created [Time, nil]
      #   # @param description [String, nil]
      #   # @param function_type [Symbol, Braintrust::Models::Prompt::FunctionType, nil]
      #   # @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   # @param prompt_data [Braintrust::Models::PromptData, nil]
      #   # @param tags [Array<String>, nil]
      #   #
      #   def initialize(
      #     id:,
      #     _xact_id:,
      #     log_id:,
      #     name:,
      #     org_id:,
      #     project_id:,
      #     slug:,
      #     created: nil,
      #     description: nil,
      #     function_type: nil,
      #     metadata: nil,
      #     prompt_data: nil,
      #     tags: nil,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # A literal 'p' which identifies the object as a project prompt
      #
      # @see Braintrust::Models::Prompt#log_id
      module LogID
        extend Braintrust::Enum

        P = :p

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # @see Braintrust::Models::Prompt#function_type
      module FunctionType
        extend Braintrust::Enum

        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
