# typed: strong

module Braintrust
  module Models
    class Function < Braintrust::Internal::Type::BaseModel
      # Unique identifier for the prompt
      sig { returns(String) }
      attr_accessor :id

      # The transaction id of an event is unique to the network operation that processed
      #   the event insertion. Transaction ids are monotonically increasing over time and
      #   can be used to retrieve a versioned snapshot of the prompt (see the `version`
      #   parameter)
      sig { returns(String) }
      attr_accessor :_xact_id

      sig do
        returns(
          T.any(
            Braintrust::Models::Function::FunctionData::Prompt,
            Braintrust::Models::Function::FunctionData::Code,
            Braintrust::Models::Function::FunctionData::Global
          )
        )
      end
      attr_accessor :function_data

      # A literal 'p' which identifies the object as a project prompt
      sig { returns(Braintrust::Models::Function::LogID::TaggedSymbol) }
      attr_accessor :log_id

      # Name of the prompt
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the organization
      sig { returns(String) }
      attr_accessor :org_id

      # Unique identifier for the project that the prompt belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # Unique identifier for the prompt
      sig { returns(String) }
      attr_accessor :slug

      # Date of prompt creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # JSON schema for the function's parameters and return type
      sig { returns(T.nilable(Braintrust::Models::Function::FunctionSchema)) }
      attr_reader :function_schema

      sig do
        params(
          function_schema: T.nilable(T.any(Braintrust::Models::Function::FunctionSchema, Braintrust::Internal::AnyHash))
        )
          .void
      end
      attr_writer :function_schema

      sig { returns(T.nilable(Braintrust::Models::Function::FunctionType::TaggedSymbol)) }
      attr_accessor :function_type

      # User-controlled metadata about the prompt
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      sig { returns(T.nilable(Braintrust::Models::Function::Origin)) }
      attr_reader :origin

      sig { params(origin: T.nilable(T.any(Braintrust::Models::Function::Origin, Braintrust::Internal::AnyHash))).void }
      attr_writer :origin

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      attr_reader :prompt_data

      sig { params(prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::AnyHash))).void }
      attr_writer :prompt_data

      # A list of tags for the prompt
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          id: String,
          _xact_id: String,
          function_data: T.any(
            Braintrust::Models::Function::FunctionData::Prompt,
            Braintrust::Internal::AnyHash,
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
          function_schema: T.nilable(T.any(Braintrust::Models::Function::FunctionSchema, Braintrust::Internal::AnyHash)),
          function_type: T.nilable(Braintrust::Models::Function::FunctionType::OrSymbol),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          origin: T.nilable(T.any(Braintrust::Models::Function::Origin, Braintrust::Internal::AnyHash)),
          prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::AnyHash)),
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
      ); end
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
      def to_hash; end

      module FunctionData
        extend Braintrust::Internal::Type::Union

        class Prompt < Braintrust::Internal::Type::BaseModel
          sig { returns(Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol) }
          attr_accessor :type

          sig { params(type: Braintrust::Models::Function::FunctionData::Prompt::Type::OrSymbol).returns(T.attached_class) }
          def self.new(type:); end

          sig { override.returns({type: Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol}) }
          def to_hash; end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Prompt::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol) }

            PROMPT = T.let(:prompt, Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::Function::FunctionData::Prompt::Type::TaggedSymbol]) }
            def self.values; end
          end
        end

        class Code < Braintrust::Internal::Type::BaseModel
          sig do
            returns(
              T.any(
                Braintrust::Models::Function::FunctionData::Code::Data::Bundle,
                Braintrust::Models::Function::FunctionData::Code::Data::Inline
              )
            )
          end
          attr_accessor :data

          sig { returns(Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol) }
          attr_accessor :type

          sig do
            params(
              data: T.any(
                Braintrust::Models::Function::FunctionData::Code::Data::Bundle,
                Braintrust::Internal::AnyHash,
                Braintrust::Models::Function::FunctionData::Code::Data::Inline
              ),
              type: Braintrust::Models::Function::FunctionData::Code::Type::OrSymbol
            )
              .returns(T.attached_class)
          end
          def self.new(data:, type:); end

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
          def to_hash; end

          module Data
            extend Braintrust::Internal::Type::Union

            class Bundle < Braintrust::Models::CodeBundle
              sig { returns(Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol) }
              attr_accessor :type

              sig do
                params(type: Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::OrSymbol)
                  .returns(T.attached_class)
              end
              def self.new(type:); end

              sig do
                override
                  .returns({type: Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol})
              end
              def to_hash; end

              module Type
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, String, Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol) }

                BUNDLE =
                  T.let(:bundle, Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol)

                sig do
                  override
                    .returns(T::Array[Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol])
                end
                def self.values; end
              end
            end

            class Inline < Braintrust::Internal::Type::BaseModel
              sig { returns(String) }
              attr_accessor :code

              sig { returns(Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext) }
              attr_reader :runtime_context

              sig do
                params(
                  runtime_context: T.any(
                    Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext,
                    Braintrust::Internal::AnyHash
                  )
                )
                  .void
              end
              attr_writer :runtime_context

              sig { returns(Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol) }
              attr_accessor :type

              sig do
                params(
                  code: String,
                  runtime_context: T.any(
                    Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext,
                    Braintrust::Internal::AnyHash
                  ),
                  type: Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::OrSymbol
                )
                  .returns(T.attached_class)
              end
              def self.new(code:, runtime_context:, type:); end

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
              def to_hash; end

              class RuntimeContext < Braintrust::Internal::Type::BaseModel
                sig do
                  returns(
                    Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                  )
                end
                attr_accessor :runtime

                sig { returns(String) }
                attr_accessor :version

                sig do
                  params(
                    runtime: Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
                    version: String
                  )
                    .returns(T.attached_class)
                end
                def self.new(runtime:, version:); end

                sig do
                  override
                    .returns(
                      {
                        runtime: Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol,
                        version: String
                      }
                    )
                end
                def to_hash; end

                module Runtime
                  extend Braintrust::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime) }
                  OrSymbol =
                    T.type_alias do
                      T.any(
                        Symbol,
                        String,
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

                  sig do
                    override
                      .returns(
                        T::Array[Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol]
                      )
                  end
                  def self.values; end
                end
              end

              module Type
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, String, Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol) }

                INLINE =
                  T.let(:inline, Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol)

                sig do
                  override
                    .returns(T::Array[Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol])
                end
                def self.values; end
              end
            end

            sig do
              override
                .returns(
                  [Braintrust::Models::Function::FunctionData::Code::Data::Bundle, Braintrust::Models::Function::FunctionData::Code::Data::Inline]
                )
            end
            def self.variants; end
          end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Code::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol) }

            CODE = T.let(:code, Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::Function::FunctionData::Code::Type::TaggedSymbol]) }
            def self.values; end
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          sig { returns(String) }
          attr_accessor :name

          sig { returns(Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol) }
          attr_accessor :type

          sig do
            params(name: String, type: Braintrust::Models::Function::FunctionData::Global::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(name:, type:); end

          sig do
            override
              .returns({name: String, type: Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol})
          end
          def to_hash; end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionData::Global::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol) }

            GLOBAL = T.let(:global, Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::Function::FunctionData::Global::Type::TaggedSymbol]) }
            def self.values; end
          end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::Function::FunctionData::Prompt, Braintrust::Models::Function::FunctionData::Code, Braintrust::Models::Function::FunctionData::Global]
            )
        end
        def self.variants; end
      end

      # A literal 'p' which identifies the object as a project prompt
      module LogID
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Function::LogID) }
        OrSymbol = T.type_alias { T.any(Symbol, String, Braintrust::Models::Function::LogID::TaggedSymbol) }

        P = T.let(:p, Braintrust::Models::Function::LogID::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::Function::LogID::TaggedSymbol]) }
        def self.values; end
      end

      class FunctionSchema < Braintrust::Internal::Type::BaseModel
        sig { returns(T.nilable(T.anything)) }
        attr_reader :parameters

        sig { params(parameters: T.anything).void }
        attr_writer :parameters

        sig { returns(T.nilable(T.anything)) }
        attr_reader :returns

        sig { params(returns: T.anything).void }
        attr_writer :returns

        # JSON schema for the function's parameters and return type
        sig { params(parameters: T.anything, returns: T.anything).returns(T.attached_class) }
        def self.new(parameters: nil, returns: nil); end

        sig { override.returns({parameters: T.anything, returns: T.anything}) }
        def to_hash; end
      end

      module FunctionType
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Function::FunctionType) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Braintrust::Models::Function::FunctionType::TaggedSymbol) }

        LLM = T.let(:llm, Braintrust::Models::Function::FunctionType::TaggedSymbol)
        SCORER = T.let(:scorer, Braintrust::Models::Function::FunctionType::TaggedSymbol)
        TASK = T.let(:task, Braintrust::Models::Function::FunctionType::TaggedSymbol)
        TOOL = T.let(:tool, Braintrust::Models::Function::FunctionType::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::Function::FunctionType::TaggedSymbol]) }
        def self.values; end
      end

      class Origin < Braintrust::Internal::Type::BaseModel
        # Id of the object the function is originating from
        sig { returns(String) }
        attr_accessor :object_id_

        # The object type that the ACL applies to
        sig { returns(Braintrust::Models::ACLObjectType::TaggedSymbol) }
        attr_accessor :object_type

        # The function exists for internal purposes and should not be displayed in the
        #   list of functions.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :internal

        sig do
          params(
            object_id_: String,
            object_type: Braintrust::Models::ACLObjectType::OrSymbol,
            internal: T.nilable(T::Boolean)
          )
            .returns(T.attached_class)
        end
        def self.new(object_id_:, object_type:, internal: nil); end

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
        def to_hash; end
      end
    end
  end
end
