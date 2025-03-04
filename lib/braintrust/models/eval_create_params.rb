# frozen_string_literal: true

module Braintrust
  module Models
    class EvalCreateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute data
      #   The dataset to use
      #
      #   @return [Braintrust::Models::EvalCreateParams::Data::DatasetID, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName]
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
      required :scores, -> { Braintrust::ArrayOf[union: Braintrust::Models::EvalCreateParams::Score] }

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
      optional :is_public, Braintrust::BooleanModel, nil?: true

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
      optional :metadata, Braintrust::HashOf[Braintrust::Unknown, nil?: true]

      # @!parse
      #   # @return [Hash{Symbol=>Object, nil}]
      #   attr_writer :metadata

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
      optional :stream, Braintrust::BooleanModel

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
      #   # @param data [Braintrust::Models::EvalCreateParams::Data::DatasetID, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName]
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
      #     repo_info: nil,
      #     stream: nil,
      #     timeout: nil,
      #     trial_count: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # The dataset to use
      #
      # @example
      # ```ruby
      # case data
      # in Braintrust::Models::EvalCreateParams::Data::DatasetID
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName
      #   # ...
      # end
      # ```
      class Data < Braintrust::Union
        # Dataset id
        variant -> { Braintrust::Models::EvalCreateParams::Data::DatasetID }

        # Project and dataset name
        variant -> { Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName }

        class DatasetID < Braintrust::BaseModel
          # @!attribute dataset_id
          #
          #   @return [String]
          required :dataset_id, String

          # @!parse
          #   # Dataset id
          #   #
          #   # @param dataset_id [String]
          #   #
          #   def initialize(dataset_id:, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class ProjectDatasetName < Braintrust::BaseModel
          # @!attribute dataset_name
          #
          #   @return [String]
          required :dataset_name, String

          # @!attribute project_name
          #
          #   @return [String]
          required :project_name, String

          # @!parse
          #   # Project and dataset name
          #   #
          #   # @param dataset_name [String]
          #   # @param project_name [String]
          #   #
          #   def initialize(dataset_name:, project_name:, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end
      end

      # @abstract
      #
      # The function to evaluate
      #
      # @example
      # ```ruby
      # case score
      # in Braintrust::Models::EvalCreateParams::Score::FunctionID
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Score::ProjectSlug
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Score::GlobalFunction
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Score::PromptSessionID
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Score::InlineCode
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Score::InlinePrompt
      #   # ...
      # end
      # ```
      class Score < Braintrust::Union
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

        class FunctionID < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class ProjectSlug < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class GlobalFunction < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class PromptSessionID < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class InlineCode < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          class InlineContext < Braintrust::BaseModel
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

            # def initialize: (Hash | Braintrust::BaseModel) -> void

            # @abstract
            #
            # @example
            # ```ruby
            # case runtime
            # in :node
            #   # ...
            # in :python
            #   # ...
            # end
            # ```
            class Runtime < Braintrust::Enum
              NODE = :node
              PYTHON = :python

              finalize!

              # @!parse
              #   # @return [Array<Symbol>]
              #   #
              #   def self.values; end
            end
          end
        end

        class InlinePrompt < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end
      end

      # @abstract
      #
      # The function to evaluate
      #
      # @example
      # ```ruby
      # case task
      # in Braintrust::Models::EvalCreateParams::Task::FunctionID
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Task::ProjectSlug
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Task::GlobalFunction
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Task::PromptSessionID
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Task::InlineCode
      #   # ...
      # in Braintrust::Models::EvalCreateParams::Task::InlinePrompt
      #   # ...
      # end
      # ```
      class Task < Braintrust::Union
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

        class FunctionID < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class ProjectSlug < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class GlobalFunction < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class PromptSessionID < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class InlineCode < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          class InlineContext < Braintrust::BaseModel
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

            # def initialize: (Hash | Braintrust::BaseModel) -> void

            # @abstract
            #
            # @example
            # ```ruby
            # case runtime
            # in :node
            #   # ...
            # in :python
            #   # ...
            # end
            # ```
            class Runtime < Braintrust::Enum
              NODE = :node
              PYTHON = :python

              finalize!

              # @!parse
              #   # @return [Array<Symbol>]
              #   #
              #   def self.values; end
            end
          end
        end

        class InlinePrompt < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end
      end

      class GitMetadataSettings < Braintrust::BaseModel
        # @!attribute collect
        #
        #   @return [Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect]
        required :collect, enum: -> { Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect }

        # @!attribute [r] fields
        #
        #   @return [Array<Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field>, nil]
        optional :fields,
                 -> { Braintrust::ArrayOf[enum: Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field] }

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

        # def initialize: (Hash | Braintrust::BaseModel) -> void

        # @abstract
        #
        # @example
        # ```ruby
        # case collect
        # in :all
        #   # ...
        # in :none
        #   # ...
        # in :some
        #   # ...
        # end
        # ```
        class Collect < Braintrust::Enum
          ALL = :all
          NONE = :none
          SOME = :some

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   #
          #   def self.values; end
        end

        # @abstract
        #
        # @example
        # ```ruby
        # case field
        # in :commit
        #   # ...
        # in :branch
        #   # ...
        # in :tag
        #   # ...
        # in :dirty
        #   # ...
        # in :author_name
        #   # ...
        # in ...
        #   #...
        # end
        # ```
        class Field < Braintrust::Enum
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
          #   #
          #   def self.values; end
        end
      end
    end
  end
end
