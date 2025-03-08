# typed: strong

module Braintrust
  module Models
    class EvalCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig do
        returns(
          T.any(
            Braintrust::Models::EvalCreateParams::Data::DatasetID,
            Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName
          )
        )
      end
      def data
      end

      sig do
        params(
          _: T.any(
            Braintrust::Models::EvalCreateParams::Data::DatasetID,
            Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName
          )
        )
          .returns(
            T.any(
              Braintrust::Models::EvalCreateParams::Data::DatasetID,
              Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName
            )
          )
      end
      def data=(_)
      end

      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

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

      sig { returns(T.nilable(String)) }
      def base_experiment_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def base_experiment_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def base_experiment_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def base_experiment_name=(_)
      end

      sig { returns(T.nilable(String)) }
      def experiment_name
      end

      sig { params(_: String).returns(String) }
      def experiment_name=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::EvalCreateParams::GitMetadataSettings)) }
      def git_metadata_settings
      end

      sig do
        params(_: T.nilable(Braintrust::Models::EvalCreateParams::GitMetadataSettings))
          .returns(T.nilable(Braintrust::Models::EvalCreateParams::GitMetadataSettings))
      end
      def git_metadata_settings=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def is_public
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def is_public=(_)
      end

      sig { returns(T.nilable(Float)) }
      def max_concurrency
      end

      sig { params(_: T.nilable(Float)).returns(T.nilable(Float)) }
      def max_concurrency=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T::Hash[Symbol, T.nilable(T.anything)]).returns(T::Hash[Symbol, T.nilable(T.anything)])
      end
      def metadata=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::RepoInfo)) }
      def repo_info
      end

      sig { params(_: T.nilable(Braintrust::Models::RepoInfo)).returns(T.nilable(Braintrust::Models::RepoInfo)) }
      def repo_info=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def stream
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def stream=(_)
      end

      sig { returns(T.nilable(Float)) }
      def timeout
      end

      sig { params(_: T.nilable(Float)).returns(T.nilable(Float)) }
      def timeout=(_)
      end

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
            Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName
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
                Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName
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

      class Data < Braintrust::Union
        abstract!

        class DatasetID < Braintrust::BaseModel
          sig { returns(String) }
          def dataset_id
          end

          sig { params(_: String).returns(String) }
          def dataset_id=(_)
          end

          sig { params(dataset_id: String).returns(T.attached_class) }
          def self.new(dataset_id:)
          end

          sig { override.returns({dataset_id: String}) }
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

          sig { params(dataset_name: String, project_name: String).returns(T.attached_class) }
          def self.new(dataset_name:, project_name:)
          end

          sig { override.returns({dataset_name: String, project_name: String}) }
          def to_hash
          end
        end

        class << self
          sig do
            override
              .returns(
                [[NilClass, Braintrust::Models::EvalCreateParams::Data::DatasetID], [NilClass, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName]]
              )
          end
          private def variants
          end
        end
      end

      class Score < Braintrust::Union
        abstract!

        class FunctionID < Braintrust::BaseModel
          sig { returns(String) }
          def function_id
          end

          sig { params(_: String).returns(String) }
          def function_id=(_)
          end

          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

          sig { params(function_id: String, version: String).returns(T.attached_class) }
          def self.new(function_id:, version: nil)
          end

          sig { override.returns({function_id: String, version: String}) }
          def to_hash
          end
        end

        class ProjectSlug < Braintrust::BaseModel
          sig { returns(String) }
          def project_name
          end

          sig { params(_: String).returns(String) }
          def project_name=(_)
          end

          sig { returns(String) }
          def slug
          end

          sig { params(_: String).returns(String) }
          def slug=(_)
          end

          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

          sig { params(project_name: String, slug: String, version: String).returns(T.attached_class) }
          def self.new(project_name:, slug:, version: nil)
          end

          sig { override.returns({project_name: String, slug: String, version: String}) }
          def to_hash
          end
        end

        class GlobalFunction < Braintrust::BaseModel
          sig { returns(String) }
          def global_function
          end

          sig { params(_: String).returns(String) }
          def global_function=(_)
          end

          sig { params(global_function: String).returns(T.attached_class) }
          def self.new(global_function:)
          end

          sig { override.returns({global_function: String}) }
          def to_hash
          end
        end

        class PromptSessionID < Braintrust::BaseModel
          sig { returns(String) }
          def prompt_session_function_id
          end

          sig { params(_: String).returns(String) }
          def prompt_session_function_id=(_)
          end

          sig { returns(String) }
          def prompt_session_id
          end

          sig { params(_: String).returns(String) }
          def prompt_session_id=(_)
          end

          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

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

          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def name=(_)
          end

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
          sig { returns(T.nilable(Braintrust::Models::PromptData)) }
          def inline_prompt
          end

          sig { params(_: T.nilable(Braintrust::Models::PromptData)).returns(T.nilable(Braintrust::Models::PromptData)) }
          def inline_prompt=(_)
          end

          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def name=(_)
          end

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

      class Task < Braintrust::Union
        abstract!

        class FunctionID < Braintrust::BaseModel
          sig { returns(String) }
          def function_id
          end

          sig { params(_: String).returns(String) }
          def function_id=(_)
          end

          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

          sig { params(function_id: String, version: String).returns(T.attached_class) }
          def self.new(function_id:, version: nil)
          end

          sig { override.returns({function_id: String, version: String}) }
          def to_hash
          end
        end

        class ProjectSlug < Braintrust::BaseModel
          sig { returns(String) }
          def project_name
          end

          sig { params(_: String).returns(String) }
          def project_name=(_)
          end

          sig { returns(String) }
          def slug
          end

          sig { params(_: String).returns(String) }
          def slug=(_)
          end

          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

          sig { params(project_name: String, slug: String, version: String).returns(T.attached_class) }
          def self.new(project_name:, slug:, version: nil)
          end

          sig { override.returns({project_name: String, slug: String, version: String}) }
          def to_hash
          end
        end

        class GlobalFunction < Braintrust::BaseModel
          sig { returns(String) }
          def global_function
          end

          sig { params(_: String).returns(String) }
          def global_function=(_)
          end

          sig { params(global_function: String).returns(T.attached_class) }
          def self.new(global_function:)
          end

          sig { override.returns({global_function: String}) }
          def to_hash
          end
        end

        class PromptSessionID < Braintrust::BaseModel
          sig { returns(String) }
          def prompt_session_function_id
          end

          sig { params(_: String).returns(String) }
          def prompt_session_function_id=(_)
          end

          sig { returns(String) }
          def prompt_session_id
          end

          sig { params(_: String).returns(String) }
          def prompt_session_id=(_)
          end

          sig { returns(T.nilable(String)) }
          def version
          end

          sig { params(_: String).returns(String) }
          def version=(_)
          end

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

          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def name=(_)
          end

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
          sig { returns(T.nilable(Braintrust::Models::PromptData)) }
          def inline_prompt
          end

          sig { params(_: T.nilable(Braintrust::Models::PromptData)).returns(T.nilable(Braintrust::Models::PromptData)) }
          def inline_prompt=(_)
          end

          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def name=(_)
          end

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
    end
  end
end
