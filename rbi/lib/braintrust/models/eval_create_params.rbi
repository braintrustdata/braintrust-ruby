# typed: strong

module Braintrust
  module Models
    class EvalCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # The dataset to use
      sig do
        returns(
          T.any(
            Braintrust::Models::EvalCreateParams::Data::DatasetID,
            Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName,
            Braintrust::Models::EvalCreateParams::Data::DatasetRows
          )
        )
      end
      attr_accessor :data

      # Unique identifier for the project to run the eval in
      sig { returns(String) }
      attr_accessor :project_id

      # The functions to score the eval on
      sig do
        returns(
          T::Array[
          T.any(
            Braintrust::Models::EvalCreateParams::Score::FunctionID,
            Braintrust::Models::EvalCreateParams::Score::ProjectSlug,
            Braintrust::Models::EvalCreateParams::Score::GlobalFunction,
            Braintrust::Models::EvalCreateParams::Score::PromptSessionID,
            Braintrust::Models::EvalCreateParams::Score::InlineCode,
            Braintrust::Models::EvalCreateParams::Score::InlinePrompt
          )
          ]
        )
      end
      attr_accessor :scores

      # The function to evaluate
      sig do
        returns(
          T.any(
            Braintrust::Models::EvalCreateParams::Task::FunctionID,
            Braintrust::Models::EvalCreateParams::Task::ProjectSlug,
            Braintrust::Models::EvalCreateParams::Task::GlobalFunction,
            Braintrust::Models::EvalCreateParams::Task::PromptSessionID,
            Braintrust::Models::EvalCreateParams::Task::InlineCode,
            Braintrust::Models::EvalCreateParams::Task::InlinePrompt
          )
        )
      end
      attr_accessor :task

      # An optional experiment id to use as a base. If specified, the new experiment
      #   will be summarized and compared to this experiment.
      sig { returns(T.nilable(String)) }
      attr_accessor :base_experiment_id

      # An optional experiment name to use as a base. If specified, the new experiment
      #   will be summarized and compared to this experiment.
      sig { returns(T.nilable(String)) }
      attr_accessor :base_experiment_name

      # An optional name for the experiment created by this eval. If it conflicts with
      #   an existing experiment, it will be suffixed with a unique identifier.
      sig { returns(T.nilable(String)) }
      attr_reader :experiment_name

      sig { params(experiment_name: String).void }
      attr_writer :experiment_name

      # Optional settings for collecting git metadata. By default, will collect all git
      #   metadata fields allowed in org-level settings.
      sig { returns(T.nilable(Braintrust::Models::EvalCreateParams::GitMetadataSettings)) }
      attr_reader :git_metadata_settings

      sig do
        params(
          git_metadata_settings: T.nilable(T.any(Braintrust::Models::EvalCreateParams::GitMetadataSettings, Braintrust::Util::AnyHash))
        )
          .void
      end
      attr_writer :git_metadata_settings

      # Whether the experiment should be public. Defaults to false.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_public

      # The maximum number of tasks/scorers that will be run concurrently. Defaults to
      #   undefined, in which case there is no max concurrency.
      sig { returns(T.nilable(Float)) }
      attr_accessor :max_concurrency

      # Optional experiment-level metadata to store about the evaluation. You can later
      #   use this to slice & dice across experiments.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(T.anything)]).void }
      attr_writer :metadata

      # Options for tracing the evaluation
      sig { returns(T.nilable(T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String))) }
      attr_reader :parent

      sig do
        params(
          parent: T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, Braintrust::Util::AnyHash, String)
        )
          .void
      end
      attr_writer :parent

      # Metadata about the state of the repo when the experiment was created
      sig { returns(T.nilable(Braintrust::Models::RepoInfo)) }
      attr_reader :repo_info

      sig { params(repo_info: T.nilable(T.any(Braintrust::Models::RepoInfo, Braintrust::Util::AnyHash))).void }
      attr_writer :repo_info

      # Whether to stream the results of the eval. If true, the request will return two
      #   events: one to indicate the experiment has started, and another upon completion.
      #   If false, the request will return the evaluation's summary upon completion.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stream

      sig { params(stream: T::Boolean).void }
      attr_writer :stream

      # The maximum duration, in milliseconds, to run the evaluation. Defaults to
      #   undefined, in which case there is no timeout.
      sig { returns(T.nilable(Float)) }
      attr_accessor :timeout

      # The number of times to run the evaluator per input. This is useful for
      #   evaluating applications that have non-deterministic behavior and gives you both
      #   a stronger aggregate measure and a sense of the variance in the results.
      sig { returns(T.nilable(Float)) }
      attr_accessor :trial_count

      sig do
        params(
          data: T.any(
            Braintrust::Models::EvalCreateParams::Data::DatasetID,
            Braintrust::Util::AnyHash,
            Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName,
            Braintrust::Models::EvalCreateParams::Data::DatasetRows
          ),
          project_id: String,
          scores: T::Array[
          T.any(
            Braintrust::Models::EvalCreateParams::Score::FunctionID,
            Braintrust::Util::AnyHash,
            Braintrust::Models::EvalCreateParams::Score::ProjectSlug,
            Braintrust::Models::EvalCreateParams::Score::GlobalFunction,
            Braintrust::Models::EvalCreateParams::Score::PromptSessionID,
            Braintrust::Models::EvalCreateParams::Score::InlineCode,
            Braintrust::Models::EvalCreateParams::Score::InlinePrompt
          )
          ],
          task: T.any(
            Braintrust::Models::EvalCreateParams::Task::FunctionID,
            Braintrust::Util::AnyHash,
            Braintrust::Models::EvalCreateParams::Task::ProjectSlug,
            Braintrust::Models::EvalCreateParams::Task::GlobalFunction,
            Braintrust::Models::EvalCreateParams::Task::PromptSessionID,
            Braintrust::Models::EvalCreateParams::Task::InlineCode,
            Braintrust::Models::EvalCreateParams::Task::InlinePrompt
          ),
          base_experiment_id: T.nilable(String),
          base_experiment_name: T.nilable(String),
          experiment_name: String,
          git_metadata_settings: T.nilable(T.any(Braintrust::Models::EvalCreateParams::GitMetadataSettings, Braintrust::Util::AnyHash)),
          is_public: T.nilable(T::Boolean),
          max_concurrency: T.nilable(Float),
          metadata: T::Hash[Symbol, T.nilable(T.anything)],
          parent: T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, Braintrust::Util::AnyHash, String),
          repo_info: T.nilable(T.any(Braintrust::Models::RepoInfo, Braintrust::Util::AnyHash)),
          stream: T::Boolean,
          timeout: T.nilable(Float),
          trial_count: T.nilable(Float),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        data:,
        project_id:,
        scores:,
        task:,
        base_experiment_id: nil,
        base_experiment_name: nil,
        experiment_name: nil,
        git_metadata_settings: nil,
        is_public: nil,
        max_concurrency: nil,
        metadata: nil,
        parent: nil,
        repo_info: nil,
        stream: nil,
        timeout: nil,
        trial_count: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              data: T.any(
                Braintrust::Models::EvalCreateParams::Data::DatasetID,
                Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName,
                Braintrust::Models::EvalCreateParams::Data::DatasetRows
              ),
              project_id: String,
              scores: T::Array[
              T.any(
                Braintrust::Models::EvalCreateParams::Score::FunctionID,
                Braintrust::Models::EvalCreateParams::Score::ProjectSlug,
                Braintrust::Models::EvalCreateParams::Score::GlobalFunction,
                Braintrust::Models::EvalCreateParams::Score::PromptSessionID,
                Braintrust::Models::EvalCreateParams::Score::InlineCode,
                Braintrust::Models::EvalCreateParams::Score::InlinePrompt
              )
              ],
              task: T.any(
                Braintrust::Models::EvalCreateParams::Task::FunctionID,
                Braintrust::Models::EvalCreateParams::Task::ProjectSlug,
                Braintrust::Models::EvalCreateParams::Task::GlobalFunction,
                Braintrust::Models::EvalCreateParams::Task::PromptSessionID,
                Braintrust::Models::EvalCreateParams::Task::InlineCode,
                Braintrust::Models::EvalCreateParams::Task::InlinePrompt
              ),
              base_experiment_id: T.nilable(String),
              base_experiment_name: T.nilable(String),
              experiment_name: String,
              git_metadata_settings: T.nilable(Braintrust::Models::EvalCreateParams::GitMetadataSettings),
              is_public: T.nilable(T::Boolean),
              max_concurrency: T.nilable(Float),
              metadata: T::Hash[Symbol, T.nilable(T.anything)],
              parent: T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String),
              repo_info: T.nilable(Braintrust::Models::RepoInfo),
              stream: T::Boolean,
              timeout: T.nilable(Float),
              trial_count: T.nilable(Float),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # The dataset to use
      module Data
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Braintrust::Models::EvalCreateParams::Data::DatasetID,
                Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName,
                Braintrust::Models::EvalCreateParams::Data::DatasetRows
              )
            }
          end

        class DatasetID < Braintrust::BaseModel
          sig { returns(String) }
          attr_accessor :dataset_id

          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          attr_accessor :_internal_btql

          # Dataset id
          sig do
            params(dataset_id: String, _internal_btql: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
              .returns(T.attached_class)
          end
          def self.new(dataset_id:, _internal_btql: nil)
          end

          sig do
            override.returns(
              {
                dataset_id: String,
                _internal_btql: T.nilable(T::Hash[Symbol, T.nilable(T.anything)])
              }
            )
          end
          def to_hash
          end
        end

        class ProjectDatasetName < Braintrust::BaseModel
          sig { returns(String) }
          attr_accessor :dataset_name

          sig { returns(String) }
          attr_accessor :project_name

          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          attr_accessor :_internal_btql

          # Project and dataset name
          sig do
            params(
              dataset_name: String,
              project_name: String,
              _internal_btql: T.nilable(T::Hash[Symbol, T.nilable(T.anything)])
            )
              .returns(T.attached_class)
          end
          def self.new(dataset_name:, project_name:, _internal_btql: nil)
          end

          sig do
            override
              .returns(
                {
                  dataset_name: String,
                  project_name: String,
                  _internal_btql: T.nilable(T::Hash[Symbol, T.nilable(T.anything)])
                }
              )
          end
          def to_hash
          end
        end

        class DatasetRows < Braintrust::BaseModel
          sig { returns(T::Array[T.nilable(T.anything)]) }
          attr_accessor :data

          # Dataset rows
          sig { params(data: T::Array[T.nilable(T.anything)]).returns(T.attached_class) }
          def self.new(data:)
          end

          sig { override.returns({data: T::Array[T.nilable(T.anything)]}) }
          def to_hash
          end
        end

        class << self
          sig do
            override
              .returns(
                [Braintrust::Models::EvalCreateParams::Data::DatasetID, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName, Braintrust::Models::EvalCreateParams::Data::DatasetRows]
              )
          end
          def variants
          end
        end
      end

      # The function to evaluate
      module Score
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Braintrust::Models::EvalCreateParams::Score::FunctionID,
                Braintrust::Models::EvalCreateParams::Score::ProjectSlug,
                Braintrust::Models::EvalCreateParams::Score::GlobalFunction,
                Braintrust::Models::EvalCreateParams::Score::PromptSessionID,
                Braintrust::Models::EvalCreateParams::Score::InlineCode,
                Braintrust::Models::EvalCreateParams::Score::InlinePrompt
              )
            }
          end

        class FunctionID < Braintrust::BaseModel
          # The ID of the function
          sig { returns(String) }
          attr_accessor :function_id

          # The version of the function
          sig { returns(T.nilable(String)) }
          attr_reader :version

          sig { params(version: String).void }
          attr_writer :version

          # Function id
          sig { params(function_id: String, version: String).returns(T.attached_class) }
          def self.new(function_id:, version: nil)
          end

          sig { override.returns({function_id: String, version: String}) }
          def to_hash
          end
        end

        class ProjectSlug < Braintrust::BaseModel
          # The name of the project containing the function
          sig { returns(String) }
          attr_accessor :project_name

          # The slug of the function
          sig { returns(String) }
          attr_accessor :slug

          # The version of the function
          sig { returns(T.nilable(String)) }
          attr_reader :version

          sig { params(version: String).void }
          attr_writer :version

          # Project name and slug
          sig { params(project_name: String, slug: String, version: String).returns(T.attached_class) }
          def self.new(project_name:, slug:, version: nil)
          end

          sig { override.returns({project_name: String, slug: String, version: String}) }
          def to_hash
          end
        end

        class GlobalFunction < Braintrust::BaseModel
          # The name of the global function. Currently, the global namespace includes the
          #   functions in autoevals
          sig { returns(String) }
          attr_accessor :global_function

          # Global function name
          sig { params(global_function: String).returns(T.attached_class) }
          def self.new(global_function:)
          end

          sig { override.returns({global_function: String}) }
          def to_hash
          end
        end

        class PromptSessionID < Braintrust::BaseModel
          # The ID of the function in the prompt session
          sig { returns(String) }
          attr_accessor :prompt_session_function_id

          # The ID of the prompt session
          sig { returns(String) }
          attr_accessor :prompt_session_id

          # The version of the function
          sig { returns(T.nilable(String)) }
          attr_reader :version

          sig { params(version: String).void }
          attr_writer :version

          # Prompt session id
          sig do
            params(prompt_session_function_id: String, prompt_session_id: String, version: String)
              .returns(T.attached_class)
          end
          def self.new(prompt_session_function_id:, prompt_session_id:, version: nil)
          end

          sig do
            override.returns({prompt_session_function_id: String, prompt_session_id: String, version: String})
          end
          def to_hash
          end
        end

        class InlineCode < Braintrust::BaseModel
          # The inline code to execute
          sig { returns(String) }
          attr_accessor :code

          sig { returns(Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext) }
          attr_reader :inline_context

          sig do
            params(
              inline_context: T.any(Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext, Braintrust::Util::AnyHash)
            )
              .void
          end
          attr_writer :inline_context

          # The name of the inline code function
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Inline code function
          sig do
            params(
              code: String,
              inline_context: T.any(Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext, Braintrust::Util::AnyHash),
              name: T.nilable(String)
            )
              .returns(T.attached_class)
          end
          def self.new(code:, inline_context:, name: nil)
          end

          sig do
            override
              .returns(
                {
                  code: String,
                  inline_context: Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext,
                  name: T.nilable(String)
                }
              )
          end
          def to_hash
          end

          class InlineContext < Braintrust::BaseModel
            sig { returns(Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::OrSymbol) }
            attr_accessor :runtime

            sig { returns(String) }
            attr_accessor :version

            sig do
              params(
                runtime: Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::OrSymbol,
                version: String
              )
                .returns(T.attached_class)
            end
            def self.new(runtime:, version:)
            end

            sig do
              override
                .returns(
                  {
                    runtime: Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::OrSymbol,
                    version: String
                  }
                )
            end
            def to_hash
            end

            module Runtime
              extend Braintrust::Enum

              TaggedSymbol =
                T.type_alias { T.all(Symbol, Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime) }
              OrSymbol =
                T.type_alias do
                  T.any(
                    Symbol,
                    Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::TaggedSymbol
                  )
                end

              NODE =
                T.let(
                  :node,
                  Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::TaggedSymbol
                )
              PYTHON =
                T.let(
                  :python,
                  Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::TaggedSymbol
                )

              class << self
                sig do
                  override
                    .returns(
                      T::Array[Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::TaggedSymbol]
                    )
                end
                def values
                end
              end
            end
          end
        end

        class InlinePrompt < Braintrust::BaseModel
          # The prompt, model, and its parameters
          sig { returns(T.nilable(Braintrust::Models::PromptData)) }
          attr_reader :inline_prompt

          sig { params(inline_prompt: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash))).void }
          attr_writer :inline_prompt

          # The name of the inline prompt
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Inline prompt definition
          sig do
            params(
              inline_prompt: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)),
              name: T.nilable(String)
            )
              .returns(T.attached_class)
          end
          def self.new(inline_prompt:, name: nil)
          end

          sig { override.returns({inline_prompt: T.nilable(Braintrust::Models::PromptData), name: T.nilable(String)}) }
          def to_hash
          end
        end

        class << self
          sig do
            override
              .returns(
                [Braintrust::Models::EvalCreateParams::Score::FunctionID, Braintrust::Models::EvalCreateParams::Score::ProjectSlug, Braintrust::Models::EvalCreateParams::Score::GlobalFunction, Braintrust::Models::EvalCreateParams::Score::PromptSessionID, Braintrust::Models::EvalCreateParams::Score::InlineCode, Braintrust::Models::EvalCreateParams::Score::InlinePrompt]
              )
          end
          def variants
          end
        end
      end

      # The function to evaluate
      module Task
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Braintrust::Models::EvalCreateParams::Task::FunctionID,
                Braintrust::Models::EvalCreateParams::Task::ProjectSlug,
                Braintrust::Models::EvalCreateParams::Task::GlobalFunction,
                Braintrust::Models::EvalCreateParams::Task::PromptSessionID,
                Braintrust::Models::EvalCreateParams::Task::InlineCode,
                Braintrust::Models::EvalCreateParams::Task::InlinePrompt
              )
            }
          end

        class FunctionID < Braintrust::BaseModel
          # The ID of the function
          sig { returns(String) }
          attr_accessor :function_id

          # The version of the function
          sig { returns(T.nilable(String)) }
          attr_reader :version

          sig { params(version: String).void }
          attr_writer :version

          # Function id
          sig { params(function_id: String, version: String).returns(T.attached_class) }
          def self.new(function_id:, version: nil)
          end

          sig { override.returns({function_id: String, version: String}) }
          def to_hash
          end
        end

        class ProjectSlug < Braintrust::BaseModel
          # The name of the project containing the function
          sig { returns(String) }
          attr_accessor :project_name

          # The slug of the function
          sig { returns(String) }
          attr_accessor :slug

          # The version of the function
          sig { returns(T.nilable(String)) }
          attr_reader :version

          sig { params(version: String).void }
          attr_writer :version

          # Project name and slug
          sig { params(project_name: String, slug: String, version: String).returns(T.attached_class) }
          def self.new(project_name:, slug:, version: nil)
          end

          sig { override.returns({project_name: String, slug: String, version: String}) }
          def to_hash
          end
        end

        class GlobalFunction < Braintrust::BaseModel
          # The name of the global function. Currently, the global namespace includes the
          #   functions in autoevals
          sig { returns(String) }
          attr_accessor :global_function

          # Global function name
          sig { params(global_function: String).returns(T.attached_class) }
          def self.new(global_function:)
          end

          sig { override.returns({global_function: String}) }
          def to_hash
          end
        end

        class PromptSessionID < Braintrust::BaseModel
          # The ID of the function in the prompt session
          sig { returns(String) }
          attr_accessor :prompt_session_function_id

          # The ID of the prompt session
          sig { returns(String) }
          attr_accessor :prompt_session_id

          # The version of the function
          sig { returns(T.nilable(String)) }
          attr_reader :version

          sig { params(version: String).void }
          attr_writer :version

          # Prompt session id
          sig do
            params(prompt_session_function_id: String, prompt_session_id: String, version: String)
              .returns(T.attached_class)
          end
          def self.new(prompt_session_function_id:, prompt_session_id:, version: nil)
          end

          sig do
            override.returns({prompt_session_function_id: String, prompt_session_id: String, version: String})
          end
          def to_hash
          end
        end

        class InlineCode < Braintrust::BaseModel
          # The inline code to execute
          sig { returns(String) }
          attr_accessor :code

          sig { returns(Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext) }
          attr_reader :inline_context

          sig do
            params(
              inline_context: T.any(Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext, Braintrust::Util::AnyHash)
            )
              .void
          end
          attr_writer :inline_context

          # The name of the inline code function
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Inline code function
          sig do
            params(
              code: String,
              inline_context: T.any(Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext, Braintrust::Util::AnyHash),
              name: T.nilable(String)
            )
              .returns(T.attached_class)
          end
          def self.new(code:, inline_context:, name: nil)
          end

          sig do
            override
              .returns(
                {
                  code: String,
                  inline_context: Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext,
                  name: T.nilable(String)
                }
              )
          end
          def to_hash
          end

          class InlineContext < Braintrust::BaseModel
            sig { returns(Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::OrSymbol) }
            attr_accessor :runtime

            sig { returns(String) }
            attr_accessor :version

            sig do
              params(
                runtime: Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::OrSymbol,
                version: String
              )
                .returns(T.attached_class)
            end
            def self.new(runtime:, version:)
            end

            sig do
              override
                .returns(
                  {
                    runtime: Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::OrSymbol,
                    version: String
                  }
                )
            end
            def to_hash
            end

            module Runtime
              extend Braintrust::Enum

              TaggedSymbol =
                T.type_alias { T.all(Symbol, Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime) }
              OrSymbol =
                T.type_alias do
                  T.any(
                    Symbol,
                    Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::TaggedSymbol
                  )
                end

              NODE =
                T.let(:node, Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::TaggedSymbol)
              PYTHON =
                T.let(
                  :python,
                  Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::TaggedSymbol
                )

              class << self
                sig do
                  override
                    .returns(
                      T::Array[Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::TaggedSymbol]
                    )
                end
                def values
                end
              end
            end
          end
        end

        class InlinePrompt < Braintrust::BaseModel
          # The prompt, model, and its parameters
          sig { returns(T.nilable(Braintrust::Models::PromptData)) }
          attr_reader :inline_prompt

          sig { params(inline_prompt: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash))).void }
          attr_writer :inline_prompt

          # The name of the inline prompt
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Inline prompt definition
          sig do
            params(
              inline_prompt: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)),
              name: T.nilable(String)
            )
              .returns(T.attached_class)
          end
          def self.new(inline_prompt:, name: nil)
          end

          sig { override.returns({inline_prompt: T.nilable(Braintrust::Models::PromptData), name: T.nilable(String)}) }
          def to_hash
          end
        end

        class << self
          sig do
            override
              .returns(
                [Braintrust::Models::EvalCreateParams::Task::FunctionID, Braintrust::Models::EvalCreateParams::Task::ProjectSlug, Braintrust::Models::EvalCreateParams::Task::GlobalFunction, Braintrust::Models::EvalCreateParams::Task::PromptSessionID, Braintrust::Models::EvalCreateParams::Task::InlineCode, Braintrust::Models::EvalCreateParams::Task::InlinePrompt]
              )
          end
          def variants
          end
        end
      end

      class GitMetadataSettings < Braintrust::BaseModel
        sig { returns(Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::OrSymbol) }
        attr_accessor :collect

        sig { returns(T.nilable(T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::OrSymbol])) }
        attr_reader :fields

        sig { params(fields: T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::OrSymbol]).void }
        attr_writer :fields

        # Optional settings for collecting git metadata. By default, will collect all git
        #   metadata fields allowed in org-level settings.
        sig do
          params(
            collect: Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::OrSymbol,
            fields: T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::OrSymbol]
          )
            .returns(T.attached_class)
        end
        def self.new(collect:, fields: nil)
        end

        sig do
          override
            .returns(
              {
                collect: Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::OrSymbol,
                fields: T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::OrSymbol]
              }
            )
        end
        def to_hash
        end

        module Collect
          extend Braintrust::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect) }
          OrSymbol =
            T.type_alias { T.any(Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol) }

          ALL = T.let(:all, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol)
          NONE = T.let(:none, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol)
          SOME = T.let(:some, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol)

          class << self
            sig do
              override
                .returns(T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol])
            end
            def values
            end
          end
        end

        module Field
          extend Braintrust::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field) }
          OrSymbol =
            T.type_alias { T.any(Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol) }

          COMMIT = T.let(:commit, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol)
          BRANCH = T.let(:branch, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol)
          TAG = T.let(:tag, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol)
          DIRTY = T.let(:dirty, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol)
          AUTHOR_NAME =
            T.let(:author_name, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol)
          AUTHOR_EMAIL =
            T.let(:author_email, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol)
          COMMIT_MESSAGE =
            T.let(:commit_message, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol)
          COMMIT_TIME =
            T.let(:commit_time, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol)
          GIT_DIFF =
            T.let(:git_diff, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol)

          class << self
            sig { override.returns(T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol]) }
            def values
            end
          end
        end
      end

      # Options for tracing the evaluation
      module Parent
        extend Braintrust::Union

        Variants =
          type_template(:out) { {fixed: T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String)} }

        class SpanParentStruct < Braintrust::BaseModel
          # The id of the container object you are logging to
          sig { returns(String) }
          attr_accessor :object_id_

          sig { returns(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType::OrSymbol) }
          attr_accessor :object_type

          # Include these properties in every span created under this parent
          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          attr_accessor :propagated_event

          # Identifiers for the row to to log a subspan under
          sig { returns(T.nilable(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs)) }
          attr_reader :row_ids

          sig do
            params(
              row_ids: T.nilable(
                T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs, Braintrust::Util::AnyHash)
              )
            )
              .void
          end
          attr_writer :row_ids

          # Span parent properties
          sig do
            params(
              object_id_: String,
              object_type: Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType::OrSymbol,
              propagated_event: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              row_ids: T.nilable(
                T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs, Braintrust::Util::AnyHash)
              )
            )
              .returns(T.attached_class)
          end
          def self.new(object_id_:, object_type:, propagated_event: nil, row_ids: nil)
          end

          sig do
            override
              .returns(
                {
                  object_id_: String,
                  object_type: Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType::OrSymbol,
                  propagated_event: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
                  row_ids: T.nilable(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs)
                }
              )
          end
          def to_hash
          end

          module ObjectType
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol) }

            PROJECT_LOGS =
              T.let(
                :project_logs,
                Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )
            EXPERIMENT =
              T.let(
                :experiment,
                Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )
            PLAYGROUND_LOGS =
              T.let(
                :playground_logs,
                Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )

            class << self
              sig do
                override
                  .returns(
                    T::Array[Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol]
                  )
              end
              def values
              end
            end
          end

          class RowIDs < Braintrust::BaseModel
            # The id of the row
            sig { returns(String) }
            attr_accessor :id

            # The root_span_id of the row
            sig { returns(String) }
            attr_accessor :root_span_id

            # The span_id of the row
            sig { returns(String) }
            attr_accessor :span_id

            # Identifiers for the row to to log a subspan under
            sig { params(id: String, root_span_id: String, span_id: String).returns(T.attached_class) }
            def self.new(id:, root_span_id:, span_id:)
            end

            sig { override.returns({id: String, root_span_id: String, span_id: String}) }
            def to_hash
            end
          end
        end

        class << self
          sig { override.returns([Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String]) }
          def variants
          end
        end
      end
    end
  end
end
