# typed: strong

module Braintrust
  module Models
    class PromptData < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      sig { returns(T.nilable(Braintrust::PromptOptions)) }
      attr_reader :options

      sig { params(options: T.nilable(Braintrust::PromptOptions::OrHash)).void }
      attr_writer :options

      sig { returns(T.nilable(Braintrust::PromptData::Origin)) }
      attr_reader :origin

      sig do
        params(origin: T.nilable(Braintrust::PromptData::Origin::OrHash)).void
      end
      attr_writer :origin

      sig { returns(T.nilable(Braintrust::PromptData::Parser)) }
      attr_reader :parser

      sig do
        params(parser: T.nilable(Braintrust::PromptData::Parser::OrHash)).void
      end
      attr_writer :parser

      sig do
        returns(
          T.nilable(
            T.any(
              Braintrust::PromptData::Prompt::Completion,
              Braintrust::PromptData::Prompt::Chat
            )
          )
        )
      end
      attr_accessor :prompt

      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                Braintrust::PromptData::ToolFunction::Function,
                Braintrust::PromptData::ToolFunction::Global
              )
            ]
          )
        )
      end
      attr_accessor :tool_functions

      # The prompt, model, and its parameters
      sig do
        params(
          options: T.nilable(Braintrust::PromptOptions::OrHash),
          origin: T.nilable(Braintrust::PromptData::Origin::OrHash),
          parser: T.nilable(Braintrust::PromptData::Parser::OrHash),
          prompt:
            T.nilable(
              T.any(
                Braintrust::PromptData::Prompt::Completion::OrHash,
                Braintrust::PromptData::Prompt::Chat::OrHash
              )
            ),
          tool_functions:
            T.nilable(
              T::Array[
                T.any(
                  Braintrust::PromptData::ToolFunction::Function::OrHash,
                  Braintrust::PromptData::ToolFunction::Global::OrHash
                )
              ]
            )
        ).returns(T.attached_class)
      end
      def self.new(
        options: nil,
        origin: nil,
        parser: nil,
        prompt: nil,
        tool_functions: nil
      )
      end

      sig do
        override.returns(
          {
            options: T.nilable(Braintrust::PromptOptions),
            origin: T.nilable(Braintrust::PromptData::Origin),
            parser: T.nilable(Braintrust::PromptData::Parser),
            prompt:
              T.nilable(
                T.any(
                  Braintrust::PromptData::Prompt::Completion,
                  Braintrust::PromptData::Prompt::Chat
                )
              ),
            tool_functions:
              T.nilable(
                T::Array[
                  T.any(
                    Braintrust::PromptData::ToolFunction::Function,
                    Braintrust::PromptData::ToolFunction::Global
                  )
                ]
              )
          }
        )
      end
      def to_hash
      end

      class Origin < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

        sig { returns(T.nilable(String)) }
        attr_reader :project_id

        sig { params(project_id: String).void }
        attr_writer :project_id

        sig { returns(T.nilable(String)) }
        attr_reader :prompt_id

        sig { params(prompt_id: String).void }
        attr_writer :prompt_id

        sig { returns(T.nilable(String)) }
        attr_reader :prompt_version

        sig { params(prompt_version: String).void }
        attr_writer :prompt_version

        sig do
          params(
            project_id: String,
            prompt_id: String,
            prompt_version: String
          ).returns(T.attached_class)
        end
        def self.new(project_id: nil, prompt_id: nil, prompt_version: nil)
        end

        sig do
          override.returns(
            { project_id: String, prompt_id: String, prompt_version: String }
          )
        end
        def to_hash
        end
      end

      class Parser < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

        sig { returns(T::Hash[Symbol, Float]) }
        attr_accessor :choice_scores

        sig { returns(Braintrust::PromptData::Parser::Type::OrSymbol) }
        attr_accessor :type

        sig { returns(T::Boolean) }
        attr_accessor :use_cot

        sig do
          params(
            choice_scores: T::Hash[Symbol, Float],
            type: Braintrust::PromptData::Parser::Type::OrSymbol,
            use_cot: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(choice_scores:, type:, use_cot:)
        end

        sig do
          override.returns(
            {
              choice_scores: T::Hash[Symbol, Float],
              type: Braintrust::PromptData::Parser::Type::OrSymbol,
              use_cot: T::Boolean
            }
          )
        end
        def to_hash
        end

        module Type
          extend Braintrust::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Braintrust::PromptData::Parser::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LLM_CLASSIFIER =
            T.let(
              :llm_classifier,
              Braintrust::PromptData::Parser::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Braintrust::PromptData::Parser::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end

      module Prompt
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::PromptData::Prompt::Completion,
              Braintrust::PromptData::Prompt::Chat
            )
          end

        class Completion < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig { returns(String) }
          attr_accessor :content

          sig do
            returns(Braintrust::PromptData::Prompt::Completion::Type::OrSymbol)
          end
          attr_accessor :type

          sig do
            params(
              content: String,
              type: Braintrust::PromptData::Prompt::Completion::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(content:, type:)
          end

          sig do
            override.returns(
              {
                content: String,
                type: Braintrust::PromptData::Prompt::Completion::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Braintrust::PromptData::Prompt::Completion::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            COMPLETION =
              T.let(
                :completion,
                Braintrust::PromptData::Prompt::Completion::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::PromptData::Prompt::Completion::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Chat < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig do
            returns(
              T::Array[
                T.any(
                  Braintrust::PromptData::Prompt::Chat::Message::System,
                  Braintrust::PromptData::Prompt::Chat::Message::User,
                  Braintrust::PromptData::Prompt::Chat::Message::Assistant,
                  Braintrust::PromptData::Prompt::Chat::Message::Tool,
                  Braintrust::PromptData::Prompt::Chat::Message::Function,
                  Braintrust::PromptData::Prompt::Chat::Message::Fallback
                )
              ]
            )
          end
          attr_accessor :messages

          sig { returns(Braintrust::PromptData::Prompt::Chat::Type::OrSymbol) }
          attr_accessor :type

          sig { returns(T.nilable(String)) }
          attr_reader :tools

          sig { params(tools: String).void }
          attr_writer :tools

          sig do
            params(
              messages:
                T::Array[
                  T.any(
                    Braintrust::PromptData::Prompt::Chat::Message::System::OrHash,
                    Braintrust::PromptData::Prompt::Chat::Message::User::OrHash,
                    Braintrust::PromptData::Prompt::Chat::Message::Assistant::OrHash,
                    Braintrust::PromptData::Prompt::Chat::Message::Tool::OrHash,
                    Braintrust::PromptData::Prompt::Chat::Message::Function::OrHash,
                    Braintrust::PromptData::Prompt::Chat::Message::Fallback::OrHash
                  )
                ],
              type: Braintrust::PromptData::Prompt::Chat::Type::OrSymbol,
              tools: String
            ).returns(T.attached_class)
          end
          def self.new(messages:, type:, tools: nil)
          end

          sig do
            override.returns(
              {
                messages:
                  T::Array[
                    T.any(
                      Braintrust::PromptData::Prompt::Chat::Message::System,
                      Braintrust::PromptData::Prompt::Chat::Message::User,
                      Braintrust::PromptData::Prompt::Chat::Message::Assistant,
                      Braintrust::PromptData::Prompt::Chat::Message::Tool,
                      Braintrust::PromptData::Prompt::Chat::Message::Function,
                      Braintrust::PromptData::Prompt::Chat::Message::Fallback
                    )
                  ],
                type: Braintrust::PromptData::Prompt::Chat::Type::OrSymbol,
                tools: String
              }
            )
          end
          def to_hash
          end

          module Message
            extend Braintrust::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Braintrust::PromptData::Prompt::Chat::Message::System,
                  Braintrust::PromptData::Prompt::Chat::Message::User,
                  Braintrust::PromptData::Prompt::Chat::Message::Assistant,
                  Braintrust::PromptData::Prompt::Chat::Message::Tool,
                  Braintrust::PromptData::Prompt::Chat::Message::Function,
                  Braintrust::PromptData::Prompt::Chat::Message::Fallback
                )
              end

            class System < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig do
                returns(
                  Braintrust::PromptData::Prompt::Chat::Message::System::Role::OrSymbol
                )
              end
              attr_accessor :role

              sig { returns(T.nilable(String)) }
              attr_reader :content

              sig { params(content: String).void }
              attr_writer :content

              sig { returns(T.nilable(String)) }
              attr_reader :name

              sig { params(name: String).void }
              attr_writer :name

              sig do
                params(
                  role:
                    Braintrust::PromptData::Prompt::Chat::Message::System::Role::OrSymbol,
                  content: String,
                  name: String
                ).returns(T.attached_class)
              end
              def self.new(role:, content: nil, name: nil)
              end

              sig do
                override.returns(
                  {
                    role:
                      Braintrust::PromptData::Prompt::Chat::Message::System::Role::OrSymbol,
                    content: String,
                    name: String
                  }
                )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::PromptData::Prompt::Chat::Message::System::Role
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                SYSTEM =
                  T.let(
                    :system,
                    Braintrust::PromptData::Prompt::Chat::Message::System::Role::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptData::Prompt::Chat::Message::System::Role::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class User < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig do
                returns(
                  Braintrust::PromptData::Prompt::Chat::Message::User::Role::OrSymbol
                )
              end
              attr_accessor :role

              sig do
                returns(
                  T.nilable(
                    T.any(
                      String,
                      T::Array[
                        T.any(
                          Braintrust::ChatCompletionContentPartText,
                          Braintrust::ChatCompletionContentPartImage
                        )
                      ]
                    )
                  )
                )
              end
              attr_reader :content

              sig do
                params(
                  content:
                    T.any(
                      String,
                      T::Array[
                        T.any(
                          Braintrust::ChatCompletionContentPartText::OrHash,
                          Braintrust::ChatCompletionContentPartImage::OrHash
                        )
                      ]
                    )
                ).void
              end
              attr_writer :content

              sig { returns(T.nilable(String)) }
              attr_reader :name

              sig { params(name: String).void }
              attr_writer :name

              sig do
                params(
                  role:
                    Braintrust::PromptData::Prompt::Chat::Message::User::Role::OrSymbol,
                  content:
                    T.any(
                      String,
                      T::Array[
                        T.any(
                          Braintrust::ChatCompletionContentPartText::OrHash,
                          Braintrust::ChatCompletionContentPartImage::OrHash
                        )
                      ]
                    ),
                  name: String
                ).returns(T.attached_class)
              end
              def self.new(role:, content: nil, name: nil)
              end

              sig do
                override.returns(
                  {
                    role:
                      Braintrust::PromptData::Prompt::Chat::Message::User::Role::OrSymbol,
                    content:
                      T.any(
                        String,
                        T::Array[
                          T.any(
                            Braintrust::ChatCompletionContentPartText,
                            Braintrust::ChatCompletionContentPartImage
                          )
                        ]
                      ),
                    name: String
                  }
                )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::PromptData::Prompt::Chat::Message::User::Role
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                USER =
                  T.let(
                    :user,
                    Braintrust::PromptData::Prompt::Chat::Message::User::Role::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptData::Prompt::Chat::Message::User::Role::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              module Content
                extend Braintrust::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      String,
                      T::Array[
                        T.any(
                          Braintrust::ChatCompletionContentPartText,
                          Braintrust::ChatCompletionContentPartImage
                        )
                      ]
                    )
                  end

                module Array
                  extend Braintrust::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        Braintrust::ChatCompletionContentPartText,
                        Braintrust::ChatCompletionContentPartImage
                      )
                    end

                  sig do
                    override.returns(
                      T::Array[
                        Braintrust::PromptData::Prompt::Chat::Message::User::Content::Array::Variants
                      ]
                    )
                  end
                  def self.variants
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptData::Prompt::Chat::Message::User::Content::Variants
                    ]
                  )
                end
                def self.variants
                end

                Nested2DArray =
                  T.let(
                    Braintrust::Internal::Type::ArrayOf[
                      union:
                        Braintrust::PromptData::Prompt::Chat::Message::User::Content::Array
                    ],
                    Braintrust::Internal::Type::Converter
                  )
              end
            end

            class Assistant < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig do
                returns(
                  Braintrust::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol
                )
              end
              attr_accessor :role

              sig { returns(T.nilable(String)) }
              attr_accessor :content

              sig do
                returns(
                  T.nilable(
                    Braintrust::PromptData::Prompt::Chat::Message::Assistant::FunctionCall
                  )
                )
              end
              attr_reader :function_call

              sig do
                params(
                  function_call:
                    T.nilable(
                      Braintrust::PromptData::Prompt::Chat::Message::Assistant::FunctionCall::OrHash
                    )
                ).void
              end
              attr_writer :function_call

              sig { returns(T.nilable(String)) }
              attr_accessor :name

              sig do
                returns(
                  T.nilable(T::Array[Braintrust::ChatCompletionMessageToolCall])
                )
              end
              attr_accessor :tool_calls

              sig do
                params(
                  role:
                    Braintrust::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol,
                  content: T.nilable(String),
                  function_call:
                    T.nilable(
                      Braintrust::PromptData::Prompt::Chat::Message::Assistant::FunctionCall::OrHash
                    ),
                  name: T.nilable(String),
                  tool_calls:
                    T.nilable(
                      T::Array[
                        Braintrust::ChatCompletionMessageToolCall::OrHash
                      ]
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                role:,
                content: nil,
                function_call: nil,
                name: nil,
                tool_calls: nil
              )
              end

              sig do
                override.returns(
                  {
                    role:
                      Braintrust::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol,
                    content: T.nilable(String),
                    function_call:
                      T.nilable(
                        Braintrust::PromptData::Prompt::Chat::Message::Assistant::FunctionCall
                      ),
                    name: T.nilable(String),
                    tool_calls:
                      T.nilable(
                        T::Array[Braintrust::ChatCompletionMessageToolCall]
                      )
                  }
                )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::PromptData::Prompt::Chat::Message::Assistant::Role
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ASSISTANT =
                  T.let(
                    :assistant,
                    Braintrust::PromptData::Prompt::Chat::Message::Assistant::Role::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptData::Prompt::Chat::Message::Assistant::Role::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class FunctionCall < Braintrust::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(T.self_type, Braintrust::Internal::AnyHash)
                  end

                sig { returns(String) }
                attr_accessor :arguments

                sig { returns(String) }
                attr_accessor :name

                sig do
                  params(arguments: String, name: String).returns(
                    T.attached_class
                  )
                end
                def self.new(arguments:, name:)
                end

                sig { override.returns({ arguments: String, name: String }) }
                def to_hash
                end
              end
            end

            class Tool < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig do
                returns(
                  Braintrust::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol
                )
              end
              attr_accessor :role

              sig { returns(T.nilable(String)) }
              attr_reader :content

              sig { params(content: String).void }
              attr_writer :content

              sig { returns(T.nilable(String)) }
              attr_reader :tool_call_id

              sig { params(tool_call_id: String).void }
              attr_writer :tool_call_id

              sig do
                params(
                  role:
                    Braintrust::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol,
                  content: String,
                  tool_call_id: String
                ).returns(T.attached_class)
              end
              def self.new(role:, content: nil, tool_call_id: nil)
              end

              sig do
                override.returns(
                  {
                    role:
                      Braintrust::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol,
                    content: String,
                    tool_call_id: String
                  }
                )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::PromptData::Prompt::Chat::Message::Tool::Role
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                TOOL =
                  T.let(
                    :tool,
                    Braintrust::PromptData::Prompt::Chat::Message::Tool::Role::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptData::Prompt::Chat::Message::Tool::Role::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Function < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig { returns(String) }
              attr_accessor :name

              sig do
                returns(
                  Braintrust::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol
                )
              end
              attr_accessor :role

              sig { returns(T.nilable(String)) }
              attr_reader :content

              sig { params(content: String).void }
              attr_writer :content

              sig do
                params(
                  name: String,
                  role:
                    Braintrust::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol,
                  content: String
                ).returns(T.attached_class)
              end
              def self.new(name:, role:, content: nil)
              end

              sig do
                override.returns(
                  {
                    name: String,
                    role:
                      Braintrust::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol,
                    content: String
                  }
                )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::PromptData::Prompt::Chat::Message::Function::Role
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                FUNCTION =
                  T.let(
                    :function,
                    Braintrust::PromptData::Prompt::Chat::Message::Function::Role::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptData::Prompt::Chat::Message::Function::Role::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Fallback < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig do
                returns(
                  Braintrust::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol
                )
              end
              attr_accessor :role

              sig { returns(T.nilable(String)) }
              attr_accessor :content

              sig do
                params(
                  role:
                    Braintrust::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol,
                  content: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(role:, content: nil)
              end

              sig do
                override.returns(
                  {
                    role:
                      Braintrust::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol,
                    content: T.nilable(String)
                  }
                )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::PromptData::Prompt::Chat::Message::Fallback::Role
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                MODEL =
                  T.let(
                    :model,
                    Braintrust::PromptData::Prompt::Chat::Message::Fallback::Role::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptData::Prompt::Chat::Message::Fallback::Role::TaggedSymbol
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
                  Braintrust::PromptData::Prompt::Chat::Message::Variants
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
                T.all(Symbol, Braintrust::PromptData::Prompt::Chat::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CHAT =
              T.let(
                :chat,
                Braintrust::PromptData::Prompt::Chat::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::PromptData::Prompt::Chat::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(T::Array[Braintrust::PromptData::Prompt::Variants])
        end
        def self.variants
        end
      end

      module ToolFunction
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::PromptData::ToolFunction::Function,
              Braintrust::PromptData::ToolFunction::Global
            )
          end

        class Function < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig { returns(String) }
          attr_accessor :id

          sig do
            returns(
              Braintrust::PromptData::ToolFunction::Function::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              id: String,
              type:
                Braintrust::PromptData::ToolFunction::Function::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(id:, type:)
          end

          sig do
            override.returns(
              {
                id: String,
                type:
                  Braintrust::PromptData::ToolFunction::Function::Type::OrSymbol
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
                  Braintrust::PromptData::ToolFunction::Function::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FUNCTION =
              T.let(
                :function,
                Braintrust::PromptData::ToolFunction::Function::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::PromptData::ToolFunction::Function::Type::TaggedSymbol
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
              Braintrust::PromptData::ToolFunction::Global::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              name: String,
              type: Braintrust::PromptData::ToolFunction::Global::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override.returns(
              {
                name: String,
                type:
                  Braintrust::PromptData::ToolFunction::Global::Type::OrSymbol
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
                  Braintrust::PromptData::ToolFunction::Global::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GLOBAL =
              T.let(
                :global,
                Braintrust::PromptData::ToolFunction::Global::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::PromptData::ToolFunction::Global::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::PromptData::ToolFunction::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
