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
      #   @return [Braintrust::Models::Function::FunctionData::UnnamedTypeWithunionParent2, Braintrust::Models::Function::FunctionData::UnnamedTypeWithunionParent3, Braintrust::Models::Function::FunctionData::UnnamedTypeWithunionParent4]
      required :function_data, Braintrust::Unknown

      # @!attribute [rw] log_id
      #   A literal 'p' which identifies the object as a project prompt
      #   @return [Symbol, Braintrust::Models::Function::LogID]
      required :log_id, enum: -> { Braintrust::Models::Function::LogID }

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

      # @!attribute [rw] function_schema
      #   JSON schema for the function's parameters and return type
      #   @return [Braintrust::Models::Function::FunctionSchema]
      optional :function_schema, -> { Braintrust::Models::Function::FunctionSchema }

      # @!attribute [rw] function_type
      #   @return [Symbol, Braintrust::Models::Function::FunctionType]
      optional :function_type, enum: -> { Braintrust::Models::Function::FunctionType }

      # @!attribute [rw] metadata
      #   User-controlled metadata about the prompt
      #   @return [Hash]
      optional :metadata, Hash

      # @!attribute [rw] origin
      #   @return [Braintrust::Models::Function::Origin]
      optional :origin, -> { Braintrust::Models::Function::Origin }

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

      class FunctionSchema < BaseModel
        # @!attribute [rw] parameters
        #   @return [Object]
        optional :parameters, Braintrust::Unknown

        # @!attribute [rw] returns
        #   @return [Object]
        optional :returns, Braintrust::Unknown

        # @!parse
        #   # Create a new instance of FunctionSchema from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [Object, nil] :parameters
        #   #   @option data [Object, nil] :returns
        #   def initialize(data = {}) = super
      end

      class FunctionType < Braintrust::Enum
        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool
      end

      class Origin < BaseModel
        # @!attribute [rw] object_id_
        #   Id of the object the function is originating from
        #   @return [String]
        required :object_id_, String, api_name: :object_id

        # @!attribute [rw] object_type
        #   The object type that the ACL applies to
        #   @return [Symbol, Braintrust::Models::Function::Origin::ObjectType]
        required :object_type, enum: -> { Braintrust::Models::Function::Origin::ObjectType }

        # @!attribute [rw] internal
        #   The function exists for internal purposes and should not be displayed in the list of functions.
        #   @return [Boolean]
        optional :internal, Braintrust::BooleanModel

        # The object type that the ACL applies to
        class ObjectType < Braintrust::Enum
          ORGANIZATION = :organization
          PROJECT = :project
          EXPERIMENT = :experiment
          DATASET = :dataset
          PROMPT = :prompt
          PROMPT_SESSION = :prompt_session
          GROUP = :group
          ROLE = :role
          ORG_MEMBER = :org_member
          PROJECT_LOG = :project_log
          ORG_PROJECT = :org_project
        end

        # @!parse
        #   # Create a new instance of Origin from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :object_id Id of the object the function is originating from
        #   #   @option data [String] :object_type The object type that the ACL applies to
        #   #   @option data [Hash, nil] :internal The function exists for internal purposes and should not be displayed in the
        #   #     list of functions.
        #   def initialize(data = {}) = super
      end

      # @!parse
      #   # Create a new instance of Function from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the prompt
      #   #   @option data [String] :_xact_id The transaction id of an event is unique to the network operation that processed
      #   #     the event insertion. Transaction ids are monotonically increasing over time and
      #   #     can be used to retrieve a versioned snapshot of the prompt (see the `version`
      #   #     parameter)
      #   #   @option data [Object] :function_data
      #   #   @option data [String] :log_id A literal 'p' which identifies the object as a project prompt
      #   #   @option data [String] :name Name of the prompt
      #   #   @option data [String] :org_id Unique identifier for the organization
      #   #   @option data [String] :project_id Unique identifier for the project that the prompt belongs under
      #   #   @option data [String] :slug Unique identifier for the prompt
      #   #   @option data [String, nil] :created Date of prompt creation
      #   #   @option data [String, nil] :description Textual description of the prompt
      #   #   @option data [Object, nil] :function_schema JSON schema for the function's parameters and return type
      #   #   @option data [String, nil] :function_type
      #   #   @option data [Hash, nil] :metadata User-controlled metadata about the prompt
      #   #   @option data [Object, nil] :origin
      #   #   @option data [Object, nil] :prompt_data The prompt, model, and its parameters
      #   #   @option data [Array<String>, nil] :tags A list of tags for the prompt
      #   def initialize(data = {}) = super
    end
  end
end
