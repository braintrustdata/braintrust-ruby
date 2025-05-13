# typed: strong

module Braintrust
  module Models
    class FunctionReplaceParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Braintrust::FunctionReplaceParams,
            Braintrust::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.any(
            Braintrust::FunctionReplaceParams::FunctionData::Prompt,
            Braintrust::FunctionReplaceParams::FunctionData::Code,
            Braintrust::FunctionReplaceParams::FunctionData::Global
          )
        )
      end
      attr_accessor :function_data

      # Name of the prompt
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the prompt belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # Unique identifier for the prompt
      sig { returns(String) }
      attr_accessor :slug

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # JSON schema for the function's parameters and return type
      sig do
        returns(T.nilable(Braintrust::FunctionReplaceParams::FunctionSchema))
      end
      attr_reader :function_schema

      sig do
        params(
          function_schema:
            T.nilable(Braintrust::FunctionReplaceParams::FunctionSchema::OrHash)
        ).void
      end
      attr_writer :function_schema

      sig do
        returns(
          T.nilable(Braintrust::FunctionReplaceParams::FunctionType::OrSymbol)
        )
      end
      attr_accessor :function_type

      sig { returns(T.nilable(Braintrust::FunctionReplaceParams::Origin)) }
      attr_reader :origin

      sig do
        params(
          origin: T.nilable(Braintrust::FunctionReplaceParams::Origin::OrHash)
        ).void
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
          function_data:
            T.any(
              Braintrust::FunctionReplaceParams::FunctionData::Prompt::OrHash,
              Braintrust::FunctionReplaceParams::FunctionData::Code::OrHash,
              Braintrust::FunctionReplaceParams::FunctionData::Global::OrHash
            ),
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_schema:
            T.nilable(
              Braintrust::FunctionReplaceParams::FunctionSchema::OrHash
            ),
          function_type:
            T.nilable(
              Braintrust::FunctionReplaceParams::FunctionType::OrSymbol
            ),
          origin: T.nilable(Braintrust::FunctionReplaceParams::Origin::OrHash),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          tags: T.nilable(T::Array[String]),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        function_data:,
        # Name of the prompt
        name:,
        # Unique identifier for the project that the prompt belongs under
        project_id:,
        # Unique identifier for the prompt
        slug:,
        # Textual description of the prompt
        description: nil,
        # JSON schema for the function's parameters and return type
        function_schema: nil,
        function_type: nil,
        origin: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # A list of tags for the prompt
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            function_data:
              T.any(
                Braintrust::FunctionReplaceParams::FunctionData::Prompt,
                Braintrust::FunctionReplaceParams::FunctionData::Code,
                Braintrust::FunctionReplaceParams::FunctionData::Global
              ),
            name: String,
            project_id: String,
            slug: String,
            description: T.nilable(String),
            function_schema:
              T.nilable(Braintrust::FunctionReplaceParams::FunctionSchema),
            function_type:
              T.nilable(
                Braintrust::FunctionReplaceParams::FunctionType::OrSymbol
              ),
            origin: T.nilable(Braintrust::FunctionReplaceParams::Origin),
            prompt_data: T.nilable(Braintrust::PromptData),
            tags: T.nilable(T::Array[String]),
            request_options: Braintrust::RequestOptions
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
              Braintrust::FunctionReplaceParams::FunctionData::Prompt,
              Braintrust::FunctionReplaceParams::FunctionData::Code,
              Braintrust::FunctionReplaceParams::FunctionData::Global
            )
          end

        class Prompt < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::FunctionReplaceParams::FunctionData::Prompt,
                Braintrust::Internal::AnyHash
              )
            end

          sig do
            returns(
              Braintrust::FunctionReplaceParams::FunctionData::Prompt::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              type:
                Braintrust::FunctionReplaceParams::FunctionData::Prompt::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Braintrust::FunctionReplaceParams::FunctionData::Prompt::Type::OrSymbol
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
                  Braintrust::FunctionReplaceParams::FunctionData::Prompt::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PROMPT =
              T.let(
                :prompt,
                Braintrust::FunctionReplaceParams::FunctionData::Prompt::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionReplaceParams::FunctionData::Prompt::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Code < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::FunctionReplaceParams::FunctionData::Code,
                Braintrust::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.any(
                Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle,
                Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline
              )
            )
          end
          attr_accessor :data

          sig do
            returns(
              Braintrust::FunctionReplaceParams::FunctionData::Code::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              data:
                T.any(
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle::OrHash,
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::OrHash
                ),
              type:
                Braintrust::FunctionReplaceParams::FunctionData::Code::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(data:, type:)
          end

          sig do
            override.returns(
              {
                data:
                  T.any(
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle,
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline
                  ),
                type:
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Type::OrSymbol
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
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle,
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline
                )
              end

            class Bundle < Braintrust::Models::CodeBundle
              OrHash =
                T.type_alias do
                  T.any(
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle,
                    Braintrust::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  type:
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override.returns(
                  {
                    type:
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::OrSymbol
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
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                BUNDLE =
                  T.let(
                    :bundle,
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
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
                  T.any(
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline,
                    Braintrust::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :code

              sig do
                returns(
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext
                )
              end
              attr_reader :runtime_context

              sig do
                params(
                  runtime_context:
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::OrHash
                ).void
              end
              attr_writer :runtime_context

              sig do
                returns(
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  code: String,
                  runtime_context:
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::OrHash,
                  type:
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(code:, runtime_context:, type:)
              end

              sig do
                override.returns(
                  {
                    code: String,
                    runtime_context:
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext,
                    type:
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::OrSymbol
                  }
                )
              end
              def to_hash
              end

              class RuntimeContext < Braintrust::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext,
                      Braintrust::Internal::AnyHash
                    )
                  end

                sig do
                  returns(
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                  )
                end
                attr_accessor :runtime

                sig { returns(String) }
                attr_accessor :version

                sig do
                  params(
                    runtime:
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
                    version: String
                  ).returns(T.attached_class)
                end
                def self.new(runtime:, version:)
                end

                sig do
                  override.returns(
                    {
                      runtime:
                        Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
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
                        Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  NODE =
                    T.let(
                      :node,
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )
                  PYTHON =
                    T.let(
                      :python,
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
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
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                INLINE =
                  T.let(
                    :inline,
                    Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
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
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Variants
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
                T.all(
                  Symbol,
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CODE =
              T.let(
                :code,
                Braintrust::FunctionReplaceParams::FunctionData::Code::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionReplaceParams::FunctionData::Code::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::FunctionReplaceParams::FunctionData::Global,
                Braintrust::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :name

          sig do
            returns(
              Braintrust::FunctionReplaceParams::FunctionData::Global::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              name: String,
              type:
                Braintrust::FunctionReplaceParams::FunctionData::Global::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override.returns(
              {
                name: String,
                type:
                  Braintrust::FunctionReplaceParams::FunctionData::Global::Type::OrSymbol
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
                  Braintrust::FunctionReplaceParams::FunctionData::Global::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GLOBAL =
              T.let(
                :global,
                Braintrust::FunctionReplaceParams::FunctionData::Global::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionReplaceParams::FunctionData::Global::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::FunctionReplaceParams::FunctionData::Variants]
          )
        end
        def self.variants
        end
      end

      class FunctionSchema < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Braintrust::FunctionReplaceParams::FunctionSchema,
              Braintrust::Internal::AnyHash
            )
          end

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
          T.type_alias do
            T.all(Symbol, Braintrust::FunctionReplaceParams::FunctionType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LLM =
          T.let(
            :llm,
            Braintrust::FunctionReplaceParams::FunctionType::TaggedSymbol
          )
        SCORER =
          T.let(
            :scorer,
            Braintrust::FunctionReplaceParams::FunctionType::TaggedSymbol
          )
        TASK =
          T.let(
            :task,
            Braintrust::FunctionReplaceParams::FunctionType::TaggedSymbol
          )
        TOOL =
          T.let(
            :tool,
            Braintrust::FunctionReplaceParams::FunctionType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Braintrust::FunctionReplaceParams::FunctionType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Origin < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Braintrust::FunctionReplaceParams::Origin,
              Braintrust::Internal::AnyHash
            )
          end

        # Id of the object the function is originating from
        sig { returns(String) }
        attr_accessor :object_id_

        # The object type that the ACL applies to
        sig { returns(Braintrust::ACLObjectType::OrSymbol) }
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
              object_type: Braintrust::ACLObjectType::OrSymbol,
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
