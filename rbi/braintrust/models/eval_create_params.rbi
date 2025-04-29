# typed: strong

module Braintrust
  module Models
    class EvalCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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
      # will be summarized and compared to this experiment.
      sig { returns(T.nilable(String)) }
      attr_accessor :base_experiment_id

      # An optional experiment name to use as a base. If specified, the new experiment
      # will be summarized and compared to this experiment.
      sig { returns(T.nilable(String)) }
      attr_accessor :base_experiment_name

      # An optional name for the experiment created by this eval. If it conflicts with
      # an existing experiment, it will be suffixed with a unique identifier.
      sig { returns(T.nilable(String)) }
      attr_reader :experiment_name

      sig { params(experiment_name: String).void }
      attr_writer :experiment_name

      # Optional settings for collecting git metadata. By default, will collect all git
      # metadata fields allowed in org-level settings.
      sig { returns(T.nilable(Braintrust::Models::EvalCreateParams::GitMetadataSettings)) }
      attr_reader :git_metadata_settings

      sig do
        params(
          git_metadata_settings: T.nilable(T.any(Braintrust::Models::EvalCreateParams::GitMetadataSettings, Braintrust::Internal::AnyHash))
        )
          .void
      end
      attr_writer :git_metadata_settings

      # Whether the experiment should be public. Defaults to false.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_public

      # The maximum number of tasks/scorers that will be run concurrently. Defaults to
      # undefined, in which case there is no max concurrency.
      sig { returns(T.nilable(Float)) }
      attr_accessor :max_concurrency

      # Optional experiment-level metadata to store about the evaluation. You can later
      # use this to slice & dice across experiments.
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_reader :metadata

      sig { params(metadata: T::Hash[Symbol, T.nilable(T.anything)]).void }
      attr_writer :metadata

      # Options for tracing the evaluation
      sig { returns(T.nilable(T.any(Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String))) }
      attr_reader :parent

      sig do
        params(
          parent: T.any(
            Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct,
            Braintrust::Internal::AnyHash,
            String
          )
        )
          .void
      end
      attr_writer :parent

      # Metadata about the state of the repo when the experiment was created
      sig { returns(T.nilable(Braintrust::Models::RepoInfo)) }
      attr_reader :repo_info

      sig { params(repo_info: T.nilable(T.any(Braintrust::Models::RepoInfo, Braintrust::Internal::AnyHash))).void }
      attr_writer :repo_info

      # Whether to stream the results of the eval. If true, the request will return two
      # events: one to indicate the experiment has started, and another upon completion.
      # If false, the request will return the evaluation's summary upon completion.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stream

      sig { params(stream: T::Boolean).void }
      attr_writer :stream

      # The maximum duration, in milliseconds, to run the evaluation. Defaults to
      # undefined, in which case there is no timeout.
      sig { returns(T.nilable(Float)) }
      attr_accessor :timeout

      # The number of times to run the evaluator per input. This is useful for
      # evaluating applications that have non-deterministic behavior and gives you both
      # a stronger aggregate measure and a sense of the variance in the results.
      sig { returns(T.nilable(Float)) }
      attr_accessor :trial_count

      sig do
        params(
          data: T.any(
            Braintrust::Models::EvalCreateParams::Data::DatasetID,
            Braintrust::Internal::AnyHash,
            Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName,
            Braintrust::Models::EvalCreateParams::Data::DatasetRows
          ),
          project_id: String,
          scores: T::Array[
            T.any(
              Braintrust::Models::EvalCreateParams::Score::FunctionID,
              Braintrust::Internal::AnyHash,
              Braintrust::Models::EvalCreateParams::Score::ProjectSlug,
              Braintrust::Models::EvalCreateParams::Score::GlobalFunction,
              Braintrust::Models::EvalCreateParams::Score::PromptSessionID,
              Braintrust::Models::EvalCreateParams::Score::InlineCode,
              Braintrust::Models::EvalCreateParams::Score::InlinePrompt
            )
          ],
          task: T.any(
            Braintrust::Models::EvalCreateParams::Task::FunctionID,
            Braintrust::Internal::AnyHash,
            Braintrust::Models::EvalCreateParams::Task::ProjectSlug,
            Braintrust::Models::EvalCreateParams::Task::GlobalFunction,
            Braintrust::Models::EvalCreateParams::Task::PromptSessionID,
            Braintrust::Models::EvalCreateParams::Task::InlineCode,
            Braintrust::Models::EvalCreateParams::Task::InlinePrompt
          ),
          base_experiment_id: T.nilable(String),
          base_experiment_name: T.nilable(String),
          experiment_name: String,
          git_metadata_settings: T.nilable(T.any(Braintrust::Models::EvalCreateParams::GitMetadataSettings, Braintrust::Internal::AnyHash)),
          is_public: T.nilable(T::Boolean),
          max_concurrency: T.nilable(Float),
          metadata: T::Hash[Symbol, T.nilable(T.anything)],
          parent: T.any(
            Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct,
            Braintrust::Internal::AnyHash,
            String
          ),
          repo_info: T.nilable(T.any(Braintrust::Models::RepoInfo, Braintrust::Internal::AnyHash)),
          stream: T::Boolean,
          timeout: T.nilable(Float),
          trial_count: T.nilable(Float),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        # The dataset to use
        data:,
        # Unique identifier for the project to run the eval in
        project_id:,
        # The functions to score the eval on
        scores:,
        # The function to evaluate
        task:,
        # An optional experiment id to use as a base. If specified, the new experiment
        # will be summarized and compared to this experiment.
        base_experiment_id: nil,
        # An optional experiment name to use as a base. If specified, the new experiment
        # will be summarized and compared to this experiment.
        base_experiment_name: nil,
        # An optional name for the experiment created by this eval. If it conflicts with
        # an existing experiment, it will be suffixed with a unique identifier.
        experiment_name: nil,
        # Optional settings for collecting git metadata. By default, will collect all git
        # metadata fields allowed in org-level settings.
        git_metadata_settings: nil,
        # Whether the experiment should be public. Defaults to false.
        is_public: nil,
        # The maximum number of tasks/scorers that will be run concurrently. Defaults to
        # undefined, in which case there is no max concurrency.
        max_concurrency: nil,
        # Optional experiment-level metadata to store about the evaluation. You can later
        # use this to slice & dice across experiments.
        metadata: nil,
        # Options for tracing the evaluation
        parent: nil,
        # Metadata about the state of the repo when the experiment was created
        repo_info: nil,
        # Whether to stream the results of the eval. If true, the request will return two
        # events: one to indicate the experiment has started, and another upon completion.
        # If false, the request will return the evaluation's summary upon completion.
        stream: nil,
        # The maximum duration, in milliseconds, to run the evaluation. Defaults to
        # undefined, in which case there is no timeout.
        timeout: nil,
        # The number of times to run the evaluator per input. This is useful for
        # evaluating applications that have non-deterministic behavior and gives you both
        # a stronger aggregate measure and a sense of the variance in the results.
        trial_count: nil,
        request_options: {}
      ); end
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
      def to_hash; end

      # The dataset to use
      module Data
        extend Braintrust::Internal::Type::Union

        class DatasetID < Braintrust::Internal::Type::BaseModel
          sig { returns(String) }
          attr_accessor :dataset_id

          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          attr_accessor :_internal_btql

          # Dataset id
          sig do
            params(dataset_id: String, _internal_btql: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
              .returns(T.attached_class)
          end
          def self.new(dataset_id:, _internal_btql: nil); end

          sig do
            override.returns(
              {
                dataset_id: String,
                _internal_btql: T.nilable(T::Hash[Symbol, T.nilable(T.anything)])
              }
            )
          end
          def to_hash; end
        end

        class ProjectDatasetName < Braintrust::Internal::Type::BaseModel
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
          def self.new(dataset_name:, project_name:, _internal_btql: nil); end

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
          def to_hash; end
        end

        class DatasetRows < Braintrust::Internal::Type::BaseModel
          sig { returns(T::Array[T.nilable(T.anything)]) }
          attr_accessor :data

          # Dataset rows
          sig { params(data: T::Array[T.nilable(T.anything)]).returns(T.attached_class) }
          def self.new(data:); end

          sig { override.returns({data: T::Array[T.nilable(T.anything)]}) }
          def to_hash; end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::EvalCreateParams::Data::DatasetID, Braintrust::Models::EvalCreateParams::Data::ProjectDatasetName, Braintrust::Models::EvalCreateParams::Data::DatasetRows]
            )
        end
        def self.variants; end
      end

      # The function to evaluate
      module Score
        extend Braintrust::Internal::Type::Union

        class FunctionID < Braintrust::Internal::Type::BaseModel
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
          def self.new(
            # The ID of the function
            function_id:,
            # The version of the function
            version: nil
          ); end
          sig { override.returns({function_id: String, version: String}) }
          def to_hash; end
        end

        class ProjectSlug < Braintrust::Internal::Type::BaseModel
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
          def self.new(
            # The name of the project containing the function
            project_name:,
            # The slug of the function
            slug:,
            # The version of the function
            version: nil
          ); end
          sig { override.returns({project_name: String, slug: String, version: String}) }
          def to_hash; end
        end

        class GlobalFunction < Braintrust::Internal::Type::BaseModel
          # The name of the global function. Currently, the global namespace includes the
          # functions in autoevals
          sig { returns(String) }
          attr_accessor :global_function

          # Global function name
          sig { params(global_function: String).returns(T.attached_class) }
          def self.new(
            # The name of the global function. Currently, the global namespace includes the
            # functions in autoevals
            global_function:
          ); end
          sig { override.returns({global_function: String}) }
          def to_hash; end
        end

        class PromptSessionID < Braintrust::Internal::Type::BaseModel
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
          def self.new(
            # The ID of the function in the prompt session
            prompt_session_function_id:,
            # The ID of the prompt session
            prompt_session_id:,
            # The version of the function
            version: nil
          ); end
          sig do
            override.returns({prompt_session_function_id: String, prompt_session_id: String, version: String})
          end
          def to_hash; end
        end

        class InlineCode < Braintrust::Internal::Type::BaseModel
          # The inline code to execute
          sig { returns(String) }
          attr_accessor :code

          sig { returns(Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext) }
          attr_reader :inline_context

          sig do
            params(
              inline_context: T.any(
                Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext,
                Braintrust::Internal::AnyHash
              )
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
              inline_context: T.any(
                Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext,
                Braintrust::Internal::AnyHash
              ),
              name: T.nilable(String)
            )
              .returns(T.attached_class)
          end
          def self.new(
            # The inline code to execute
            code:,
            inline_context:,
            # The name of the inline code function
            name: nil
          ); end
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
          def to_hash; end

          class InlineContext < Braintrust::Internal::Type::BaseModel
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
            def self.new(runtime:, version:); end

            sig do
              override
                .returns(
                  {
                    runtime: Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::OrSymbol,
                    version: String
                  }
                )
            end
            def to_hash; end

            module Runtime
              extend Braintrust::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias { T.all(Symbol, Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime) }
              OrSymbol = T.type_alias { T.any(Symbol, String) }

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

              sig do
                override
                  .returns(
                    T::Array[Braintrust::Models::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::TaggedSymbol]
                  )
              end
              def self.values; end
            end
          end
        end

        class InlinePrompt < Braintrust::Internal::Type::BaseModel
          # The prompt, model, and its parameters
          sig { returns(T.nilable(Braintrust::Models::PromptData)) }
          attr_reader :inline_prompt

          sig do
            params(inline_prompt: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::AnyHash))).void
          end
          attr_writer :inline_prompt

          # The name of the inline prompt
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Inline prompt definition
          sig do
            params(
              inline_prompt: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::AnyHash)),
              name: T.nilable(String)
            )
              .returns(T.attached_class)
          end
          def self.new(
            # The prompt, model, and its parameters
            inline_prompt:,
            # The name of the inline prompt
            name: nil
          ); end
          sig { override.returns({inline_prompt: T.nilable(Braintrust::Models::PromptData), name: T.nilable(String)}) }
          def to_hash; end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::EvalCreateParams::Score::FunctionID, Braintrust::Models::EvalCreateParams::Score::ProjectSlug, Braintrust::Models::EvalCreateParams::Score::GlobalFunction, Braintrust::Models::EvalCreateParams::Score::PromptSessionID, Braintrust::Models::EvalCreateParams::Score::InlineCode, Braintrust::Models::EvalCreateParams::Score::InlinePrompt]
            )
        end
        def self.variants; end
      end

      # The function to evaluate
      module Task
        extend Braintrust::Internal::Type::Union

        class FunctionID < Braintrust::Internal::Type::BaseModel
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
          def self.new(
            # The ID of the function
            function_id:,
            # The version of the function
            version: nil
          ); end
          sig { override.returns({function_id: String, version: String}) }
          def to_hash; end
        end

        class ProjectSlug < Braintrust::Internal::Type::BaseModel
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
          def self.new(
            # The name of the project containing the function
            project_name:,
            # The slug of the function
            slug:,
            # The version of the function
            version: nil
          ); end
          sig { override.returns({project_name: String, slug: String, version: String}) }
          def to_hash; end
        end

        class GlobalFunction < Braintrust::Internal::Type::BaseModel
          # The name of the global function. Currently, the global namespace includes the
          # functions in autoevals
          sig { returns(String) }
          attr_accessor :global_function

          # Global function name
          sig { params(global_function: String).returns(T.attached_class) }
          def self.new(
            # The name of the global function. Currently, the global namespace includes the
            # functions in autoevals
            global_function:
          ); end
          sig { override.returns({global_function: String}) }
          def to_hash; end
        end

        class PromptSessionID < Braintrust::Internal::Type::BaseModel
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
          def self.new(
            # The ID of the function in the prompt session
            prompt_session_function_id:,
            # The ID of the prompt session
            prompt_session_id:,
            # The version of the function
            version: nil
          ); end
          sig do
            override.returns({prompt_session_function_id: String, prompt_session_id: String, version: String})
          end
          def to_hash; end
        end

        class InlineCode < Braintrust::Internal::Type::BaseModel
          # The inline code to execute
          sig { returns(String) }
          attr_accessor :code

          sig { returns(Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext) }
          attr_reader :inline_context

          sig do
            params(
              inline_context: T.any(
                Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext,
                Braintrust::Internal::AnyHash
              )
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
              inline_context: T.any(
                Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext,
                Braintrust::Internal::AnyHash
              ),
              name: T.nilable(String)
            )
              .returns(T.attached_class)
          end
          def self.new(
            # The inline code to execute
            code:,
            inline_context:,
            # The name of the inline code function
            name: nil
          ); end
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
          def to_hash; end

          class InlineContext < Braintrust::Internal::Type::BaseModel
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
            def self.new(runtime:, version:); end

            sig do
              override
                .returns(
                  {
                    runtime: Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::OrSymbol,
                    version: String
                  }
                )
            end
            def to_hash; end

            module Runtime
              extend Braintrust::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias { T.all(Symbol, Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime) }
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              NODE =
                T.let(:node, Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::TaggedSymbol)
              PYTHON =
                T.let(
                  :python,
                  Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::TaggedSymbol
                )

              sig do
                override
                  .returns(
                    T::Array[Braintrust::Models::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::TaggedSymbol]
                  )
              end
              def self.values; end
            end
          end
        end

        class InlinePrompt < Braintrust::Internal::Type::BaseModel
          # The prompt, model, and its parameters
          sig { returns(T.nilable(Braintrust::Models::PromptData)) }
          attr_reader :inline_prompt

          sig do
            params(inline_prompt: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::AnyHash))).void
          end
          attr_writer :inline_prompt

          # The name of the inline prompt
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Inline prompt definition
          sig do
            params(
              inline_prompt: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::AnyHash)),
              name: T.nilable(String)
            )
              .returns(T.attached_class)
          end
          def self.new(
            # The prompt, model, and its parameters
            inline_prompt:,
            # The name of the inline prompt
            name: nil
          ); end
          sig { override.returns({inline_prompt: T.nilable(Braintrust::Models::PromptData), name: T.nilable(String)}) }
          def to_hash; end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::EvalCreateParams::Task::FunctionID, Braintrust::Models::EvalCreateParams::Task::ProjectSlug, Braintrust::Models::EvalCreateParams::Task::GlobalFunction, Braintrust::Models::EvalCreateParams::Task::PromptSessionID, Braintrust::Models::EvalCreateParams::Task::InlineCode, Braintrust::Models::EvalCreateParams::Task::InlinePrompt]
            )
        end
        def self.variants; end
      end

      class GitMetadataSettings < Braintrust::Internal::Type::BaseModel
        sig { returns(Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::OrSymbol) }
        attr_accessor :collect

        sig { returns(T.nilable(T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::OrSymbol])) }
        attr_reader :fields

        sig { params(fields: T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::OrSymbol]).void }
        attr_writer :fields

        # Optional settings for collecting git metadata. By default, will collect all git
        # metadata fields allowed in org-level settings.
        sig do
          params(
            collect: Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::OrSymbol,
            fields: T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::OrSymbol]
          )
            .returns(T.attached_class)
        end
        def self.new(collect:, fields: nil); end

        sig do
          override
            .returns(
              {
                collect: Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::OrSymbol,
                fields: T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::OrSymbol]
              }
            )
        end
        def to_hash; end

        module Collect
          extend Braintrust::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL = T.let(:all, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol)
          NONE = T.let(:none, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol)
          SOME = T.let(:some, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol)

          sig do
            override
              .returns(T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol])
          end
          def self.values; end
        end

        module Field
          extend Braintrust::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

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

          sig { override.returns(T::Array[Braintrust::Models::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol]) }
          def self.values; end
        end
      end

      # Options for tracing the evaluation
      module Parent
        extend Braintrust::Internal::Type::Union

        class SpanParentStruct < Braintrust::Internal::Type::BaseModel
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
                T.any(
                  Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs,
                  Braintrust::Internal::AnyHash
                )
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
                T.any(
                  Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::RowIDs,
                  Braintrust::Internal::AnyHash
                )
              )
            )
              .returns(T.attached_class)
          end
          def self.new(
            # The id of the container object you are logging to
            object_id_:,
            object_type:,
            # Include these properties in every span created under this parent
            propagated_event: nil,
            # Identifiers for the row to to log a subspan under
            row_ids: nil
          ); end
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
          def to_hash; end

          module ObjectType
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType) }
            OrSymbol = T.type_alias { T.any(Symbol, String) }

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

            sig do
              override
                .returns(
                  T::Array[Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol]
                )
            end
            def self.values; end
          end

          class RowIDs < Braintrust::Internal::Type::BaseModel
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
            def self.new(
              # The id of the row
              id:,
              # The root_span_id of the row
              root_span_id:,
              # The span_id of the row
              span_id:
            ); end
            sig { override.returns({id: String, root_span_id: String, span_id: String}) }
            def to_hash; end
          end
        end

        sig { override.returns([Braintrust::Models::EvalCreateParams::Parent::SpanParentStruct, String]) }
        def self.variants; end
      end
    end
  end
end
