# typed: strong

module Braintrust
  module Models
    class Function < Braintrust::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig { returns(String) }
      def _xact_id
      end

      sig { params(_: String).returns(String) }
      def _xact_id=(_)
      end

      sig do
        returns(
          T.any(
            Braintrust::Models::Function::FunctionData::Prompt,
            Braintrust::Models::Function::FunctionData::Code,
            Braintrust::Models::Function::FunctionData::Global
          )
        )
      end
      def function_data
      end

      sig do
        params(
          _: T.any(
            Braintrust::Models::Function::FunctionData::Prompt,
            Braintrust::Models::Function::FunctionData::Code,
            Braintrust::Models::Function::FunctionData::Global
          )
        )
          .returns(
            T.any(
              Braintrust::Models::Function::FunctionData::Prompt,
              Braintrust::Models::Function::FunctionData::Code,
              Braintrust::Models::Function::FunctionData::Global
            )
          )
      end
      def function_data=(_)
      end

      sig { returns(Symbol) }
      def log_id
      end

      sig { params(_: Symbol).returns(Symbol) }
      def log_id=(_)
      end

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(String) }
      def org_id
      end

      sig { params(_: String).returns(String) }
      def org_id=(_)
      end

      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      sig { returns(String) }
      def slug
      end

      sig { params(_: String).returns(String) }
      def slug=(_)
      end

      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::Function::FunctionSchema)) }
      def function_schema
      end

      sig do
        params(_: T.nilable(Braintrust::Models::Function::FunctionSchema))
          .returns(T.nilable(Braintrust::Models::Function::FunctionSchema))
      end
      def function_schema=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def function_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def function_type=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::Function::Origin)) }
      def origin
      end

      sig do
        params(_: T.nilable(Braintrust::Models::Function::Origin))
          .returns(T.nilable(Braintrust::Models::Function::Origin))
      end
      def origin=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data
      end

      sig { params(_: T.nilable(Braintrust::Models::PromptData)).returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def tags
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def tags=(_)
      end

      sig do
        params(
          id: String,
          _xact_id: String,
          function_data: T.any(
            Braintrust::Models::Function::FunctionData::Prompt,
            Braintrust::Models::Function::FunctionData::Code,
            Braintrust::Models::Function::FunctionData::Global
          ),
          log_id: Symbol,
          name: String,
          org_id: String,
          project_id: String,
          slug: String,
          created: T.nilable(Time),
          description: T.nilable(String),
          function_schema: T.nilable(Braintrust::Models::Function::FunctionSchema),
          function_type: T.nilable(Symbol),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          origin: T.nilable(Braintrust::Models::Function::Origin),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          tags: T.nilable(T::Array[String])
        )
          .void
      end
      def initialize(
        id:,
        _xact_id:,
        function_data:,
        log_id:,
        name:,
        org_id:,
        project_id:,
        slug:,
        created: nil,
        description: nil,
        function_schema: nil,
        function_type: nil,
        metadata: nil,
        origin: nil,
        prompt_data: nil,
        tags: nil
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              _xact_id: String,
              function_data: T.any(
                Braintrust::Models::Function::FunctionData::Prompt,
                Braintrust::Models::Function::FunctionData::Code,
                Braintrust::Models::Function::FunctionData::Global
              ),
              log_id: Symbol,
              name: String,
              org_id: String,
              project_id: String,
              slug: String,
              created: T.nilable(Time),
              description: T.nilable(String),
              function_schema: T.nilable(Braintrust::Models::Function::FunctionSchema),
              function_type: T.nilable(Symbol),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              origin: T.nilable(Braintrust::Models::Function::Origin),
              prompt_data: T.nilable(Braintrust::Models::PromptData),
              tags: T.nilable(T::Array[String])
            }
          )
      end
      def to_hash
      end

      class FunctionData < Braintrust::Union
        abstract!

        class Prompt < Braintrust::BaseModel
          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(type: Symbol).void }
          def initialize(type:)
          end

          sig { override.returns({type: Symbol}) }
          def to_hash
          end

          class Type < Braintrust::Enum
            abstract!

            PROMPT = :prompt

            sig { override.returns(T::Array[Symbol]) }
            def self.values
            end
          end
        end

        class Code < Braintrust::BaseModel
          sig do
            returns(
              T.any(
                Braintrust::Models::Function::FunctionData::Code::Data::Bundle,
                Braintrust::Models::Function::FunctionData::Code::Data::Inline
              )
            )
          end
          def data
          end

          sig do
            params(
              _: T.any(
                Braintrust::Models::Function::FunctionData::Code::Data::Bundle,
                Braintrust::Models::Function::FunctionData::Code::Data::Inline
              )
            )
              .returns(
                T.any(
                  Braintrust::Models::Function::FunctionData::Code::Data::Bundle,
                  Braintrust::Models::Function::FunctionData::Code::Data::Inline
                )
              )
          end
          def data=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig do
            params(
              data: T.any(
                Braintrust::Models::Function::FunctionData::Code::Data::Bundle,
                Braintrust::Models::Function::FunctionData::Code::Data::Inline
              ),
              type: Symbol
            )
              .void
          end
          def initialize(data:, type:)
          end

          sig do
            override
              .returns(
                {
                  data: T.any(
                    Braintrust::Models::Function::FunctionData::Code::Data::Bundle,
                    Braintrust::Models::Function::FunctionData::Code::Data::Inline
                  ),
                  type: Symbol
                }
              )
          end
          def to_hash
          end

          class Data < Braintrust::Union
            abstract!

            class Bundle < Braintrust::Models::CodeBundle
              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig { params(type: Symbol).void }
              def initialize(type:)
              end

              sig { override.returns({type: Symbol}) }
              def to_hash
              end

              class Type < Braintrust::Enum
                abstract!

                BUNDLE = :bundle

                sig { override.returns(T::Array[Symbol]) }
                def self.values
                end
              end
            end

            class Inline < Braintrust::BaseModel
              sig { returns(String) }
              def code
              end

              sig { params(_: String).returns(String) }
              def code=(_)
              end

              sig { returns(Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext) }
              def runtime_context
              end

              sig do
                params(_: Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext)
                  .returns(Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext)
              end
              def runtime_context=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                params(
                  code: String,
                  runtime_context: Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext,
                  type: Symbol
                )
                  .void
              end
              def initialize(code:, runtime_context:, type:)
              end

              sig do
                override
                  .returns(
                    {
                      code: String,
                      runtime_context: Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext,
                      type: Symbol
                    }
                  )
              end
              def to_hash
              end

              class RuntimeContext < Braintrust::BaseModel
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

                sig { params(runtime: Symbol, version: String).void }
                def initialize(runtime:, version:)
                end

                sig { override.returns({runtime: Symbol, version: String}) }
                def to_hash
                end

                class Runtime < Braintrust::Enum
                  abstract!

                  NODE = :node
                  PYTHON = :python

                  sig { override.returns(T::Array[Symbol]) }
                  def self.values
                  end
                end
              end

              class Type < Braintrust::Enum
                abstract!

                INLINE = :inline

                sig { override.returns(T::Array[Symbol]) }
                def self.values
                end
              end
            end

            sig do
              override
                .returns(
                  [[NilClass, Braintrust::Models::Function::FunctionData::Code::Data::Bundle], [NilClass, Braintrust::Models::Function::FunctionData::Code::Data::Inline]]
                )
            end
            private_class_method def self.variants
            end
          end

          class Type < Braintrust::Enum
            abstract!

            CODE = :code

            sig { override.returns(T::Array[Symbol]) }
            def self.values
            end
          end
        end

        class Global < Braintrust::BaseModel
          sig { returns(String) }
          def name
          end

          sig { params(_: String).returns(String) }
          def name=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(name: String, type: Symbol).void }
          def initialize(name:, type:)
          end

          sig { override.returns({name: String, type: Symbol}) }
          def to_hash
          end

          class Type < Braintrust::Enum
            abstract!

            GLOBAL = :global

            sig { override.returns(T::Array[Symbol]) }
            def self.values
            end
          end
        end

        sig do
          override
            .returns(
              [[NilClass, Braintrust::Models::Function::FunctionData::Prompt], [NilClass, Braintrust::Models::Function::FunctionData::Code], [NilClass, Braintrust::Models::Function::FunctionData::Global]]
            )
        end
        private_class_method def self.variants
        end
      end

      class LogID < Braintrust::Enum
        abstract!

        P = :p

        sig { override.returns(T::Array[Symbol]) }
        def self.values
        end
      end

      class FunctionSchema < Braintrust::BaseModel
        sig { returns(T.nilable(T.anything)) }
        def parameters
        end

        sig { params(_: T.anything).returns(T.anything) }
        def parameters=(_)
        end

        sig { returns(T.nilable(T.anything)) }
        def returns
        end

        sig { params(_: T.anything).returns(T.anything) }
        def returns=(_)
        end

        sig { params(parameters: T.anything, returns: T.anything).void }
        def initialize(parameters: nil, returns: nil)
        end

        sig { override.returns({parameters: T.anything, returns: T.anything}) }
        def to_hash
        end
      end

      class FunctionType < Braintrust::Enum
        abstract!

        LLM = T.let(:llm, T.nilable(Symbol))
        SCORER = T.let(:scorer, T.nilable(Symbol))
        TASK = T.let(:task, T.nilable(Symbol))
        TOOL = T.let(:tool, T.nilable(Symbol))

        sig { override.returns(T::Array[Symbol]) }
        def self.values
        end
      end

      class Origin < Braintrust::BaseModel
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

        sig { returns(T.nilable(T::Boolean)) }
        def internal
        end

        sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
        def internal=(_)
        end

        sig { params(object_id_: String, object_type: Symbol, internal: T.nilable(T::Boolean)).void }
        def initialize(object_id_:, object_type:, internal: nil)
        end

        sig { override.returns({object_id_: String, object_type: Symbol, internal: T.nilable(T::Boolean)}) }
        def to_hash
        end

        class ObjectType < Braintrust::Enum
          abstract!

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

          sig { override.returns(T::Array[Symbol]) }
          def self.values
          end
        end
      end
    end
  end
end
