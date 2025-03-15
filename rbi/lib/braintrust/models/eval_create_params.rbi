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
      def data
      end

      sig do
        params(
          _: T.any(
            Braintrust::Models::EvalCreateParams::Data::DatasetID,
            Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName,
            Braintrust::Models::EvalCreateParams::Data::DatasetRows
          )
        )
          .returns(
            T.any(
              Braintrust::Models::EvalCreateParams::Data::DatasetID,
              Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName,
              Braintrust::Models::EvalCreateParams::Data::DatasetRows
            )
          )
      end
      def data=(_)
      end

      # Unique identifier for the project to run the eval in
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

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
      def scores
      end

      sig do
        params(
          _: T::Array[
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
          .returns(
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
      def scores=(_)
      end

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
      def task
      end

      sig do
        params(
          _: T.any(
            Braintrust::Models::EvalCreateParams::Task::FunctionID,
            Braintrust::Models::EvalCreateParams::Task::ProjectSlug,
            Braintrust::Models::EvalCreateParams::Task::GlobalFunction,
            Braintrust::Models::EvalCreateParams::Task::PromptSessionID,
            Braintrust::Models::EvalCreateParams::Task::InlineCode,
            Braintrust::Models::EvalCreateParams::Task::InlinePrompt
          )
        )
          .returns(
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
      def task=(_)
      end

      # An optional experiment id to use as a base. If specified, the new experiment
      #   will be summarized and compared to this experiment.
      sig { returns(T.nilable(String)) }
      def base_experiment_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def base_experiment_id=(_)
      end

      # An optional experiment name to use as a base. If specified, the new experiment
      #   will be summarized and compared to this experiment.
      sig { returns(T.nilable(String)) }
      def base_experiment_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def base_experiment_name=(_)
      end

      # An optional name for the experiment created by this eval. If it conflicts with
      #   an existing experiment, it will be suffixed with a unique identifier.
      sig { returns(T.nilable(String)) }
      def experiment_name
      end

      sig { params(_: String).returns(String) }
      def experiment_name=(_)
      end

      # Optional settings for collecting git metadata. By default, will collect all git
      #   metadata fields allowed in org-level settings.
      sig { returns(T.nilable(Braintrust::Models::EvalCreateParams::GitMetadataSettings)) }
      def git_metadata_settings
      end

      sig do
        params(_: T.nilable(Braintrust::Models::EvalCreateParams::GitMetadataSettings))
          .returns(T.nilable(Braintrust::Models::EvalCreateParams::GitMetadataSettings))
      end
      def git_metadata_settings=(_)
      end

      # Whether the experiment should be public. Defaults to false.
      sig { returns(T.nilable(T::Boolean)) }
      def is_public
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def is_public=(_)
      end

      # The maximum number of tasks/scorers that will be run concurrently. Defaults to
      #   undefined, in which case there is no max concurrency.
      sig { returns(T.nilable(Float)) }
      def max_concurrency
      end

      sig { params(_: T.nilable(Float)).returns(T.nilable(Float)) }
      def max_concurrency=(_)
      end

      # Optional experiment-level metadata to store about the evaluation. You can later
      #   use this to slice & dice across experiments.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T::Hash[Symbol, T.nilable(T.anything)]).returns(T::Hash[Symbol, T.nilable(T.anything)])
      end
      def metadata=(_)
      end

      # Options for tracing the evaluation
      sig { returns(T.nilable(T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String))) }
      def parent
      end

      sig do
        params(_: T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String))
          .returns(T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String))
      end
      def parent=(_)
      end

      # Metadata about the state of the repo when the experiment was created
      sig { returns(T.nilable(Braintrust::Models::RepoInfo)) }
      def repo_info
      end

      sig { params(_: T.nilable(Braintrust::Models::RepoInfo)).returns(T.nilable(Braintrust::Models::RepoInfo)) }
      def repo_info=(_)
      end

      # Whether to stream the results of the eval. If true, the request will return two
      #   events: one to indicate the experiment has started, and another upon completion.
      #   If false, the request will return the evaluation's summary upon completion.
      sig { returns(T.nilable(T::Boolean)) }
      def stream
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def stream=(_)
      end

      # The maximum duration, in milliseconds, to run the evaluation. Defaults to
      #   undefined, in which case there is no timeout.
      sig { returns(T.nilable(Float)) }
      def timeout
      end

      sig { params(_: T.nilable(Float)).returns(T.nilable(Float)) }
      def timeout=(_)
      end

      # The number of times to run the evaluator per input. This is useful for
      #   evaluating applications that have non-deterministic behavior and gives you both
      #   a stronger aggregate measure and a sense of the variance in the results.
      sig { returns(T.nilable(Float)) }
      def trial_count
      end

      sig { params(_: T.nilable(Float)).returns(T.nilable(Float)) }
      def trial_count=(_)
      end

      sig do
        params(
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
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
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
      class Data < Braintrust::Union
        abstract!

        class DatasetID < Braintrust::BaseModel
          sig { returns(String) }
          def dataset_id
          end

          sig { params(_: String).returns(String) }
          def dataset_id=(_)
          end

          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          def _internal_btql
          end

          sig do
            params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
              .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          end
          def _internal_btql=(_)
          end

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
          def dataset_name
          end

          sig { params(_: String).returns(String) }
          def dataset_name=(_)
          end

          sig { returns(String) }
          def project_name
          end

          sig { params(_: String).returns(String) }
          def project_name=(_)
          end

          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          def _internal_btql
          end

          sig do
            params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
              .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          end
          def _internal_btql=(_)
          end

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
          def data
          end

          sig { params(_: T::Array[T.nilable(T.anything)]).returns(T::Array[T.nilable(T.anything)]) }
          def data=(_)
          end

          # Dataset rows
          sig { params(data: T::Array[T.nilable(T.anything)]).returns(T.attached_class) }
          def self.new(data:)
          end

          sig { override.returns({data: T::Array[T.nilable(T.anything)]}) }
          def to_hash
          end
        end

        class << self
          # @api private
          sig do
            override
              .returns(
                [[NilClass, Braintrust::Models::EvalCreateParams::Data::DatasetID], [NilClass, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName], [NilClass, Braintrust::Models::EvalCreateParams::Data::DatasetRows]]
              )
          end
          private def variants
          end
        end
      end

      # The function to evaluate
      class Score < Braintrust::Union
        abstract!

        class FunctionID < Braintrust::BaseModel
          # The ID of the function
          sig { returns(String) }
          def function_id
          end

          sig { params(_: String).returns(String) }
          def function_id=(_)
          end

          # The version of the function
          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

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
          def project_name
          end

          sig { params(_: String).returns(String) }
          def project_name=(_)
          end

          # The slug of the function
          sig { returns(String) }
          def slug
          end

          sig { params(_: String).returns(String) }
          def slug=(_)
          end

          # The version of the function
          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

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
          def global_function
          end

          sig { params(_: String).returns(String) }
          def global_function=(_)
          end

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
          def prompt_session_function_id
          end

          sig { params(_: String).returns(String) }
          def prompt_session_function_id=(_)
          end

          # The ID of the prompt session
          sig { returns(String) }
          def prompt_session_id
          end

          sig { params(_: String).returns(String) }
          def prompt_session_id=(_)
          end

          # The version of the function
          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

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
          def code
          end

          sig { params(_: String).returns(String) }
          def code=(_)
          end

          sig { returns(Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext) }
          def inline_context
          end

          sig do
            params(_: Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext)
              .returns(Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext)
          end
          def inline_context=(_)
          end

          # The name of the inline code function
          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def name=(_)
          end

          # Inline code function
          sig do
            params(
              code: String,
              inline_context: Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext,
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
            sig { returns(Symbol) }
            def runtime
            end

            sig { params(_: Symbol).returns(Symbol) }
            def runtime=(_)
            end

            sig { returns(String) }
            def version
            end

            sig { params(_: String).returns(String) }
            def version=(_)
            end

            sig { params(runtime: Symbol, version: String).returns(T.attached_class) }
            def self.new(runtime:, version:)
            end

            sig { override.returns({runtime: Symbol, version: String}) }
            def to_hash
            end

            class Runtime < Braintrust::Enum
              abstract!

              NODE = :node
              PYTHON = :python

              class << self
                sig { override.returns(T::Array[Symbol]) }
                def values
                end
              end
            end
          end
        end

        class InlinePrompt < Braintrust::BaseModel
          # The prompt, model, and its parameters
          sig { returns(T.nilable(Braintrust::Models::PromptData)) }
          def inline_prompt
          end

          sig { params(_: T.nilable(Braintrust::Models::PromptData)).returns(T.nilable(Braintrust::Models::PromptData)) }
          def inline_prompt=(_)
          end

          # The name of the inline prompt
          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def name=(_)
          end

          # Inline prompt definition
          sig do
            params(inline_prompt: T.nilable(Braintrust::Models::PromptData), name: T.nilable(String))
              .returns(T.attached_class)
          end
          def self.new(inline_prompt:, name: nil)
          end

          sig { override.returns({inline_prompt: T.nilable(Braintrust::Models::PromptData), name: T.nilable(String)}) }
          def to_hash
          end
        end

        class << self
          # @api private
          sig do
            override
              .returns(
                [[NilClass, Braintrust::Models::EvalCreateParams::Score::FunctionID], [NilClass, Braintrust::Models::EvalCreateParams::Score::ProjectSlug], [NilClass, Braintrust::Models::EvalCreateParams::Score::GlobalFunction], [NilClass, Braintrust::Models::EvalCreateParams::Score::PromptSessionID], [NilClass, Braintrust::Models::EvalCreateParams::Score::InlineCode], [NilClass, Braintrust::Models::EvalCreateParams::Score::InlinePrompt]]
              )
          end
          private def variants
          end
        end
      end

      # The function to evaluate
      class Task < Braintrust::Union
        abstract!

        class FunctionID < Braintrust::BaseModel
          # The ID of the function
          sig { returns(String) }
          def function_id
          end

          sig { params(_: String).returns(String) }
          def function_id=(_)
          end

          # The version of the function
          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

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
          def project_name
          end

          sig { params(_: String).returns(String) }
          def project_name=(_)
          end

          # The slug of the function
          sig { returns(String) }
          def slug
          end

          sig { params(_: String).returns(String) }
          def slug=(_)
          end

          # The version of the function
          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

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
          def global_function
          end

          sig { params(_: String).returns(String) }
          def global_function=(_)
          end

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
          def prompt_session_function_id
          end

          sig { params(_: String).returns(String) }
          def prompt_session_function_id=(_)
          end

          # The ID of the prompt session
          sig { returns(String) }
          def prompt_session_id
          end

          sig { params(_: String).returns(String) }
          def prompt_session_id=(_)
          end

          # The version of the function
          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

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
          def code
          end

          sig { params(_: String).returns(String) }
          def code=(_)
          end

          sig { returns(Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext) }
          def inline_context
          end

          sig do
            params(_: Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext)
              .returns(Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext)
          end
          def inline_context=(_)
          end

          # The name of the inline code function
          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def name=(_)
          end

          # Inline code function
          sig do
            params(
              code: String,
              inline_context: Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext,
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
            sig { returns(Symbol) }
            def runtime
            end

            sig { params(_: Symbol).returns(Symbol) }
            def runtime=(_)
            end

            sig { returns(String) }
            def version
            end

            sig { params(_: String).returns(String) }
            def version=(_)
            end

            sig { params(runtime: Symbol, version: String).returns(T.attached_class) }
            def self.new(runtime:, version:)
            end

            sig { override.returns({runtime: Symbol, version: String}) }
            def to_hash
            end

            class Runtime < Braintrust::Enum
              abstract!

              NODE = :node
              PYTHON = :python

              class << self
                sig { override.returns(T::Array[Symbol]) }
                def values
                end
              end
            end
          end
        end

        class InlinePrompt < Braintrust::BaseModel
          # The prompt, model, and its parameters
          sig { returns(T.nilable(Braintrust::Models::PromptData)) }
          def inline_prompt
          end

          sig { params(_: T.nilable(Braintrust::Models::PromptData)).returns(T.nilable(Braintrust::Models::PromptData)) }
          def inline_prompt=(_)
          end

          # The name of the inline prompt
          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def name=(_)
          end

          # Inline prompt definition
          sig do
            params(inline_prompt: T.nilable(Braintrust::Models::PromptData), name: T.nilable(String))
              .returns(T.attached_class)
          end
          def self.new(inline_prompt:, name: nil)
          end

          sig { override.returns({inline_prompt: T.nilable(Braintrust::Models::PromptData), name: T.nilable(String)}) }
          def to_hash
          end
        end

        class << self
          # @api private
          sig do
            override
              .returns(
                [[NilClass, Braintrust::Models::EvalCreateParams::Task::FunctionID], [NilClass, Braintrust::Models::EvalCreateParams::Task::ProjectSlug], [NilClass, Braintrust::Models::EvalCreateParams::Task::GlobalFunction], [NilClass, Braintrust::Models::EvalCreateParams::Task::PromptSessionID], [NilClass, Braintrust::Models::EvalCreateParams::Task::InlineCode], [NilClass, Braintrust::Models::EvalCreateParams::Task::InlinePrompt]]
              )
          end
          private def variants
          end
        end
      end

      class GitMetadataSettings < Braintrust::BaseModel
        sig { returns(Symbol) }
        def collect
        end

        sig { params(_: Symbol).returns(Symbol) }
        def collect=(_)
        end

        sig { returns(T.nilable(T::Array[Symbol])) }
        def fields
        end

        sig { params(_: T::Array[Symbol]).returns(T::Array[Symbol]) }
        def fields=(_)
        end

        # Optional settings for collecting git metadata. By default, will collect all git
        #   metadata fields allowed in org-level settings.
        sig { params(collect: Symbol, fields: T::Array[Symbol]).returns(T.attached_class) }
        def self.new(collect:, fields: nil)
        end

        sig { override.returns({collect: Symbol, fields: T::Array[Symbol]}) }
        def to_hash
        end

        class Collect < Braintrust::Enum
          abstract!

          ALL = :all
          NONE = :none
          SOME = :some

          class << self
            sig { override.returns(T::Array[Symbol]) }
            def values
            end
          end
        end

        class Field < Braintrust::Enum
          abstract!

          COMMIT = :commit
          BRANCH = :branch
          TAG = :tag
          DIRTY = :dirty
          AUTHOR_NAME = :author_name
          AUTHOR_EMAIL = :author_email
          COMMIT_MESSAGE = :commit_message
          COMMIT_TIME = :commit_time
          GIT_DIFF = :git_diff

          class << self
            sig { override.returns(T::Array[Symbol]) }
            def values
            end
          end
        end
      end

      # Options for tracing the evaluation
      class Parent < Braintrust::Union
        abstract!

        class SpanParentStruct < Braintrust::BaseModel
          # The id of the container object you are logging to
          sig { returns(String) }
          def object_id_
          end

          sig { params(_: String).returns(String) }
          def object_id_=(_)
          end

          sig { returns(Symbol) }
          def object_type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def object_type=(_)
          end

          # Include these properties in every span created under this parent
          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          def propagated_event
          end

          sig do
            params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
              .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          end
          def propagated_event=(_)
          end

          # Identifiers for the row to to log a subspan under
          sig { returns(T.nilable(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs)) }
          def row_ids
          end

          sig do
            params(_: T.nilable(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs))
              .returns(T.nilable(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs))
          end
          def row_ids=(_)
          end

          # Span parent properties
          sig do
            params(
              object_id_: String,
              object_type: Symbol,
              propagated_event: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              row_ids: T.nilable(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs)
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
                  object_type: Symbol,
                  propagated_event: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
                  row_ids: T.nilable(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs)
                }
              )
          end
          def to_hash
          end

          class ObjectType < Braintrust::Enum
            abstract!

            PROJECT_LOGS = :project_logs
            EXPERIMENT = :experiment
            PLAYGROUND_LOGS = :playground_logs

            class << self
              sig { override.returns(T::Array[Symbol]) }
              def values
              end
            end
          end

          class RowIDs < Braintrust::BaseModel
            # The id of the row
            sig { returns(String) }
            def id
            end

            sig { params(_: String).returns(String) }
            def id=(_)
            end

            # The root_span_id of the row
            sig { returns(String) }
            def root_span_id
            end

            sig { params(_: String).returns(String) }
            def root_span_id=(_)
            end

            # The span_id of the row
            sig { returns(String) }
            def span_id
            end

            sig { params(_: String).returns(String) }
            def span_id=(_)
            end

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
          # @api private
          sig do
            override
              .returns([[NilClass, Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct], [NilClass, String]])
          end
          private def variants
          end
        end
      end
    end
  end
end
