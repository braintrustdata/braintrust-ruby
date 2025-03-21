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
            T.any(Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat)
          )
        )
      end
      def prompt
      end

      sig do
        params(
          _: T.nilable(
            T.any(Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat)
          )
        )
          .returns(
            T.nilable(
              T.any(Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat)
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

      # The prompt, model, and its parameters
      sig do
        params(
          options: T.nilable(Braintrust::Models::PromptOptions),
          origin: T.nilable(Braintrust::Models::PromptData::Origin),
          parser: T.nilable(Braintrust::Models::PromptData::Parser),
          prompt: T.nilable(
            T.any(Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat)
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
          .returns(T.attached_class)
      end
      def self.new(options: nil, origin: nil, parser: nil, prompt: nil, tool_functions: nil)
      end

      sig do
        override
          .returns(
            {
              options: T.nilable(Braintrust::Models::PromptOptions),
              origin: T.nilable(Braintrust::Models::PromptData::Origin),
              parser: T.nilable(Braintrust::Models::PromptData::Parser),
              prompt: T.nilable(
                T.any(Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat)
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

        sig do
          params(project_id: String, prompt_id: String, prompt_version: String).returns(T.attached_class)
        end
        def self.new(project_id: nil, prompt_id: nil, prompt_version: nil)
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

        sig { returns(Braintrust::Models::PromptData::Parser::Type::OrSymbol) }
        def type
        end

        sig do
          params(_: Braintrust::Models::PromptData::Parser::Type::OrSymbol)
            .returns(Braintrust::Models::PromptData::Parser::Type::OrSymbol)
        end
        def type=(_)
        end

        sig { returns(T::Boolean) }
        def use_cot
        end

        sig { params(_: T::Boolean).returns(T::Boolean) }
        def use_cot=(_)
        end

        sig do
          params(
            choice_scores: T::Hash[Symbol, Float],
            type: Braintrust::Models::PromptData::Parser::Type::OrSymbol,
            use_cot: T::Boolean
          )
            .returns(T.attached_class)
        end
        def self.new(choice_scores:, type:, use_cot:)
        end

        sig do
          override
            .returns(
              {
                choice_scores: T::Hash[Symbol, Float],
                type: Braintrust::Models::PromptData::Parser::Type::OrSymbol,
                use_cot: T::Boolean
              }
            )
        end
        def to_hash
        end

        module Type
          extend Braintrust::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Parser::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::Parser::Type::TaggedSymbol) }

          LLM_CLASSIFIER = T.let(:llm_classifier, Braintrust::Models::PromptData::Parser::Type::OrSymbol)
        end
      end

      module Prompt
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat)
            }
          end

        class Completion < Braintrust::BaseModel
          sig { returns(String) }
          def content
          end

          sig { params(_: String).returns(String) }
          def content=(_)
          end

          sig { returns(Braintrust::Models::PromptData::Prompt::Completion::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::PromptData::Prompt::Completion::Type::OrSymbol)
              .returns(Braintrust::Models::PromptData::Prompt::Completion::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(content: String, type: Braintrust::Models::PromptData::Prompt::Completion::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(content:, type:)
          end

          sig do
            override
              .returns({content: String, type: Braintrust::Models::PromptData::Prompt::Completion::Type::OrSymbol})
          end
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Completion::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::Prompt::Completion::Type::TaggedSymbol) }

            COMPLETION = T.let(:completion, Braintrust::Models::PromptData::Prompt::Completion::Type::OrSymbol)
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

          sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::PromptData::Prompt::Chat::Type::OrSymbol)
              .returns(Braintrust::Models::PromptData::Prompt::Chat::Type::OrSymbol)
          end
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
              type: Braintrust::Models::PromptData::Prompt::Chat::Type::OrSymbol,
              tools: String
            )
              .returns(T.attached_class)
          end
          def self.new(messages:, type:, tools: nil)
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
                  type: Braintrust::Models::PromptData::Prompt::Chat::Type::OrSymbol,
                  tools: String
                }
              )
          end
          def to_hash
          end

          module Message
            extend Braintrust::Union

            Variants =
              type_template(:out) do
                {
                  fixed: T.any(
                    Braintrust::Models::PromptData::Prompt::Chat::Message::System,
                    Braintrust::Models::PromptData::Prompt::Chat::Message::User,
                    Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant,
                    Braintrust::Models::PromptData::Prompt::Chat::Message::Tool,
                    Braintrust::Models::PromptData::Prompt::Chat::Message::Function,
                    Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback
                  )
                }
              end

            class System < Braintrust::BaseModel
              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::OrSymbol) }
              def role
              end

              sig do
                params(_: Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::OrSymbol)
                  .returns(Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::OrSymbol)
              end
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

              sig do
                params(
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::OrSymbol,
                  content: String,
                  name: String
                )
                  .returns(T.attached_class)
              end
              def self.new(role:, content: nil, name: nil)
              end

              sig do
                override
                  .returns(
                    {
                      role: Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::OrSymbol,
                      content: String,
                      name: String
                    }
                  )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::TaggedSymbol) }

                SYSTEM = T.let(:system, Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::OrSymbol)
              end
            end

            class User < Braintrust::BaseModel
              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::OrSymbol) }
              def role
              end

              sig do
                params(_: Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::OrSymbol)
                  .returns(Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::OrSymbol)
              end
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
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::OrSymbol,
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
                  .returns(T.attached_class)
              end
              def self.new(role:, content: nil, name: nil)
              end

              sig do
                override
                  .returns(
                    {
                      role: Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::OrSymbol,
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

              module Role
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::TaggedSymbol) }

                USER = T.let(:user, Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::OrSymbol)
              end

              module Content
                extend Braintrust::Union

                Variants =
                  type_template(:out) do
                    {
                      fixed: T.any(
                        String,
                        T::Array[
                        T.any(
                          Braintrust::Models::ChatCompletionContentPartText,
                          Braintrust::Models::ChatCompletionContentPartImage
                        )
                        ]
                      )
                    }
                  end

                Nested2DArray =
                  T.let(
                    Braintrust::ArrayOf[union: Braintrust::Models::PromptData::Prompt::Chat::Message::User::Content::Array],
                    Braintrust::Converter
                  )

                module Array
                  extend Braintrust::Union

                  Variants =
                    type_template(:out) do
                      {
                        fixed: T.any(
                          Braintrust::Models::ChatCompletionContentPartText,
                          Braintrust::Models::ChatCompletionContentPartImage
                        )
                      }
                    end
                end
              end
            end

            class Assistant < Braintrust::BaseModel
              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol) }
              def role
              end

              sig do
                params(_: Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol)
                  .returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol)
              end
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
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol,
                  content: T.nilable(String),
                  function_call: T.nilable(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall),
                  name: T.nilable(String),
                  tool_calls: T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])
                )
                  .returns(T.attached_class)
              end
              def self.new(role:, content: nil, function_call: nil, name: nil, tool_calls: nil)
              end

              sig do
                override
                  .returns(
                    {
                      role: Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol,
                      content: T.nilable(String),
                      function_call: T.nilable(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall),
                      name: T.nilable(String),
                      tool_calls: T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])
                    }
                  )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::TaggedSymbol) }

                ASSISTANT =
                  T.let(:assistant, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol)
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

                sig { params(arguments: String, name: String).returns(T.attached_class) }
                def self.new(arguments:, name:)
                end

                sig { override.returns({arguments: String, name: String}) }
                def to_hash
                end
              end
            end

            class Tool < Braintrust::BaseModel
              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol) }
              def role
              end

              sig do
                params(_: Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol)
                  .returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol)
              end
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

              sig do
                params(
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol,
                  content: String,
                  tool_call_id: String
                )
                  .returns(T.attached_class)
              end
              def self.new(role:, content: nil, tool_call_id: nil)
              end

              sig do
                override
                  .returns(
                    {
                      role: Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol,
                      content: String,
                      tool_call_id: String
                    }
                  )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::TaggedSymbol) }

                TOOL = T.let(:tool, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol)
              end
            end

            class Function < Braintrust::BaseModel
              sig { returns(String) }
              def name
              end

              sig { params(_: String).returns(String) }
              def name=(_)
              end

              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol) }
              def role
              end

              sig do
                params(_: Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol)
                  .returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol)
              end
              def role=(_)
              end

              sig { returns(T.nilable(String)) }
              def content
              end

              sig { params(_: String).returns(String) }
              def content=(_)
              end

              sig do
                params(
                  name: String,
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol,
                  content: String
                )
                  .returns(T.attached_class)
              end
              def self.new(name:, role:, content: nil)
              end

              sig do
                override
                  .returns(
                    {
                      name: String,
                      role: Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol,
                      content: String
                    }
                  )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::TaggedSymbol) }

                FUNCTION =
                  T.let(:function, Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol)
              end
            end

            class Fallback < Braintrust::BaseModel
              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol) }
              def role
              end

              sig do
                params(_: Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol)
                  .returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol)
              end
              def role=(_)
              end

              sig { returns(T.nilable(String)) }
              def content
              end

              sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
              def content=(_)
              end

              sig do
                params(
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol,
                  content: T.nilable(String)
                )
                  .returns(T.attached_class)
              end
              def self.new(role:, content: nil)
              end

              sig do
                override
                  .returns(
                    {
                      role: Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol,
                      content: T.nilable(String)
                    }
                  )
              end
              def to_hash
              end

              module Role
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::TaggedSymbol) }

                MODEL = T.let(:model, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol)
              end
            end
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Type::TaggedSymbol) }

            CHAT = T.let(:chat, Braintrust::Models::PromptData::Prompt::Chat::Type::OrSymbol)
          end
        end
      end

      module ToolFunction
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Braintrust::Models::PromptData::ToolFunction::Function,
                Braintrust::Models::PromptData::ToolFunction::Global
              )
            }
          end

        class Function < Braintrust::BaseModel
          sig { returns(String) }
          def id
          end

          sig { params(_: String).returns(String) }
          def id=(_)
          end

          sig { returns(Braintrust::Models::PromptData::ToolFunction::Function::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::PromptData::ToolFunction::Function::Type::OrSymbol)
              .returns(Braintrust::Models::PromptData::ToolFunction::Function::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(id: String, type: Braintrust::Models::PromptData::ToolFunction::Function::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(id:, type:)
          end

          sig do
            override
              .returns({id: String, type: Braintrust::Models::PromptData::ToolFunction::Function::Type::OrSymbol})
          end
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::ToolFunction::Function::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::ToolFunction::Function::Type::TaggedSymbol) }

            FUNCTION = T.let(:function, Braintrust::Models::PromptData::ToolFunction::Function::Type::OrSymbol)
          end
        end

        class Global < Braintrust::BaseModel
          sig { returns(String) }
          def name
          end

          sig { params(_: String).returns(String) }
          def name=(_)
          end

          sig { returns(Braintrust::Models::PromptData::ToolFunction::Global::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::PromptData::ToolFunction::Global::Type::OrSymbol)
              .returns(Braintrust::Models::PromptData::ToolFunction::Global::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(name: String, type: Braintrust::Models::PromptData::ToolFunction::Global::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override
              .returns({name: String, type: Braintrust::Models::PromptData::ToolFunction::Global::Type::OrSymbol})
          end
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::ToolFunction::Global::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::PromptData::ToolFunction::Global::Type::TaggedSymbol) }

            GLOBAL = T.let(:global, Braintrust::Models::PromptData::ToolFunction::Global::Type::OrSymbol)
          end
        end
      end
    end
  end
end
