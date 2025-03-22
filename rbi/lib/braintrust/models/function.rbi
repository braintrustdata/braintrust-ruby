# typed: strong

module Braintrust
  module Models
    class Function < Braintrust::BaseModel
      # Unique identifier for the prompt
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # The transaction id of an event is unique to the network operation that processed
      #   the event insertion. Transaction ids are monotonically increasing over time and
      #   can be used to retrieve a versioned snapshot of the prompt (see the `version`
      #   parameter)
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

      # A literal 'p' which identifies the object as a project prompt
      sig { returns(Braintrust::Models::Function::LogID::TaggedSymbol) }
      def log_id
      end

      sig do
        params(_: Braintrust::Models::Function::LogID::TaggedSymbol)
          .returns(Braintrust::Models::Function::LogID::TaggedSymbol)
      end
      def log_id=(_)
      end

      # Name of the prompt
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Unique identifier for the organization
      sig { returns(String) }
      def org_id
      end

      sig { params(_: String).returns(String) }
      def org_id=(_)
      end

      # Unique identifier for the project that the prompt belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # Unique identifier for the prompt
      sig { returns(String) }
      def slug
      end

      sig { params(_: String).returns(String) }
      def slug=(_)
      end

      # Date of prompt creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # JSON schema for the function's parameters and return type
      sig { returns(T.nilable(Braintrust::Models::Function::FunctionSchema)) }
      def function_schema
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::Function::FunctionSchema, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::Function::FunctionSchema, Braintrust::Util::AnyHash)))
      end
      def function_schema=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::Function::FunctionType::TaggedSymbol)) }
      def function_type
      end

      sig do
        params(_: T.nilable(Braintrust::Models::Function::FunctionType::TaggedSymbol))
          .returns(T.nilable(Braintrust::Models::Function::FunctionType::TaggedSymbol))
      end
      def function_type=(_)
      end

      # User-controlled metadata about the prompt
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
        params(_: T.nilable(T.any(Braintrust::Models::Function::Origin, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::Function::Origin, Braintrust::Util::AnyHash)))
      end
      def origin=(_)
      end

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)))
      end
      def prompt_data=(_)
      end

      # A list of tags for the prompt
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
            Braintrust::Util::AnyHash,
            Braintrust::Models::Function::FunctionData::Code,
            Braintrust::Models::Function::FunctionData::Global
          ),
          log_id: Braintrust::Models::Function::LogID::OrSymbol,
          name: String,
          org_id: String,
          project_id: String,
          slug: String,
          created: T.nilable(Time),
          description: T.nilable(String),
          function_schema: T.nilable(T.any(Braintrust::Models::Function::FunctionSchema, Braintrust::Util::AnyHash)),
          function_type: T.nilable(Braintrust::Models::Function::FunctionType::OrSymbol),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          origin: T.nilable(T.any(Braintrust::Models::Function::Origin, Braintrust::Util::AnyHash)),
          prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)),
          tags: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(
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
              log_id: Braintrust::Models::Function::LogID::TaggedSymbol,
              name: String,
              org_id: String,
              project_id: String,
              slug: String,
              created: T.nilable(Time),
              description: T.nilable(String),
              function_schema: T.nilable(Braintrust::Models::Function::FunctionSchema),
              function_type: T.nilable(Braintrust::Models::Function::FunctionType::TaggedSymbol),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              origin: T.nilable(Braintrust::Models::Function::Origin),
              prompt_data: T.nilable(Braintrust::Models::PromptData),
              tags: T.nilable(T::Array[String])
            }
          )
      end
      def to_hash
      end

      module FunctionData
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Braintrust::Models::Function::FunctionData::Prompt,
                Braintrust::Models::Function::FunctionData::Code,
                Braintrust::Models::Function::FunctionData::Global
              )
            }
          end

        class Prompt < Braintrust::BaseModel
          sig { returns(Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol)
              .returns(Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol)
          end
          def type=(_)
          end

          sig { params(type: Braintrust::Models::Function::FunctionData::Prompt::Type::OrSymbol).returns(T.attached_class) }
          def self.new(type:)
          end

          sig { override.returns({type: Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol}) }
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Prompt::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol) }

            PROMPT = T.let(:prompt, Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol)

            class << self
              sig { override.returns(T::Array[Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol]) }
              def values
              end
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

          sig { returns(Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol)
              .returns(Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol)
          end
          def type=(_)
          end

          sig do
            params(
              data: T.any(
                Braintrust::Models::Function::FunctionData::Code::Data::Bundle,
                Braintrust::Util::AnyHash,
                Braintrust::Models::Function::FunctionData::Code::Data::Inline
              ),
              type: Braintrust::Models::Function::FunctionData::Code::Type::OrSymbol
            )
              .returns(T.attached_class)
          end
          def self.new(data:, type:)
          end

          sig do
            override
              .returns(
                {
                  data: T.any(
                    Braintrust::Models::Function::FunctionData::Code::Data::Bundle,
                    Braintrust::Models::Function::FunctionData::Code::Data::Inline
                  ),
                  type: Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol
                }
              )
          end
          def to_hash
          end

          module Data
            extend Braintrust::Union

            Variants =
              type_template(:out) do
                {
                  fixed: T.any(
                    Braintrust::Models::Function::FunctionData::Code::Data::Bundle,
                    Braintrust::Models::Function::FunctionData::Code::Data::Inline
                  )
                }
              end

            class Bundle < Braintrust::Models::CodeBundle
              sig { returns(Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol) }
              def type
              end

              sig do
                params(_: Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol)
                  .returns(Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol)
              end
              def type=(_)
              end

              sig do
                params(type: Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::OrSymbol)
                  .returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override
                  .returns({type: Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol})
              end
              def to_hash
              end

              module Type
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol) }

                BUNDLE =
                  T.let(:bundle, Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol)

                class << self
                  sig do
                    override
                      .returns(T::Array[Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol])
                  end
                  def values
                  end
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
                params(
                  _: T.any(
                    Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext,
                    Braintrust::Util::AnyHash
                  )
                )
                  .returns(
                    T.any(
                      Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext,
                      Braintrust::Util::AnyHash
                    )
                  )
              end
              def runtime_context=(_)
              end

              sig { returns(Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol) }
              def type
              end

              sig do
                params(_: Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol)
                  .returns(Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol)
              end
              def type=(_)
              end

              sig do
                params(
                  code: String,
                  runtime_context: T.any(
                    Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext,
                    Braintrust::Util::AnyHash
                  ),
                  type: Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::OrSymbol
                )
                  .returns(T.attached_class)
              end
              def self.new(code:, runtime_context:, type:)
              end

              sig do
                override
                  .returns(
                    {
                      code: String,
                      runtime_context: Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext,
                      type: Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                    }
                  )
              end
              def to_hash
              end

              class RuntimeContext < Braintrust::BaseModel
                sig do
                  returns(
                    Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                  )
                end
                def runtime
                end

                sig do
                  params(
                    _: Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                  )
                    .returns(
                      Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )
                end
                def runtime=(_)
                end

                sig { returns(String) }
                def version
                end

                sig { params(_: String).returns(String) }
                def version=(_)
                end

                sig do
                  params(
                    runtime: Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
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
                        runtime: Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol,
                        version: String
                      }
                    )
                end
                def to_hash
                end

                module Runtime
                  extend Braintrust::Enum

                  TaggedSymbol =
                    T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime) }
                  OrSymbol =
                    T.type_alias do
                      T.any(
                        Symbol,
                        Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                      )
                    end

                  NODE =
                    T.let(
                      :node,
                      Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )
                  PYTHON =
                    T.let(
                      :python,
                      Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )

                  class << self
                    sig do
                      override
                        .returns(
                          T::Array[Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol]
                        )
                    end
                    def values
                    end
                  end
                end
              end

              module Type
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol) }

                INLINE =
                  T.let(:inline, Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol)

                class << self
                  sig do
                    override
                      .returns(T::Array[Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol])
                  end
                  def values
                  end
                end
              end
            end

            class << self
              sig do
                override
                  .returns(
                    [Braintrust::Models::Function::FunctionData::Code::Data::Bundle, Braintrust::Models::Function::FunctionData::Code::Data::Inline]
                  )
              end
              def variants
              end
            end
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Code::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol) }

            CODE = T.let(:code, Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol)

            class << self
              sig { override.returns(T::Array[Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol]) }
              def values
              end
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

          sig { returns(Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol)
              .returns(Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol)
          end
          def type=(_)
          end

          sig do
            params(name: String, type: Braintrust::Models::Function::FunctionData::Global::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override
              .returns({name: String, type: Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol})
          end
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Global::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol) }

            GLOBAL = T.let(:global, Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol)

            class << self
              sig { override.returns(T::Array[Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol]) }
              def values
              end
            end
          end
        end

        class << self
          sig do
            override
              .returns(
                [Braintrust::Models::Function::FunctionData::Prompt, Braintrust::Models::Function::FunctionData::Code, Braintrust::Models::Function::FunctionData::Global]
              )
          end
          def variants
          end
        end
      end

      # A literal 'p' which identifies the object as a project prompt
      module LogID
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Function::LogID) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::Function::LogID::TaggedSymbol) }

        P = T.let(:p, Braintrust::Models::Function::LogID::TaggedSymbol)

        class << self
          sig { override.returns(T::Array[Braintrust::Models::Function::LogID::TaggedSymbol]) }
          def values
          end
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

        # JSON schema for the function's parameters and return type
        sig { params(parameters: T.anything, returns: T.anything).returns(T.attached_class) }
        def self.new(parameters: nil, returns: nil)
        end

        sig { override.returns({parameters: T.anything, returns: T.anything}) }
        def to_hash
        end
      end

      module FunctionType
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionType) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::Function::FunctionType::TaggedSymbol) }

        LLM = T.let(:llm, Braintrust::Models::Function::FunctionType::TaggedSymbol)
        SCORER = T.let(:scorer, Braintrust::Models::Function::FunctionType::TaggedSymbol)
        TASK = T.let(:task, Braintrust::Models::Function::FunctionType::TaggedSymbol)
        TOOL = T.let(:tool, Braintrust::Models::Function::FunctionType::TaggedSymbol)

        class << self
          sig { override.returns(T::Array[Braintrust::Models::Function::FunctionType::TaggedSymbol]) }
          def values
          end
        end
      end

      class Origin < Braintrust::BaseModel
        # Id of the object the function is originating from
        sig { returns(String) }
        def object_id_
        end

        sig { params(_: String).returns(String) }
        def object_id_=(_)
        end

        # The object type that the ACL applies to
        sig { returns(Braintrust::Models::ACLObjectType::TaggedSymbol) }
        def object_type
        end

        sig do
          params(_: Braintrust::Models::ACLObjectType::TaggedSymbol)
            .returns(Braintrust::Models::ACLObjectType::TaggedSymbol)
        end
        def object_type=(_)
        end

        # The function exists for internal purposes and should not be displayed in the
        #   list of functions.
        sig { returns(T.nilable(T::Boolean)) }
        def internal
        end

        sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
        def internal=(_)
        end

        sig do
          params(
            object_id_: String,
            object_type: Braintrust::Models::ACLObjectType::OrSymbol,
            internal: T.nilable(T::Boolean)
          )
            .returns(T.attached_class)
        end
        def self.new(object_id_:, object_type:, internal: nil)
        end

        sig do
          override
            .returns(
              {
                object_id_: String,
                object_type: Braintrust::Models::ACLObjectType::TaggedSymbol,
                internal: T.nilable(T::Boolean)
              }
            )
        end
        def to_hash
        end
      end
    end
  end
end
