# typed: strong

module Braintrust
  module Models
    class EvalCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # The dataset to use
      sig do
        returns(
          T.any(
            Braintrust::EvalCreateParams::Data::DatasetID,
            Braintrust::EvalCreateParams::Data::ProjectDatasetName,
            Braintrust::EvalCreateParams::Data::DatasetRows
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
              Braintrust::EvalCreateParams::Score::FunctionID,
              Braintrust::EvalCreateParams::Score::ProjectSlug,
              Braintrust::EvalCreateParams::Score::GlobalFunction,
              Braintrust::EvalCreateParams::Score::PromptSessionID,
              Braintrust::EvalCreateParams::Score::InlineCode,
              Braintrust::EvalCreateParams::Score::InlinePrompt
            )
          ]
        )
      end
      attr_accessor :scores

      # The function to evaluate
      sig do
        returns(
          T.any(
            Braintrust::EvalCreateParams::Task::FunctionID,
            Braintrust::EvalCreateParams::Task::ProjectSlug,
            Braintrust::EvalCreateParams::Task::GlobalFunction,
            Braintrust::EvalCreateParams::Task::PromptSessionID,
            Braintrust::EvalCreateParams::Task::InlineCode,
            Braintrust::EvalCreateParams::Task::InlinePrompt
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
      sig do
        returns(T.nilable(Braintrust::EvalCreateParams::GitMetadataSettings))
      end
      attr_reader :git_metadata_settings

      sig do
        params(
          git_metadata_settings:
            T.nilable(Braintrust::EvalCreateParams::GitMetadataSettings::OrHash)
        ).void
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
      sig do
        returns(
          T.nilable(
            T.any(
              Braintrust::EvalCreateParams::Parent::SpanParentStruct,
              String
            )
          )
        )
      end
      attr_reader :parent

      sig do
        params(
          parent:
            T.any(
              Braintrust::EvalCreateParams::Parent::SpanParentStruct::OrHash,
              String
            )
        ).void
      end
      attr_writer :parent

      # Metadata about the state of the repo when the experiment was created
      sig { returns(T.nilable(Braintrust::RepoInfo)) }
      attr_reader :repo_info

      sig { params(repo_info: T.nilable(Braintrust::RepoInfo::OrHash)).void }
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
          data:
            T.any(
              Braintrust::EvalCreateParams::Data::DatasetID::OrHash,
              Braintrust::EvalCreateParams::Data::ProjectDatasetName::OrHash,
              Braintrust::EvalCreateParams::Data::DatasetRows::OrHash
            ),
          project_id: String,
          scores:
            T::Array[
              T.any(
                Braintrust::EvalCreateParams::Score::FunctionID::OrHash,
                Braintrust::EvalCreateParams::Score::ProjectSlug::OrHash,
                Braintrust::EvalCreateParams::Score::GlobalFunction::OrHash,
                Braintrust::EvalCreateParams::Score::PromptSessionID::OrHash,
                Braintrust::EvalCreateParams::Score::InlineCode::OrHash,
                Braintrust::EvalCreateParams::Score::InlinePrompt::OrHash
              )
            ],
          task:
            T.any(
              Braintrust::EvalCreateParams::Task::FunctionID::OrHash,
              Braintrust::EvalCreateParams::Task::ProjectSlug::OrHash,
              Braintrust::EvalCreateParams::Task::GlobalFunction::OrHash,
              Braintrust::EvalCreateParams::Task::PromptSessionID::OrHash,
              Braintrust::EvalCreateParams::Task::InlineCode::OrHash,
              Braintrust::EvalCreateParams::Task::InlinePrompt::OrHash
            ),
          base_experiment_id: T.nilable(String),
          base_experiment_name: T.nilable(String),
          experiment_name: String,
          git_metadata_settings:
            T.nilable(
              Braintrust::EvalCreateParams::GitMetadataSettings::OrHash
            ),
          is_public: T.nilable(T::Boolean),
          max_concurrency: T.nilable(Float),
          metadata: T::Hash[Symbol, T.nilable(T.anything)],
          parent:
            T.any(
              Braintrust::EvalCreateParams::Parent::SpanParentStruct::OrHash,
              String
            ),
          repo_info: T.nilable(Braintrust::RepoInfo::OrHash),
          stream: T::Boolean,
          timeout: T.nilable(Float),
          trial_count: T.nilable(Float),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
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
      )
      end

      sig do
        override.returns(
          {
            data:
              T.any(
                Braintrust::EvalCreateParams::Data::DatasetID,
                Braintrust::EvalCreateParams::Data::ProjectDatasetName,
                Braintrust::EvalCreateParams::Data::DatasetRows
              ),
            project_id: String,
            scores:
              T::Array[
                T.any(
                  Braintrust::EvalCreateParams::Score::FunctionID,
                  Braintrust::EvalCreateParams::Score::ProjectSlug,
                  Braintrust::EvalCreateParams::Score::GlobalFunction,
                  Braintrust::EvalCreateParams::Score::PromptSessionID,
                  Braintrust::EvalCreateParams::Score::InlineCode,
                  Braintrust::EvalCreateParams::Score::InlinePrompt
                )
              ],
            task:
              T.any(
                Braintrust::EvalCreateParams::Task::FunctionID,
                Braintrust::EvalCreateParams::Task::ProjectSlug,
                Braintrust::EvalCreateParams::Task::GlobalFunction,
                Braintrust::EvalCreateParams::Task::PromptSessionID,
                Braintrust::EvalCreateParams::Task::InlineCode,
                Braintrust::EvalCreateParams::Task::InlinePrompt
              ),
            base_experiment_id: T.nilable(String),
            base_experiment_name: T.nilable(String),
            experiment_name: String,
            git_metadata_settings:
              T.nilable(Braintrust::EvalCreateParams::GitMetadataSettings),
            is_public: T.nilable(T::Boolean),
            max_concurrency: T.nilable(Float),
            metadata: T::Hash[Symbol, T.nilable(T.anything)],
            parent:
              T.any(
                Braintrust::EvalCreateParams::Parent::SpanParentStruct,
                String
              ),
            repo_info: T.nilable(Braintrust::RepoInfo),
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
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::EvalCreateParams::Data::DatasetID,
              Braintrust::EvalCreateParams::Data::ProjectDatasetName,
              Braintrust::EvalCreateParams::Data::DatasetRows
            )
          end

        class DatasetID < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig { returns(String) }
          attr_accessor :dataset_id

          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          attr_accessor :_internal_btql

          # Dataset id
          sig do
            params(
              dataset_id: String,
              _internal_btql: T.nilable(T::Hash[Symbol, T.nilable(T.anything)])
            ).returns(T.attached_class)
          end
          def self.new(dataset_id:, _internal_btql: nil)
          end

          sig do
            override.returns(
              {
                dataset_id: String,
                _internal_btql:
                  T.nilable(T::Hash[Symbol, T.nilable(T.anything)])
              }
            )
          end
          def to_hash
          end
        end

        class ProjectDatasetName < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
            ).returns(T.attached_class)
          end
          def self.new(dataset_name:, project_name:, _internal_btql: nil)
          end

          sig do
            override.returns(
              {
                dataset_name: String,
                project_name: String,
                _internal_btql:
                  T.nilable(T::Hash[Symbol, T.nilable(T.anything)])
              }
            )
          end
          def to_hash
          end
        end

        class DatasetRows < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig { returns(T::Array[T.nilable(T.anything)]) }
          attr_accessor :data

          # Dataset rows
          sig do
            params(data: T::Array[T.nilable(T.anything)]).returns(
              T.attached_class
            )
          end
          def self.new(data:)
          end

          sig { override.returns({ data: T::Array[T.nilable(T.anything)] }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::EvalCreateParams::Data::Variants]
          )
        end
        def self.variants
        end
      end

      # The function to evaluate
      module Score
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::EvalCreateParams::Score::FunctionID,
              Braintrust::EvalCreateParams::Score::ProjectSlug,
              Braintrust::EvalCreateParams::Score::GlobalFunction,
              Braintrust::EvalCreateParams::Score::PromptSessionID,
              Braintrust::EvalCreateParams::Score::InlineCode,
              Braintrust::EvalCreateParams::Score::InlinePrompt
            )
          end

        class FunctionID < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          # The ID of the function
          sig { returns(String) }
          attr_accessor :function_id

          # The version of the function
          sig { returns(T.nilable(String)) }
          attr_reader :version

          sig { params(version: String).void }
          attr_writer :version

          # Function id
          sig do
            params(function_id: String, version: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # The ID of the function
            function_id:,
            # The version of the function
            version: nil
          )
          end

          sig { override.returns({ function_id: String, version: String }) }
          def to_hash
          end
        end

        class ProjectSlug < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
          sig do
            params(project_name: String, slug: String, version: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # The name of the project containing the function
            project_name:,
            # The slug of the function
            slug:,
            # The version of the function
            version: nil
          )
          end

          sig do
            override.returns(
              { project_name: String, slug: String, version: String }
            )
          end
          def to_hash
          end
        end

        class GlobalFunction < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
          )
          end

          sig { override.returns({ global_function: String }) }
          def to_hash
          end
        end

        class PromptSessionID < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
            params(
              prompt_session_function_id: String,
              prompt_session_id: String,
              version: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The ID of the function in the prompt session
            prompt_session_function_id:,
            # The ID of the prompt session
            prompt_session_id:,
            # The version of the function
            version: nil
          )
          end

          sig do
            override.returns(
              {
                prompt_session_function_id: String,
                prompt_session_id: String,
                version: String
              }
            )
          end
          def to_hash
          end
        end

        class InlineCode < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          # The inline code to execute
          sig { returns(String) }
          attr_accessor :code

          sig do
            returns(
              Braintrust::EvalCreateParams::Score::InlineCode::InlineContext
            )
          end
          attr_reader :inline_context

          sig do
            params(
              inline_context:
                Braintrust::EvalCreateParams::Score::InlineCode::InlineContext::OrHash
            ).void
          end
          attr_writer :inline_context

          # The name of the inline code function
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Inline code function
          sig do
            params(
              code: String,
              inline_context:
                Braintrust::EvalCreateParams::Score::InlineCode::InlineContext::OrHash,
              name: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The inline code to execute
            code:,
            inline_context:,
            # The name of the inline code function
            name: nil
          )
          end

          sig do
            override.returns(
              {
                code: String,
                inline_context:
                  Braintrust::EvalCreateParams::Score::InlineCode::InlineContext,
                name: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          class InlineContext < Braintrust::Internal::Type::BaseModel
            OrHash =
              T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

            sig do
              returns(
                Braintrust::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::OrSymbol
              )
            end
            attr_accessor :runtime

            sig { returns(String) }
            attr_accessor :version

            sig do
              params(
                runtime:
                  Braintrust::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::OrSymbol,
                version: String
              ).returns(T.attached_class)
            end
            def self.new(runtime:, version:)
            end

            sig do
              override.returns(
                {
                  runtime:
                    Braintrust::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::OrSymbol,
                  version: String
                }
              )
            end
            def to_hash
            end

            module Runtime
              extend Braintrust::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Braintrust::EvalCreateParams::Score::InlineCode::InlineContext::Runtime
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              NODE =
                T.let(
                  :node,
                  Braintrust::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::TaggedSymbol
                )
              PYTHON =
                T.let(
                  :python,
                  Braintrust::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Braintrust::EvalCreateParams::Score::InlineCode::InlineContext::Runtime::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class InlinePrompt < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          # The prompt, model, and its parameters
          sig { returns(T.nilable(Braintrust::PromptData)) }
          attr_reader :inline_prompt

          sig do
            params(
              inline_prompt: T.nilable(Braintrust::PromptData::OrHash)
            ).void
          end
          attr_writer :inline_prompt

          # The name of the inline prompt
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Inline prompt definition
          sig do
            params(
              inline_prompt: T.nilable(Braintrust::PromptData::OrHash),
              name: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The prompt, model, and its parameters
            inline_prompt:,
            # The name of the inline prompt
            name: nil
          )
          end

          sig do
            override.returns(
              {
                inline_prompt: T.nilable(Braintrust::PromptData),
                name: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::EvalCreateParams::Score::Variants]
          )
        end
        def self.variants
        end
      end

      # The function to evaluate
      module Task
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::EvalCreateParams::Task::FunctionID,
              Braintrust::EvalCreateParams::Task::ProjectSlug,
              Braintrust::EvalCreateParams::Task::GlobalFunction,
              Braintrust::EvalCreateParams::Task::PromptSessionID,
              Braintrust::EvalCreateParams::Task::InlineCode,
              Braintrust::EvalCreateParams::Task::InlinePrompt
            )
          end

        class FunctionID < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          # The ID of the function
          sig { returns(String) }
          attr_accessor :function_id

          # The version of the function
          sig { returns(T.nilable(String)) }
          attr_reader :version

          sig { params(version: String).void }
          attr_writer :version

          # Function id
          sig do
            params(function_id: String, version: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # The ID of the function
            function_id:,
            # The version of the function
            version: nil
          )
          end

          sig { override.returns({ function_id: String, version: String }) }
          def to_hash
          end
        end

        class ProjectSlug < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
          sig do
            params(project_name: String, slug: String, version: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # The name of the project containing the function
            project_name:,
            # The slug of the function
            slug:,
            # The version of the function
            version: nil
          )
          end

          sig do
            override.returns(
              { project_name: String, slug: String, version: String }
            )
          end
          def to_hash
          end
        end

        class GlobalFunction < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
          )
          end

          sig { override.returns({ global_function: String }) }
          def to_hash
          end
        end

        class PromptSessionID < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
            params(
              prompt_session_function_id: String,
              prompt_session_id: String,
              version: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The ID of the function in the prompt session
            prompt_session_function_id:,
            # The ID of the prompt session
            prompt_session_id:,
            # The version of the function
            version: nil
          )
          end

          sig do
            override.returns(
              {
                prompt_session_function_id: String,
                prompt_session_id: String,
                version: String
              }
            )
          end
          def to_hash
          end
        end

        class InlineCode < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          # The inline code to execute
          sig { returns(String) }
          attr_accessor :code

          sig do
            returns(
              Braintrust::EvalCreateParams::Task::InlineCode::InlineContext
            )
          end
          attr_reader :inline_context

          sig do
            params(
              inline_context:
                Braintrust::EvalCreateParams::Task::InlineCode::InlineContext::OrHash
            ).void
          end
          attr_writer :inline_context

          # The name of the inline code function
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Inline code function
          sig do
            params(
              code: String,
              inline_context:
                Braintrust::EvalCreateParams::Task::InlineCode::InlineContext::OrHash,
              name: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The inline code to execute
            code:,
            inline_context:,
            # The name of the inline code function
            name: nil
          )
          end

          sig do
            override.returns(
              {
                code: String,
                inline_context:
                  Braintrust::EvalCreateParams::Task::InlineCode::InlineContext,
                name: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          class InlineContext < Braintrust::Internal::Type::BaseModel
            OrHash =
              T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

            sig do
              returns(
                Braintrust::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::OrSymbol
              )
            end
            attr_accessor :runtime

            sig { returns(String) }
            attr_accessor :version

            sig do
              params(
                runtime:
                  Braintrust::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::OrSymbol,
                version: String
              ).returns(T.attached_class)
            end
            def self.new(runtime:, version:)
            end

            sig do
              override.returns(
                {
                  runtime:
                    Braintrust::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::OrSymbol,
                  version: String
                }
              )
            end
            def to_hash
            end

            module Runtime
              extend Braintrust::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Braintrust::EvalCreateParams::Task::InlineCode::InlineContext::Runtime
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              NODE =
                T.let(
                  :node,
                  Braintrust::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::TaggedSymbol
                )
              PYTHON =
                T.let(
                  :python,
                  Braintrust::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Braintrust::EvalCreateParams::Task::InlineCode::InlineContext::Runtime::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class InlinePrompt < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          # The prompt, model, and its parameters
          sig { returns(T.nilable(Braintrust::PromptData)) }
          attr_reader :inline_prompt

          sig do
            params(
              inline_prompt: T.nilable(Braintrust::PromptData::OrHash)
            ).void
          end
          attr_writer :inline_prompt

          # The name of the inline prompt
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # Inline prompt definition
          sig do
            params(
              inline_prompt: T.nilable(Braintrust::PromptData::OrHash),
              name: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The prompt, model, and its parameters
            inline_prompt:,
            # The name of the inline prompt
            name: nil
          )
          end

          sig do
            override.returns(
              {
                inline_prompt: T.nilable(Braintrust::PromptData),
                name: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::EvalCreateParams::Task::Variants]
          )
        end
        def self.variants
        end
      end

      class GitMetadataSettings < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

        sig do
          returns(
            Braintrust::EvalCreateParams::GitMetadataSettings::Collect::OrSymbol
          )
        end
        attr_accessor :collect

        sig do
          returns(
            T.nilable(
              T::Array[
                Braintrust::EvalCreateParams::GitMetadataSettings::Field::OrSymbol
              ]
            )
          )
        end
        attr_reader :fields

        sig do
          params(
            fields:
              T::Array[
                Braintrust::EvalCreateParams::GitMetadataSettings::Field::OrSymbol
              ]
          ).void
        end
        attr_writer :fields

        # Optional settings for collecting git metadata. By default, will collect all git
        # metadata fields allowed in org-level settings.
        sig do
          params(
            collect:
              Braintrust::EvalCreateParams::GitMetadataSettings::Collect::OrSymbol,
            fields:
              T::Array[
                Braintrust::EvalCreateParams::GitMetadataSettings::Field::OrSymbol
              ]
          ).returns(T.attached_class)
        end
        def self.new(collect:, fields: nil)
        end

        sig do
          override.returns(
            {
              collect:
                Braintrust::EvalCreateParams::GitMetadataSettings::Collect::OrSymbol,
              fields:
                T::Array[
                  Braintrust::EvalCreateParams::GitMetadataSettings::Field::OrSymbol
                ]
            }
          )
        end
        def to_hash
        end

        module Collect
          extend Braintrust::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Braintrust::EvalCreateParams::GitMetadataSettings::Collect
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL =
            T.let(
              :all,
              Braintrust::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              Braintrust::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol
            )
          SOME =
            T.let(
              :some,
              Braintrust::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Braintrust::EvalCreateParams::GitMetadataSettings::Collect::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Field
          extend Braintrust::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Braintrust::EvalCreateParams::GitMetadataSettings::Field
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          COMMIT =
            T.let(
              :commit,
              Braintrust::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol
            )
          BRANCH =
            T.let(
              :branch,
              Braintrust::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol
            )
          TAG =
            T.let(
              :tag,
              Braintrust::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol
            )
          DIRTY =
            T.let(
              :dirty,
              Braintrust::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol
            )
          AUTHOR_NAME =
            T.let(
              :author_name,
              Braintrust::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol
            )
          AUTHOR_EMAIL =
            T.let(
              :author_email,
              Braintrust::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol
            )
          COMMIT_MESSAGE =
            T.let(
              :commit_message,
              Braintrust::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol
            )
          COMMIT_TIME =
            T.let(
              :commit_time,
              Braintrust::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol
            )
          GIT_DIFF =
            T.let(
              :git_diff,
              Braintrust::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Braintrust::EvalCreateParams::GitMetadataSettings::Field::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Options for tracing the evaluation
      module Parent
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::EvalCreateParams::Parent::SpanParentStruct,
              String
            )
          end

        class SpanParentStruct < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          # The id of the container object you are logging to
          sig { returns(String) }
          attr_accessor :object_id_

          sig do
            returns(
              Braintrust::EvalCreateParams::Parent::SpanParentStruct::ObjectType::OrSymbol
            )
          end
          attr_accessor :object_type

          # Include these properties in every span created under this parent
          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          attr_accessor :propagated_event

          # Identifiers for the row to to log a subspan under
          sig do
            returns(
              T.nilable(
                Braintrust::EvalCreateParams::Parent::SpanParentStruct::RowIDs
              )
            )
          end
          attr_reader :row_ids

          sig do
            params(
              row_ids:
                T.nilable(
                  Braintrust::EvalCreateParams::Parent::SpanParentStruct::RowIDs::OrHash
                )
            ).void
          end
          attr_writer :row_ids

          # Span parent properties
          sig do
            params(
              object_id_: String,
              object_type:
                Braintrust::EvalCreateParams::Parent::SpanParentStruct::ObjectType::OrSymbol,
              propagated_event:
                T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              row_ids:
                T.nilable(
                  Braintrust::EvalCreateParams::Parent::SpanParentStruct::RowIDs::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The id of the container object you are logging to
            object_id_:,
            object_type:,
            # Include these properties in every span created under this parent
            propagated_event: nil,
            # Identifiers for the row to to log a subspan under
            row_ids: nil
          )
          end

          sig do
            override.returns(
              {
                object_id_: String,
                object_type:
                  Braintrust::EvalCreateParams::Parent::SpanParentStruct::ObjectType::OrSymbol,
                propagated_event:
                  T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
                row_ids:
                  T.nilable(
                    Braintrust::EvalCreateParams::Parent::SpanParentStruct::RowIDs
                  )
              }
            )
          end
          def to_hash
          end

          module ObjectType
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::EvalCreateParams::Parent::SpanParentStruct::ObjectType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PROJECT_LOGS =
              T.let(
                :project_logs,
                Braintrust::EvalCreateParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )
            EXPERIMENT =
              T.let(
                :experiment,
                Braintrust::EvalCreateParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )
            PLAYGROUND_LOGS =
              T.let(
                :playground_logs,
                Braintrust::EvalCreateParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::EvalCreateParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class RowIDs < Braintrust::Internal::Type::BaseModel
            OrHash =
              T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
            sig do
              params(id: String, root_span_id: String, span_id: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The id of the row
              id:,
              # The root_span_id of the row
              root_span_id:,
              # The span_id of the row
              span_id:
            )
            end

            sig do
              override.returns(
                { id: String, root_span_id: String, span_id: String }
              )
            end
            def to_hash
            end
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::EvalCreateParams::Parent::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
