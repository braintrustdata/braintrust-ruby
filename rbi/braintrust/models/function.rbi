# typed: strong

module Braintrust
  module Models
    class Function < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Unique identifier for the prompt
      sig { returns(String) }
      attr_accessor :id

      # The transaction id of an event is unique to the network operation that processed
      # the event insertion. Transaction ids are monotonically increasing over time and
      # can be used to retrieve a versioned snapshot of the prompt (see the `version`
      # parameter)
      sig { returns(String) }
      attr_accessor :_xact_id

      sig do
        returns(
          T.any(
            Braintrust::Function::FunctionData::Prompt,
            Braintrust::Function::FunctionData::Code,
            Braintrust::Function::FunctionData::Global
          )
        )
      end
      attr_accessor :function_data

      # A literal 'p' which identifies the object as a project prompt
      sig { returns(Braintrust::Function::LogID::TaggedSymbol) }
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
      sig { returns(T.nilable(Braintrust::Function::FunctionSchema)) }
      attr_reader :function_schema

      sig do
        params(
          function_schema:
            T.nilable(Braintrust::Function::FunctionSchema::OrHash)
        ).void
      end
      attr_writer :function_schema

      sig do
        returns(T.nilable(Braintrust::Function::FunctionType::TaggedSymbol))
      end
      attr_accessor :function_type

      # User-controlled metadata about the prompt
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      sig { returns(T.nilable(Braintrust::Function::Origin)) }
      attr_reader :origin

      sig do
        params(origin: T.nilable(Braintrust::Function::Origin::OrHash)).void
      end
      attr_writer :origin

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::PromptData)) }
      attr_reader :prompt_data

      sig do
        params(prompt_data: T.nilable(Braintrust::PromptData::OrHash)).void
      end
      attr_writer :prompt_data

      # A list of tags for the prompt
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          id: String,
          _xact_id: String,
          function_data:
            T.any(
              Braintrust::Function::FunctionData::Prompt::OrHash,
              Braintrust::Function::FunctionData::Code::OrHash,
              Braintrust::Function::FunctionData::Global::OrHash
            ),
          log_id: Braintrust::Function::LogID::OrSymbol,
          name: String,
          org_id: String,
          project_id: String,
          slug: String,
          created: T.nilable(Time),
          description: T.nilable(String),
          function_schema:
            T.nilable(Braintrust::Function::FunctionSchema::OrHash),
          function_type:
            T.nilable(Braintrust::Function::FunctionType::OrSymbol),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          origin: T.nilable(Braintrust::Function::Origin::OrHash),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          tags: T.nilable(T::Array[String])
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the prompt
        id:,
        # The transaction id of an event is unique to the network operation that processed
        # the event insertion. Transaction ids are monotonically increasing over time and
        # can be used to retrieve a versioned snapshot of the prompt (see the `version`
        # parameter)
        _xact_id:,
        function_data:,
        # A literal 'p' which identifies the object as a project prompt
        log_id:,
        # Name of the prompt
        name:,
        # Unique identifier for the organization
        org_id:,
        # Unique identifier for the project that the prompt belongs under
        project_id:,
        # Unique identifier for the prompt
        slug:,
        # Date of prompt creation
        created: nil,
        # Textual description of the prompt
        description: nil,
        # JSON schema for the function's parameters and return type
        function_schema: nil,
        function_type: nil,
        # User-controlled metadata about the prompt
        metadata: nil,
        origin: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # A list of tags for the prompt
        tags: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            _xact_id: String,
            function_data:
              T.any(
                Braintrust::Function::FunctionData::Prompt,
                Braintrust::Function::FunctionData::Code,
                Braintrust::Function::FunctionData::Global
              ),
            log_id: Braintrust::Function::LogID::TaggedSymbol,
            name: String,
            org_id: String,
            project_id: String,
            slug: String,
            created: T.nilable(Time),
            description: T.nilable(String),
            function_schema: T.nilable(Braintrust::Function::FunctionSchema),
            function_type:
              T.nilable(Braintrust::Function::FunctionType::TaggedSymbol),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
            origin: T.nilable(Braintrust::Function::Origin),
            prompt_data: T.nilable(Braintrust::PromptData),
            tags: T.nilable(T::Array[String])
          }
        )
      end
      def to_hash
      end

      module FunctionData
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::Function::FunctionData::Prompt,
              Braintrust::Function::FunctionData::Code,
              Braintrust::Function::FunctionData::Global
            )
          end

        class Prompt < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig do
            returns(
              Braintrust::Function::FunctionData::Prompt::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              type: Braintrust::Function::FunctionData::Prompt::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Braintrust::Function::FunctionData::Prompt::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Braintrust::Function::FunctionData::Prompt::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PROMPT =
              T.let(
                :prompt,
                Braintrust::Function::FunctionData::Prompt::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::Function::FunctionData::Prompt::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Code < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig do
            returns(
              T.any(
                Braintrust::Function::FunctionData::Code::Data::Bundle,
                Braintrust::Function::FunctionData::Code::Data::Inline
              )
            )
          end
          attr_accessor :data

          sig do
            returns(
              Braintrust::Function::FunctionData::Code::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              data:
                T.any(
                  Braintrust::Function::FunctionData::Code::Data::Bundle::OrHash,
                  Braintrust::Function::FunctionData::Code::Data::Inline::OrHash
                ),
              type: Braintrust::Function::FunctionData::Code::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(data:, type:)
          end

          sig do
            override.returns(
              {
                data:
                  T.any(
                    Braintrust::Function::FunctionData::Code::Data::Bundle,
                    Braintrust::Function::FunctionData::Code::Data::Inline
                  ),
                type:
                  Braintrust::Function::FunctionData::Code::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Data
            extend Braintrust::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Braintrust::Function::FunctionData::Code::Data::Bundle,
                  Braintrust::Function::FunctionData::Code::Data::Inline
                )
              end

            class Bundle < Braintrust::Models::CodeBundle
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig do
                returns(
                  Braintrust::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  type:
                    Braintrust::Function::FunctionData::Code::Data::Bundle::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override.returns(
                  {
                    type:
                      Braintrust::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              module Type
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::Function::FunctionData::Code::Data::Bundle::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                BUNDLE =
                  T.let(
                    :bundle,
                    Braintrust::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::Function::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Inline < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig { returns(String) }
              attr_accessor :code

              sig do
                returns(
                  Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext
                )
              end
              attr_reader :runtime_context

              sig do
                params(
                  runtime_context:
                    Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext::OrHash
                ).void
              end
              attr_writer :runtime_context

              sig do
                returns(
                  Braintrust::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  code: String,
                  runtime_context:
                    Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext::OrHash,
                  type:
                    Braintrust::Function::FunctionData::Code::Data::Inline::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(code:, runtime_context:, type:)
              end

              sig do
                override.returns(
                  {
                    code: String,
                    runtime_context:
                      Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext,
                    type:
                      Braintrust::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                  }
                )
              end
              def to_hash
              end

              class RuntimeContext < Braintrust::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(T.self_type, Braintrust::Internal::AnyHash)
                  end

                sig do
                  returns(
                    Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                  )
                end
                attr_accessor :runtime

                sig { returns(String) }
                attr_accessor :version

                sig do
                  params(
                    runtime:
                      Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
                    version: String
                  ).returns(T.attached_class)
                end
                def self.new(runtime:, version:)
                end

                sig do
                  override.returns(
                    {
                      runtime:
                        Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol,
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
                        Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  NODE =
                    T.let(
                      :node,
                      Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )
                  PYTHON =
                    T.let(
                      :python,
                      Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Braintrust::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              module Type
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::Function::FunctionData::Code::Data::Inline::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                INLINE =
                  T.let(
                    :inline,
                    Braintrust::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::Function::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            sig do
              override.returns(
                T::Array[
                  Braintrust::Function::FunctionData::Code::Data::Variants
                ]
              )
            end
            def self.variants
            end
          end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Braintrust::Function::FunctionData::Code::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CODE =
              T.let(
                :code,
                Braintrust::Function::FunctionData::Code::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::Function::FunctionData::Code::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig { returns(String) }
          attr_accessor :name

          sig do
            returns(
              Braintrust::Function::FunctionData::Global::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              name: String,
              type: Braintrust::Function::FunctionData::Global::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override.returns(
              {
                name: String,
                type:
                  Braintrust::Function::FunctionData::Global::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Braintrust::Function::FunctionData::Global::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GLOBAL =
              T.let(
                :global,
                Braintrust::Function::FunctionData::Global::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::Function::FunctionData::Global::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::Function::FunctionData::Variants]
          )
        end
        def self.variants
        end
      end

      # A literal 'p' which identifies the object as a project prompt
      module LogID
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Braintrust::Function::LogID) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        P = T.let(:p, Braintrust::Function::LogID::TaggedSymbol)

        sig do
          override.returns(T::Array[Braintrust::Function::LogID::TaggedSymbol])
        end
        def self.values
        end
      end

      class FunctionSchema < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

        sig { returns(T.nilable(T.anything)) }
        attr_reader :parameters

        sig { params(parameters: T.anything).void }
        attr_writer :parameters

        sig { returns(T.nilable(T.anything)) }
        attr_reader :returns

        sig { params(returns: T.anything).void }
        attr_writer :returns

        # JSON schema for the function's parameters and return type
        sig do
          params(parameters: T.anything, returns: T.anything).returns(
            T.attached_class
          )
        end
        def self.new(parameters: nil, returns: nil)
        end

        sig do
          override.returns({ parameters: T.anything, returns: T.anything })
        end
        def to_hash
        end
      end

      module FunctionType
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Braintrust::Function::FunctionType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LLM = T.let(:llm, Braintrust::Function::FunctionType::TaggedSymbol)
        SCORER =
          T.let(:scorer, Braintrust::Function::FunctionType::TaggedSymbol)
        TASK = T.let(:task, Braintrust::Function::FunctionType::TaggedSymbol)
        TOOL = T.let(:tool, Braintrust::Function::FunctionType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Braintrust::Function::FunctionType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Origin < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

        # Id of the object the function is originating from
        sig { returns(String) }
        attr_accessor :object_id_

        # The object type that the ACL applies to
        sig { returns(Braintrust::ACLObjectType::TaggedSymbol) }
        attr_accessor :object_type

        # The function exists for internal purposes and should not be displayed in the
        # list of functions.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :internal

        sig do
          params(
            object_id_: String,
            object_type: Braintrust::ACLObjectType::OrSymbol,
            internal: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(
          # Id of the object the function is originating from
          object_id_:,
          # The object type that the ACL applies to
          object_type:,
          # The function exists for internal purposes and should not be displayed in the
          # list of functions.
          internal: nil
        )
        end

        sig do
          override.returns(
            {
              object_id_: String,
              object_type: Braintrust::ACLObjectType::TaggedSymbol,
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
