# typed: strong

module Braintrust
  module Models
    class PromptData < Braintrust::BaseModel
      sig { returns(T.nilable(Braintrust::Models::PromptOptions)) }
      def options
      end

      sig do
        params(_: T.nilable(Braintrust::Models::PromptOptions))
          .returns(T.nilable(Braintrust::Models::PromptOptions))
      end
      def options=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::PromptData::Origin)) }
      def origin
      end

      sig do
        params(_: T.nilable(Braintrust::Models::PromptData::Origin))
          .returns(T.nilable(Braintrust::Models::PromptData::Origin))
      end
      def origin=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::PromptData::Parser)) }
      def parser
      end

      sig do
        params(_: T.nilable(Braintrust::Models::PromptData::Parser))
          .returns(T.nilable(Braintrust::Models::PromptData::Parser))
      end
      def parser=(_)
      end

      sig do
        returns(
          T.nilable(
            T.any(
              Braintrust::Models::PromptData::Prompt::Completion,
              Braintrust::Models::PromptData::Prompt::Chat,
              Braintrust::Models::PromptData::Prompt::NullableVariant
            )
          )
        )
      end
      def prompt
      end

      sig do
        params(
          _: T.nilable(
            T.any(
              Braintrust::Models::PromptData::Prompt::Completion,
              Braintrust::Models::PromptData::Prompt::Chat,
              Braintrust::Models::PromptData::Prompt::NullableVariant
            )
          )
        )
          .returns(
            T.nilable(
              T.any(
                Braintrust::Models::PromptData::Prompt::Completion,
                Braintrust::Models::PromptData::Prompt::Chat,
                Braintrust::Models::PromptData::Prompt::NullableVariant
              )
            )
          )
      end
      def prompt=(_)
      end

      sig do
        returns(
          T.nilable(
            T::Array[
            T.any(
              Braintrust::Models::PromptData::ToolFunction::Function,
              Braintrust::Models::PromptData::ToolFunction::Global
            )
            ]
          )
        )
      end
      def tool_functions
      end

      sig do
        params(
          _: T.nilable(
            T::Array[
            T.any(
              Braintrust::Models::PromptData::ToolFunction::Function,
              Braintrust::Models::PromptData::ToolFunction::Global
            )
            ]
          )
        )
          .returns(
            T.nilable(
              T::Array[
              T.any(
                Braintrust::Models::PromptData::ToolFunction::Function,
                Braintrust::Models::PromptData::ToolFunction::Global
              )
              ]
            )
          )
      end
      def tool_functions=(_)
      end

      sig do
        params(
          options: T.nilable(Braintrust::Models::PromptOptions),
          origin: T.nilable(Braintrust::Models::PromptData::Origin),
          parser: T.nilable(Braintrust::Models::PromptData::Parser),
          prompt: T.nilable(
            T.any(
              Braintrust::Models::PromptData::Prompt::Completion,
              Braintrust::Models::PromptData::Prompt::Chat,
              Braintrust::Models::PromptData::Prompt::NullableVariant
            )
          ),
          tool_functions: T.nilable(
            T::Array[
            T.any(
              Braintrust::Models::PromptData::ToolFunction::Function,
              Braintrust::Models::PromptData::ToolFunction::Global
            )
            ]
          )
        )
          .void
      end
      def initialize(options: nil, origin: nil, parser: nil, prompt: nil, tool_functions: nil)
      end

      sig do
        override
          .returns(
            {
              options: T.nilable(Braintrust::Models::PromptOptions),
              origin: T.nilable(Braintrust::Models::PromptData::Origin),
              parser: T.nilable(Braintrust::Models::PromptData::Parser),
              prompt: T.nilable(
                T.any(
                  Braintrust::Models::PromptData::Prompt::Completion,
                  Braintrust::Models::PromptData::Prompt::Chat,
                  Braintrust::Models::PromptData::Prompt::NullableVariant
                )
              ),
              tool_functions: T.nilable(
                T::Array[
                T.any(
                  Braintrust::Models::PromptData::ToolFunction::Function,
                  Braintrust::Models::PromptData::ToolFunction::Global
                )
                ]
              )
            }
          )
      end
      def to_hash
      end

      class Origin < Braintrust::BaseModel
        sig { returns(T.nilable(String)) }
        def project_id
        end

        sig { params(_: String).returns(String) }
        def project_id=(_)
        end

        sig { returns(T.nilable(String)) }
        def prompt_id
        end

        sig { params(_: String).returns(String) }
        def prompt_id=(_)
        end

        sig { returns(T.nilable(String)) }
        def prompt_version
        end

        sig { params(_: String).returns(String) }
        def prompt_version=(_)
        end

        sig { params(project_id: String, prompt_id: String, prompt_version: String).void }
        def initialize(project_id: nil, prompt_id: nil, prompt_version: nil)
        end

        sig { override.returns({project_id: String, prompt_id: String, prompt_version: String}) }
        def to_hash
        end
      end

      class Parser < Braintrust::BaseModel
        sig { returns(T::Hash[Symbol, Float]) }
        def choice_scores
        end

        sig { params(_: T::Hash[Symbol, Float]).returns(T::Hash[Symbol, Float]) }
        def choice_scores=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(T::Boolean) }
        def use_cot
        end

        sig { params(_: T::Boolean).returns(T::Boolean) }
        def use_cot=(_)
        end

        sig { params(choice_scores: T::Hash[Symbol, Float], type: Symbol, use_cot: T::Boolean).void }
        def initialize(choice_scores:, type:, use_cot:)
        end

        sig { override.returns({choice_scores: T::Hash[Symbol, Float], type: Symbol, use_cot: T::Boolean}) }
        def to_hash
        end

        class Type < Braintrust::Enum
          abstract!

          LLM_CLASSIFIER = :llm_classifier

          sig { override.returns(T::Array[Symbol]) }
          def self.values
          end
        end
      end

      class Prompt < Braintrust::Union
        abstract!

        class Completion < Braintrust::BaseModel
          sig { returns(String) }
          def content
          end

          sig { params(_: String).returns(String) }
          def content=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(content: String, type: Symbol).void }
          def initialize(content:, type:)
          end

          sig { override.returns({content: String, type: Symbol}) }
          def to_hash
          end

          class Type < Braintrust::Enum
            abstract!

            COMPLETION = :completion

            sig { override.returns(T::Array[Symbol]) }
            def self.values
            end
          end
        end

        class Chat < Braintrust::BaseModel
          sig do
            returns(
              T::Array[
              T.any(
                Braintrust::Models::PromptData::Prompt::Chat::Message::System,
                Braintrust::Models::PromptData::Prompt::Chat::Message::User,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Tool,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Function,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback
              )
              ]
            )
          end
          def messages
          end

          sig do
            params(
              _: T::Array[
              T.any(
                Braintrust::Models::PromptData::Prompt::Chat::Message::System,
                Braintrust::Models::PromptData::Prompt::Chat::Message::User,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Tool,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Function,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback
              )
              ]
            )
              .returns(
                T::Array[
                T.any(
                  Braintrust::Models::PromptData::Prompt::Chat::Message::System,
                  Braintrust::Models::PromptData::Prompt::Chat::Message::User,
                  Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant,
                  Braintrust::Models::PromptData::Prompt::Chat::Message::Tool,
                  Braintrust::Models::PromptData::Prompt::Chat::Message::Function,
                  Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback
                )
                ]
              )
          end
          def messages=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { returns(T.nilable(String)) }
          def tools
          end

          sig { params(_: String).returns(String) }
          def tools=(_)
          end

          sig do
            params(
              messages: T::Array[
              T.any(
                Braintrust::Models::PromptData::Prompt::Chat::Message::System,
                Braintrust::Models::PromptData::Prompt::Chat::Message::User,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Tool,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Function,
                Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback
              )
              ],
              type: Symbol,
              tools: String
            )
              .void
          end
          def initialize(messages:, type:, tools: nil)
          end

          sig do
            override
              .returns(
                {
                  messages: T::Array[
                  T.any(
                    Braintrust::Models::PromptData::Prompt::Chat::Message::System,
                    Braintrust::Models::PromptData::Prompt::Chat::Message::User,
                    Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant,
                    Braintrust::Models::PromptData::Prompt::Chat::Message::Tool,
                    Braintrust::Models::PromptData::Prompt::Chat::Message::Function,
                    Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback
                  )
                  ],
                  type: Symbol,
                  tools: String
                }
              )
          end
          def to_hash
          end

          class Message < Braintrust::Union
            abstract!

            class System < Braintrust::BaseModel
              sig { returns(Symbol) }
              def role
              end

              sig { params(_: Symbol).returns(Symbol) }
              def role=(_)
              end

              sig { returns(T.nilable(String)) }
              def content
              end

              sig { params(_: String).returns(String) }
              def content=(_)
              end

              sig { returns(T.nilable(String)) }
              def name
              end

              sig { params(_: String).returns(String) }
              def name=(_)
              end

              sig { params(role: Symbol, content: String, name: String).void }
              def initialize(role:, content: nil, name: nil)
              end

              sig { override.returns({role: Symbol, content: String, name: String}) }
              def to_hash
              end

              class Role < Braintrust::Enum
                abstract!

                SYSTEM = :system

                sig { override.returns(T::Array[Symbol]) }
                def self.values
                end
              end
            end

            class User < Braintrust::BaseModel
              sig { returns(Symbol) }
              def role
              end

              sig { params(_: Symbol).returns(Symbol) }
              def role=(_)
              end

              sig do
                returns(
                  T.nilable(
                    T.any(
                      String,
                      T::Array[
                      T.any(
                        Braintrust::Models::ChatCompletionContentPartText,
                        Braintrust::Models::ChatCompletionContentPartImage
                      )
                      ]
                    )
                  )
                )
              end
              def content
              end

              sig do
                params(
                  _: T.any(
                    String,
                    T::Array[
                    T.any(
                      Braintrust::Models::ChatCompletionContentPartText,
                      Braintrust::Models::ChatCompletionContentPartImage
                    )
                    ]
                  )
                )
                  .returns(
                    T.any(
                      String,
                      T::Array[
                      T.any(
                        Braintrust::Models::ChatCompletionContentPartText,
                        Braintrust::Models::ChatCompletionContentPartImage
                      )
                      ]
                    )
                  )
              end
              def content=(_)
              end

              sig { returns(T.nilable(String)) }
              def name
              end

              sig { params(_: String).returns(String) }
              def name=(_)
              end

              sig do
                params(
                  role: Symbol,
                  content: T.any(
                    String,
                    T::Array[
                    T.any(
                      Braintrust::Models::ChatCompletionContentPartText,
                      Braintrust::Models::ChatCompletionContentPartImage
                    )
                    ]
                  ),
                  name: String
                )
                  .void
              end
              def initialize(role:, content: nil, name: nil)
              end

              sig do
                override
                  .returns(
                    {
                      role: Symbol,
                      content: T.any(
                        String,
                        T::Array[
                        T.any(
                          Braintrust::Models::ChatCompletionContentPartText,
                          Braintrust::Models::ChatCompletionContentPartImage
                        )
                        ]
                      ),
                      name: String
                    }
                  )
              end
              def to_hash
              end

              class Role < Braintrust::Enum
                abstract!

                USER = :user

                sig { override.returns(T::Array[Symbol]) }
                def self.values
                end
              end

              class Content < Braintrust::Union
                abstract!

                Nested2DArray = T.type_alias do
                  T::Array[
                  T.any(
                    Braintrust::Models::ChatCompletionContentPartText,
                    Braintrust::Models::ChatCompletionContentPartImage
                  )
                  ]
                end

                class Array < Braintrust::Union
                  abstract!

                  sig do
                    override
                      .returns(
                        [[NilClass, Braintrust::Models::ChatCompletionContentPartText], [NilClass, Braintrust::Models::ChatCompletionContentPartImage]]
                      )
                  end
                  private_class_method def self.variants
                  end
                end

                sig do
                  override
                    .returns(
                      [
                        [NilClass, String],
                        [
                          NilClass,
                          T::Array[
                                                T.any(
                                                  Braintrust::Models::ChatCompletionContentPartText,
                                                  Braintrust::Models::ChatCompletionContentPartImage
                                                )
                                                ]
                        ]
                      ]
                    )
                end
                private_class_method def self.variants
                end
              end
            end

            class Assistant < Braintrust::BaseModel
              sig { returns(Symbol) }
              def role
              end

              sig { params(_: Symbol).returns(Symbol) }
              def role=(_)
              end

              sig { returns(T.nilable(String)) }
              def content
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def content=(_)
              end

              sig { returns(T.nilable(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall)) }
              def function_call
              end

              sig do
                params(_: T.nilable(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall))
                  .returns(T.nilable(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall))
              end
              def function_call=(_)
              end

              sig { returns(T.nilable(String)) }
              def name
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def name=(_)
              end

              sig { returns(T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])) }
              def tool_calls
              end

              sig do
                params(_: T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall]))
                  .returns(T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall]))
              end
              def tool_calls=(_)
              end

              sig do
                params(
                  role: Symbol,
                  content: T.nilable(String),
                  function_call: T.nilable(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall),
                  name: T.nilable(String),
                  tool_calls: T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])
                )
                  .void
              end
              def initialize(role:, content: nil, function_call: nil, name: nil, tool_calls: nil)
              end

              sig do
                override
                  .returns(
                    {
                      role: Symbol,
                      content: T.nilable(String),
                      function_call: T.nilable(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall),
                      name: T.nilable(String),
                      tool_calls: T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])
                    }
                  )
              end
              def to_hash
              end

              class Role < Braintrust::Enum
                abstract!

                ASSISTANT = :assistant

                sig { override.returns(T::Array[Symbol]) }
                def self.values
                end
              end

              class FunctionCall < Braintrust::BaseModel
                sig { returns(String) }
                def arguments
                end

                sig { params(_: String).returns(String) }
                def arguments=(_)
                end

                sig { returns(String) }
                def name
                end

                sig { params(_: String).returns(String) }
                def name=(_)
                end

                sig { params(arguments: String, name: String).void }
                def initialize(arguments:, name:)
                end

                sig { override.returns({arguments: String, name: String}) }
                def to_hash
                end
              end
            end

            class Tool < Braintrust::BaseModel
              sig { returns(Symbol) }
              def role
              end

              sig { params(_: Symbol).returns(Symbol) }
              def role=(_)
              end

              sig { returns(T.nilable(String)) }
              def content
              end

              sig { params(_: String).returns(String) }
              def content=(_)
              end

              sig { returns(T.nilable(String)) }
              def tool_call_id
              end

              sig { params(_: String).returns(String) }
              def tool_call_id=(_)
              end

              sig { params(role: Symbol, content: String, tool_call_id: String).void }
              def initialize(role:, content: nil, tool_call_id: nil)
              end

              sig { override.returns({role: Symbol, content: String, tool_call_id: String}) }
              def to_hash
              end

              class Role < Braintrust::Enum
                abstract!

                TOOL = :tool

                sig { override.returns(T::Array[Symbol]) }
                def self.values
                end
              end
            end

            class Function < Braintrust::BaseModel
              sig { returns(String) }
              def name
              end

              sig { params(_: String).returns(String) }
              def name=(_)
              end

              sig { returns(Symbol) }
              def role
              end

              sig { params(_: Symbol).returns(Symbol) }
              def role=(_)
              end

              sig { returns(T.nilable(String)) }
              def content
              end

              sig { params(_: String).returns(String) }
              def content=(_)
              end

              sig { params(name: String, role: Symbol, content: String).void }
              def initialize(name:, role:, content: nil)
              end

              sig { override.returns({name: String, role: Symbol, content: String}) }
              def to_hash
              end

              class Role < Braintrust::Enum
                abstract!

                FUNCTION = :function

                sig { override.returns(T::Array[Symbol]) }
                def self.values
                end
              end
            end

            class Fallback < Braintrust::BaseModel
              sig { returns(Symbol) }
              def role
              end

              sig { params(_: Symbol).returns(Symbol) }
              def role=(_)
              end

              sig { returns(T.nilable(String)) }
              def content
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def content=(_)
              end

              sig { params(role: Symbol, content: T.nilable(String)).void }
              def initialize(role:, content: nil)
              end

              sig { override.returns({role: Symbol, content: T.nilable(String)}) }
              def to_hash
              end

              class Role < Braintrust::Enum
                abstract!

                MODEL = :model

                sig { override.returns(T::Array[Symbol]) }
                def self.values
                end
              end
            end

            sig do
              override
                .returns(
                  [[NilClass, Braintrust::Models::PromptData::Prompt::Chat::Message::System], [NilClass, Braintrust::Models::PromptData::Prompt::Chat::Message::User], [NilClass, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant], [NilClass, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool], [NilClass, Braintrust::Models::PromptData::Prompt::Chat::Message::Function], [NilClass, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback]]
                )
            end
            private_class_method def self.variants
            end
          end

          class Type < Braintrust::Enum
            abstract!

            CHAT = :chat

            sig { override.returns(T::Array[Symbol]) }
            def self.values
            end
          end
        end

        class NullableVariant < Braintrust::BaseModel
          sig { void }
          def initialize
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        sig do
          override
            .returns(
              [[NilClass, Braintrust::Models::PromptData::Prompt::Completion], [NilClass, Braintrust::Models::PromptData::Prompt::Chat], [NilClass, Braintrust::Models::PromptData::Prompt::NullableVariant]]
            )
        end
        private_class_method def self.variants
        end
      end

      class ToolFunction < Braintrust::Union
        abstract!

        class Function < Braintrust::BaseModel
          sig { returns(String) }
          def id
          end

          sig { params(_: String).returns(String) }
          def id=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(id: String, type: Symbol).void }
          def initialize(id:, type:)
          end

          sig { override.returns({id: String, type: Symbol}) }
          def to_hash
          end

          class Type < Braintrust::Enum
            abstract!

            FUNCTION = :function

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
              [[NilClass, Braintrust::Models::PromptData::ToolFunction::Function], [NilClass, Braintrust::Models::PromptData::ToolFunction::Global]]
            )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
