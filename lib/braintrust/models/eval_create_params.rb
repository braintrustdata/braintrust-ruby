# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Evals#create
    class EvalCreateParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute data
      #   The dataset to use
      #
      #   @return [Braintrust::Models::EvalCreateParams::Data::DatasetID, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName, Braintrust::Models::EvalCreateParams::Data::DatasetRows]
      required :data, union: -> { Braintrust::Models::EvalCreateParams::Data }

      # @!attribute project_id
      #   Unique identifier for the project to run the eval in
      #
      #   @return [String]
      required :project_id, String

      # @!attribute scores
      #   The functions to score the eval on
      #
      #   @return [Array<Braintrust::Models::EvalCreateParams::Score::FunctionID, Braintrust::Models::EvalCreateParams::Score::ProjectSlug, Braintrust::Models::EvalCreateParams::Score::GlobalFunction, Braintrust::Models::EvalCreateParams::Score::PromptSessionID, Braintrust::Models::EvalCreateParams::Score::InlineCode, Braintrust::Models::EvalCreateParams::Score::InlinePrompt>]
      required :scores,
               -> { Braintrust::Internal::Type::ArrayOf[union: Braintrust::Models::EvalCreateParams::Score] }

      # @!attribute task
      #   The function to evaluate
      #
      #   @return [Braintrust::Models::EvalCreateParams::Task::FunctionID, Braintrust::Models::EvalCreateParams::Task::ProjectSlug, Braintrust::Models::EvalCreateParams::Task::GlobalFunction, Braintrust::Models::EvalCreateParams::Task::PromptSessionID, Braintrust::Models::EvalCreateParams::Task::InlineCode, Braintrust::Models::EvalCreateParams::Task::InlinePrompt]
      required :task, union: -> { Braintrust::Models::EvalCreateParams::Task }

      # @!attribute base_experiment_id
      #   An optional experiment id to use as a base. If specified, the new experiment
      #     will be summarized and compared to this experiment.
      #
      #   @return [String, nil]
      optional :base_experiment_id, String, nil?: true

      # @!attribute base_experiment_name
      #   An optional experiment name to use as a base. If specified, the new experiment
      #     will be summarized and compared to this experiment.
      #
      #   @return [String, nil]
      optional :base_experiment_name, String, nil?: true

      # @!attribute [r] experiment_name
      #   An optional name for the experiment created by this eval. If it conflicts with
      #     an existing experiment, it will be suffixed with a unique identifier.
      #
      #   @return [String, nil]
      optional :experiment_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :experiment_name

      # @!attribute git_metadata_settings
      #   Optional settings for collecting git metadata. By default, will collect all git
      #     metadata fields allowed in org-level settings.
      #
      #   @return [Braintrust::Models::EvalCreateParams::GitMetadataSettings, nil]
      optional :git_metadata_settings,
               -> { Braintrust::Models::EvalCreateParams::GitMetadataSettings },
               nil?: true

      # @!attribute is_public
      #   Whether the experiment should be public. Defaults to false.
      #
      #   @return [Boolean, nil]
      optional :is_public, Braintrust::Internal::Type::BooleanModel, nil?: true

      # @!attribute max_concurrency
      #   The maximum number of tasks/scorers that will be run concurrently. Defaults to
      #     undefined, in which case there is no max concurrency.
      #
      #   @return [Float, nil]
      optional :max_concurrency, Float, nil?: true

      # @!attribute [r] metadata
      #   Optional experiment-level metadata to store about the evaluation. You can later
      #     use this to slice & dice across experiments.
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata, Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true]

      # @!parse
      #   # @return [Hash{Symbol=>Object, nil}]
      #   attr_writer :metadata

      # @!attribute [r] parent
      #   Options for tracing the evaluation
      #
      #   @return [Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String, nil]
      optional :parent, union: -> { Braintrust::Models::EvalCreateParams::Parent }

      # @!parse
      #   # @return [Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String]
      #   attr_writer :parent

      # @!attribute repo_info
      #   Metadata about the state of the repo when the experiment was created
      #
      #   @return [Braintrust::Models::RepoInfo, nil]
      optional :repo_info, -> { Braintrust::Models::RepoInfo }, nil?: true

      # @!attribute [r] stream
      #   Whether to stream the results of the eval. If true, the request will return two
      #     events: one to indicate the experiment has started, and another upon completion.
      #     If false, the request will return the evaluation's summary upon completion.
      #
      #   @return [Boolean, nil]
      optional :stream, Braintrust::Internal::Type::BooleanModel

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :stream

      # @!attribute timeout
      #   The maximum duration, in milliseconds, to run the evaluation. Defaults to
      #     undefined, in which case there is no timeout.
      #
      #   @return [Float, nil]
      optional :timeout, Float, nil?: true

      # @!attribute trial_count
      #   The number of times to run the evaluator per input. This is useful for
      #     evaluating applications that have non-deterministic behavior and gives you both
      #     a stronger aggregate measure and a sense of the variance in the results.
      #
      #   @return [Float, nil]
      optional :trial_count, Float, nil?: true

      # @!parse
      #   # @param data [Braintrust::Models::EvalCreateParams::Data::DatasetID, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName, Braintrust::Models::EvalCreateParams::Data::DatasetRows]
      #   # @param project_id [String]
      #   # @param scores [Array<Braintrust::Models::EvalCreateParams::Score::FunctionID, Braintrust::Models::EvalCreateParams::Score::ProjectSlug, Braintrust::Models::EvalCreateParams::Score::GlobalFunction, Braintrust::Models::EvalCreateParams::Score::PromptSessionID, Braintrust::Models::EvalCreateParams::Score::InlineCode, Braintrust::Models::EvalCreateParams::Score::InlinePrompt>]
      #   # @param task [Braintrust::Models::EvalCreateParams::Task::FunctionID, Braintrust::Models::EvalCreateParams::Task::ProjectSlug, Braintrust::Models::EvalCreateParams::Task::GlobalFunction, Braintrust::Models::EvalCreateParams::Task::PromptSessionID, Braintrust::Models::EvalCreateParams::Task::InlineCode, Braintrust::Models::EvalCreateParams::Task::InlinePrompt]
      #   # @param base_experiment_id [String, nil]
      #   # @param base_experiment_name [String, nil]
      #   # @param experiment_name [String]
      #   # @param git_metadata_settings [Braintrust::Models::EvalCreateParams::GitMetadataSettings, nil]
      #   # @param is_public [Boolean, nil]
      #   # @param max_concurrency [Float, nil]
      #   # @param metadata [Hash{Symbol=>Object, nil}]
      #   # @param parent [Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String]
      #   # @param repo_info [Braintrust::Models::RepoInfo, nil]
      #   # @param stream [Boolean]
      #   # @param timeout [Float, nil]
      #   # @param trial_count [Float, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     data:,
      #     project_id:,
      #     scores:,
      #     task:,
      #     base_experiment_id: nil,
      #     base_experiment_name: nil,
      #     experiment_name: nil,
      #     git_metadata_settings: nil,
      #     is_public: nil,
      #     max_concurrency: nil,
      #     metadata: nil,
      #     parent: nil,
      #     repo_info: nil,
      #     stream: nil,
      #     timeout: nil,
      #     trial_count: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      # The dataset to use
      module Data
        extend Braintrust::Internal::Type::Union

        # Dataset id
        variant -> { Braintrust::Models::EvalCreateParams::Data::DatasetID }

        # Project and dataset name
        variant -> { Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName }

        # Dataset rows
        variant -> { Braintrust::Models::EvalCreateParams::Data::DatasetRows }

        class DatasetID < Braintrust::Internal::Type::BaseModel
          # @!attribute dataset_id
          #
          #   @return [String]
          required :dataset_id, String

          # @!attribute _internal_btql
          #
          #   @return [Hash{Symbol=>Object, nil}, nil]
          optional :_internal_btql,
                   Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
                   nil?: true

          # @!parse
          #   # Dataset id
          #   #
          #   # @param dataset_id [String]
          #   # @param _internal_btql [Hash{Symbol=>Object, nil}, nil]
          #   #
          #   def initialize(dataset_id:, _internal_btql: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class ProjectDatasetName < Braintrust::Internal::Type::BaseModel
          # @!attribute dataset_name
          #
          #   @return [String]
          required :dataset_name, String

          # @!attribute project_name
          #
          #   @return [String]
          required :project_name, String

          # @!attribute _internal_btql
          #
          #   @return [Hash{Symbol=>Object, nil}, nil]
          optional :_internal_btql,
                   Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
                   nil?: true

          # @!parse
          #   # Project and dataset name
          #   #
          #   # @param dataset_name [String]
          #   # @param project_name [String]
          #   # @param _internal_btql [Hash{Symbol=>Object, nil}, nil]
          #   #
          #   def initialize(dataset_name:, project_name:, _internal_btql: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class DatasetRows < Braintrust::Internal::Type::BaseModel
          # @!attribute data
          #
          #   @return [Array<Object, nil>]
          required :data, Braintrust::Internal::Type::ArrayOf[Braintrust::Internal::Type::Unknown, nil?: true]

          # @!parse
          #   # Dataset rows
          #   #
          #   # @param data [Array<Object, nil>]
          #   #
          #   def initialize(data:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        # @!parse
        #   # @return [Array(Braintrust::Models::EvalCreateParams::Data::DatasetID, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName, Braintrust::Models::EvalCreateParams::Data::DatasetRows)]
        #   def self.variants; end
      end

      # The function to evaluate
      module Score
        extend Braintrust::Internal::Type::Union

        # Function id
        variant -> { Braintrust::Models::EvalCreateParams::Score::FunctionID }

        # Project name and slug
        variant -> { Braintrust::Models::EvalCreateParams::Score::ProjectSlug }

        # Global function name
        variant -> { Braintrust::Models::EvalCreateParams::Score::GlobalFunction }

        # Prompt session id
        variant -> { Braintrust::Models::EvalCreateParams::Score::PromptSessionID }

        # Inline code function
        variant -> { Braintrust::Models::EvalCreateParams::Score::InlineCode }

        # Inline prompt definition
        variant -> { Braintrust::Models::EvalCreateParams::Score::InlinePrompt }

        class FunctionID < Braintrust::Internal::Type::BaseModel
          # @!attribute function_id
          #   The ID of the function
          #
          #   @return [String]
          required :function_id, String

          # @!attribute [r] version
          #   The version of the function
          #
          #   @return [String, nil]
          optional :version, String

          # @!parse
          #   # @return [String]
          #   attr_writer :version

          # @!parse
          #   # Function id
          #   #
          #   # @param function_id [String]
          #   # @param version [String]
          #   #
          #   def initialize(function_id:, version: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class ProjectSlug < Braintrust::Internal::Type::BaseModel
          # @!attribute project_name
          #   The name of the project containing the function
          #
          #   @return [String]
          required :project_name, String

          # @!attribute slug
          #   The slug of the function
          #
          #   @return [String]
          required :slug, String

          # @!attribute [r] version
          #   The version of the function
          #
          #   @return [String, nil]
          optional :version, String

          # @!parse
          #   # @return [String]
          #   attr_writer :version

          # @!parse
          #   # Project name and slug
          #   #
          #   # @param project_name [String]
          #   # @param slug [String]
          #   # @param version [String]
          #   #
          #   def initialize(project_name:, slug:, version: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class GlobalFunction < Braintrust::Internal::Type::BaseModel
          # @!attribute global_function
          #   The name of the global function. Currently, the global namespace includes the
          #     functions in autoevals
          #
          #   @return [String]
          required :global_function, String

          # @!parse
          #   # Global function name
          #   #
          #   # @param global_function [String]
          #   #
          #   def initialize(global_function:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class PromptSessionID < Braintrust::Internal::Type::BaseModel
          # @!attribute prompt_session_function_id
          #   The ID of the function in the prompt session
          #
          #   @return [String]
          required :prompt_session_function_id, String

          # @!attribute prompt_session_id
          #   The ID of the prompt session
          #
          #   @return [String]
          required :prompt_session_id, String

          # @!attribute [r] version
          #   The version of the function
          #
          #   @return [String, nil]
          optional :version, String

          # @!parse
          #   # @return [String]
          #   attr_writer :version

          # @!parse
          #   # Prompt session id
          #   #
          #   # @param prompt_session_function_id [String]
          #   # @param prompt_session_id [String]
          #   # @param version [String]
          #   #
          #   def initialize(prompt_session_function_id:, prompt_session_id:, version: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class InlineCode < Braintrust::Internal::Type::BaseModel
          # @!attribute code
          #   The inline code to execute
          #
          #   @return [String]
          required :code, String

          # @!attribute inline_context
          #
          #   @return [Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext]
          required :inline_context, -> { Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext }

          # @!attribute name
          #   The name of the inline code function
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!parse
          #   # Inline code function
          #   #
          #   # @param code [String]
          #   # @param inline_context [Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext]
          #   # @param name [String, nil]
          #   #
          #   def initialize(code:, inline_context:, name: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::EvalCreateParams::Score::InlineCode#inline_context
          class InlineContext < Braintrust::Internal::Type::BaseModel
            # @!attribute runtime
            #
            #   @return [Symbol, Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime]
            required :runtime,
                     enum: -> { Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime }

            # @!attribute version
            #
            #   @return [String]
            required :version, String

            # @!parse
            #   # @param runtime [Symbol, Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime]
            #   # @param version [String]
            #   #
            #   def initialize(runtime:, version:, **) = super

            # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

            # @see Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext#runtime
            module Runtime
              extend Braintrust::Internal::Type::Enum

              NODE = :node
              PYTHON = :python

              finalize!

              # @!parse
              #   # @return [Array<Symbol>]
              #   def self.values; end
            end
          end
        end

        class InlinePrompt < Braintrust::Internal::Type::BaseModel
          # @!attribute inline_prompt
          #   The prompt, model, and its parameters
          #
          #   @return [Braintrust::Models::PromptData, nil]
          required :inline_prompt, -> { Braintrust::Models::PromptData }, nil?: true

          # @!attribute name
          #   The name of the inline prompt
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!parse
          #   # Inline prompt definition
          #   #
          #   # @param inline_prompt [Braintrust::Models::PromptData, nil]
          #   # @param name [String, nil]
          #   #
          #   def initialize(inline_prompt:, name: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        # @!parse
        #   # @return [Array(Braintrust::Models::EvalCreateParams::Score::FunctionID, Braintrust::Models::EvalCreateParams::Score::ProjectSlug, Braintrust::Models::EvalCreateParams::Score::GlobalFunction, Braintrust::Models::EvalCreateParams::Score::PromptSessionID, Braintrust::Models::EvalCreateParams::Score::InlineCode, Braintrust::Models::EvalCreateParams::Score::InlinePrompt)]
        #   def self.variants; end
      end

      # The function to evaluate
      module Task
        extend Braintrust::Internal::Type::Union

        # Function id
        variant -> { Braintrust::Models::EvalCreateParams::Task::FunctionID }

        # Project name and slug
        variant -> { Braintrust::Models::EvalCreateParams::Task::ProjectSlug }

        # Global function name
        variant -> { Braintrust::Models::EvalCreateParams::Task::GlobalFunction }

        # Prompt session id
        variant -> { Braintrust::Models::EvalCreateParams::Task::PromptSessionID }

        # Inline code function
        variant -> { Braintrust::Models::EvalCreateParams::Task::InlineCode }

        # Inline prompt definition
        variant -> { Braintrust::Models::EvalCreateParams::Task::InlinePrompt }

        class FunctionID < Braintrust::Internal::Type::BaseModel
          # @!attribute function_id
          #   The ID of the function
          #
          #   @return [String]
          required :function_id, String

          # @!attribute [r] version
          #   The version of the function
          #
          #   @return [String, nil]
          optional :version, String

          # @!parse
          #   # @return [String]
          #   attr_writer :version

          # @!parse
          #   # Function id
          #   #
          #   # @param function_id [String]
          #   # @param version [String]
          #   #
          #   def initialize(function_id:, version: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class ProjectSlug < Braintrust::Internal::Type::BaseModel
          # @!attribute project_name
          #   The name of the project containing the function
          #
          #   @return [String]
          required :project_name, String

          # @!attribute slug
          #   The slug of the function
          #
          #   @return [String]
          required :slug, String

          # @!attribute [r] version
          #   The version of the function
          #
          #   @return [String, nil]
          optional :version, String

          # @!parse
          #   # @return [String]
          #   attr_writer :version

          # @!parse
          #   # Project name and slug
          #   #
          #   # @param project_name [String]
          #   # @param slug [String]
          #   # @param version [String]
          #   #
          #   def initialize(project_name:, slug:, version: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class GlobalFunction < Braintrust::Internal::Type::BaseModel
          # @!attribute global_function
          #   The name of the global function. Currently, the global namespace includes the
          #     functions in autoevals
          #
          #   @return [String]
          required :global_function, String

          # @!parse
          #   # Global function name
          #   #
          #   # @param global_function [String]
          #   #
          #   def initialize(global_function:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class PromptSessionID < Braintrust::Internal::Type::BaseModel
          # @!attribute prompt_session_function_id
          #   The ID of the function in the prompt session
          #
          #   @return [String]
          required :prompt_session_function_id, String

          # @!attribute prompt_session_id
          #   The ID of the prompt session
          #
          #   @return [String]
          required :prompt_session_id, String

          # @!attribute [r] version
          #   The version of the function
          #
          #   @return [String, nil]
          optional :version, String

          # @!parse
          #   # @return [String]
          #   attr_writer :version

          # @!parse
          #   # Prompt session id
          #   #
          #   # @param prompt_session_function_id [String]
          #   # @param prompt_session_id [String]
          #   # @param version [String]
          #   #
          #   def initialize(prompt_session_function_id:, prompt_session_id:, version: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        class InlineCode < Braintrust::Internal::Type::BaseModel
          # @!attribute code
          #   The inline code to execute
          #
          #   @return [String]
          required :code, String

          # @!attribute inline_context
          #
          #   @return [Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext]
          required :inline_context, -> { Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext }

          # @!attribute name
          #   The name of the inline code function
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!parse
          #   # Inline code function
          #   #
          #   # @param code [String]
          #   # @param inline_context [Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext]
          #   # @param name [String, nil]
          #   #
          #   def initialize(code:, inline_context:, name: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::EvalCreateParams::Task::InlineCode#inline_context
          class InlineContext < Braintrust::Internal::Type::BaseModel
            # @!attribute runtime
            #
            #   @return [Symbol, Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime]
            required :runtime,
                     enum: -> { Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime }

            # @!attribute version
            #
            #   @return [String]
            required :version, String

            # @!parse
            #   # @param runtime [Symbol, Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime]
            #   # @param version [String]
            #   #
            #   def initialize(runtime:, version:, **) = super

            # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

            # @see Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext#runtime
            module Runtime
              extend Braintrust::Internal::Type::Enum

              NODE = :node
              PYTHON = :python

              finalize!

              # @!parse
              #   # @return [Array<Symbol>]
              #   def self.values; end
            end
          end
        end

        class InlinePrompt < Braintrust::Internal::Type::BaseModel
          # @!attribute inline_prompt
          #   The prompt, model, and its parameters
          #
          #   @return [Braintrust::Models::PromptData, nil]
          required :inline_prompt, -> { Braintrust::Models::PromptData }, nil?: true

          # @!attribute name
          #   The name of the inline prompt
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!parse
          #   # Inline prompt definition
          #   #
          #   # @param inline_prompt [Braintrust::Models::PromptData, nil]
          #   # @param name [String, nil]
          #   #
          #   def initialize(inline_prompt:, name: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
        end

        # @!parse
        #   # @return [Array(Braintrust::Models::EvalCreateParams::Task::FunctionID, Braintrust::Models::EvalCreateParams::Task::ProjectSlug, Braintrust::Models::EvalCreateParams::Task::GlobalFunction, Braintrust::Models::EvalCreateParams::Task::PromptSessionID, Braintrust::Models::EvalCreateParams::Task::InlineCode, Braintrust::Models::EvalCreateParams::Task::InlinePrompt)]
        #   def self.variants; end
      end

      class GitMetadataSettings < Braintrust::Internal::Type::BaseModel
        # @!attribute collect
        #
        #   @return [Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect]
        required :collect, enum: -> { Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect }

        # @!attribute [r] fields
        #
        #   @return [Array<Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field>, nil]
        optional :fields,
                 -> { Braintrust::Internal::Type::ArrayOf[enum: Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field] }

        # @!parse
        #   # @return [Array<Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field>]
        #   attr_writer :fields

        # @!parse
        #   # Optional settings for collecting git metadata. By default, will collect all git
        #   #   metadata fields allowed in org-level settings.
        #   #
        #   # @param collect [Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect]
        #   # @param fields [Array<Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field>]
        #   #
        #   def initialize(collect:, fields: nil, **) = super

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

        # @see Braintrust::Models::EvalCreateParams::GitMetadataSettings#collect
        module Collect
          extend Braintrust::Internal::Type::Enum

          ALL = :all
          NONE = :none
          SOME = :some

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        module Field
          extend Braintrust::Internal::Type::Enum

          COMMIT = :commit
          BRANCH = :branch
          TAG = :tag
          DIRTY = :dirty
          AUTHOR_NAME = :author_name
          AUTHOR_EMAIL = :author_email
          COMMIT_MESSAGE = :commit_message
          COMMIT_TIME = :commit_time
          GIT_DIFF = :git_diff

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      # Options for tracing the evaluation
      module Parent
        extend Braintrust::Internal::Type::Union

        # Span parent properties
        variant -> { Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct }

        # The parent's span identifier, created by calling `.export()` on a span
        variant String

        class SpanParentStruct < Braintrust::Internal::Type::BaseModel
          # @!attribute object_id_
          #   The id of the container object you are logging to
          #
          #   @return [String]
          required :object_id_, String, api_name: :object_id

          # @!attribute object_type
          #
          #   @return [Symbol, Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType]
          required :object_type,
                   enum: -> { Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType }

          # @!attribute propagated_event
          #   Include these properties in every span created under this parent
          #
          #   @return [Hash{Symbol=>Object, nil}, nil]
          optional :propagated_event,
                   Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
                   nil?: true

          # @!attribute row_ids
          #   Identifiers for the row to to log a subspan under
          #
          #   @return [Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs, nil]
          optional :row_ids,
                   -> { Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs },
                   nil?: true

          # @!parse
          #   # Span parent properties
          #   #
          #   # @param object_id_ [String]
          #   # @param object_type [Symbol, Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType]
          #   # @param propagated_event [Hash{Symbol=>Object, nil}, nil]
          #   # @param row_ids [Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs, nil]
          #   #
          #   def initialize(object_id_:, object_type:, propagated_event: nil, row_ids: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct#object_type
          module ObjectType
            extend Braintrust::Internal::Type::Enum

            PROJECT_LOGS = :project_logs
            EXPERIMENT = :experiment
            PLAYGROUND_LOGS = :playground_logs

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end

          # @see Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct#row_ids
          class RowIDs < Braintrust::Internal::Type::BaseModel
            # @!attribute id
            #   The id of the row
            #
            #   @return [String]
            required :id, String

            # @!attribute root_span_id
            #   The root_span_id of the row
            #
            #   @return [String]
            required :root_span_id, String

            # @!attribute span_id
            #   The span_id of the row
            #
            #   @return [String]
            required :span_id, String

            # @!parse
            #   # Identifiers for the row to to log a subspan under
            #   #
            #   # @param id [String]
            #   # @param root_span_id [String]
            #   # @param span_id [String]
            #   #
            #   def initialize(id:, root_span_id:, span_id:, **) = super

            # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
          end
        end

        # @!parse
        #   # @return [Array(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String)]
        #   def self.variants; end
      end
    end
  end
end
