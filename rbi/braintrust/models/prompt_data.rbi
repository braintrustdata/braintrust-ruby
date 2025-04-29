# typed: strong

module Braintrust
  module Models
    class PromptData < Braintrust::Internal::Type::BaseModel
      sig { returns(T.nilable(Braintrust::Models::PromptOptions)) }
      attr_reader :options

      sig { params(options: T.nilable(T.any(Braintrust::Models::PromptOptions, Braintrust::Internal::AnyHash))).void }
      attr_writer :options

      sig { returns(T.nilable(Braintrust::Models::PromptData::Origin)) }
      attr_reader :origin

      sig do
        params(origin: T.nilable(T.any(Braintrust::Models::PromptData::Origin, Braintrust::Internal::AnyHash)))
          .void
      end
      attr_writer :origin

      sig { returns(T.nilable(Braintrust::Models::PromptData::Parser)) }
      attr_reader :parser

      sig do
        params(parser: T.nilable(T.any(Braintrust::Models::PromptData::Parser, Braintrust::Internal::AnyHash)))
          .void
      end
      attr_writer :parser

      sig do
        returns(
          T.nilable(
            T.any(Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat)
          )
        )
      end
      attr_accessor :prompt

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
      attr_accessor :tool_functions

      # The prompt, model, and its parameters
      sig do
        params(
          options: T.nilable(T.any(Braintrust::Models::PromptOptions, Braintrust::Internal::AnyHash)),
          origin: T.nilable(T.any(Braintrust::Models::PromptData::Origin, Braintrust::Internal::AnyHash)),
          parser: T.nilable(T.any(Braintrust::Models::PromptData::Parser, Braintrust::Internal::AnyHash)),
          prompt: T.nilable(
            T.any(
              Braintrust::Models::PromptData::Prompt::Completion,
              Braintrust::Internal::AnyHash,
              Braintrust::Models::PromptData::Prompt::Chat
            )
          ),
          tool_functions: T.nilable(
            T::Array[
              T.any(
                Braintrust::Models::PromptData::ToolFunction::Function,
                Braintrust::Internal::AnyHash,
                Braintrust::Models::PromptData::ToolFunction::Global
              )
            ]
          )
        )
          .returns(T.attached_class)
      end
      def self.new(options: nil, origin: nil, parser: nil, prompt: nil, tool_functions: nil); end

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
      def to_hash; end

      class Origin < Braintrust::Internal::Type::BaseModel
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
          params(project_id: String, prompt_id: String, prompt_version: String).returns(T.attached_class)
        end
        def self.new(project_id: nil, prompt_id: nil, prompt_version: nil); end

        sig { override.returns({project_id: String, prompt_id: String, prompt_version: String}) }
        def to_hash; end
      end

      class Parser < Braintrust::Internal::Type::BaseModel
        sig { returns(T::Hash[Symbol, Float]) }
        attr_accessor :choice_scores

        sig { returns(Braintrust::Models::PromptData::Parser::Type::OrSymbol) }
        attr_accessor :type

        sig { returns(T::Boolean) }
        attr_accessor :use_cot

        sig do
          params(
            choice_scores: T::Hash[Symbol, Float],
            type: Braintrust::Models::PromptData::Parser::Type::OrSymbol,
            use_cot: T::Boolean
          )
            .returns(T.attached_class)
        end
        def self.new(choice_scores:, type:, use_cot:); end

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
        def to_hash; end

        module Type
          extend Braintrust::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Parser::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LLM_CLASSIFIER = T.let(:llm_classifier, Braintrust::Models::PromptData::Parser::Type::TaggedSymbol)

          sig { override.returns(T::Array[Braintrust::Models::PromptData::Parser::Type::TaggedSymbol]) }
          def self.values; end
        end
      end

      module Prompt
        extend Braintrust::Internal::Type::Union

        class Completion < Braintrust::Internal::Type::BaseModel
          sig { returns(String) }
          attr_accessor :content

          sig { returns(Braintrust::Models::PromptData::Prompt::Completion::Type::OrSymbol) }
          attr_accessor :type

          sig do
            params(content: String, type: Braintrust::Models::PromptData::Prompt::Completion::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(content:, type:); end

          sig do
            override
              .returns({content: String, type: Braintrust::Models::PromptData::Prompt::Completion::Type::OrSymbol})
          end
          def to_hash; end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Completion::Type) }
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            COMPLETION = T.let(:completion, Braintrust::Models::PromptData::Prompt::Completion::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::PromptData::Prompt::Completion::Type::TaggedSymbol]) }
            def self.values; end
          end
        end

        class Chat < Braintrust::Internal::Type::BaseModel
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
          attr_accessor :messages

          sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Type::OrSymbol) }
          attr_accessor :type

          sig { returns(T.nilable(String)) }
          attr_reader :tools

          sig { params(tools: String).void }
          attr_writer :tools

          sig do
            params(
              messages: T::Array[
                T.any(
                  Braintrust::Models::PromptData::Prompt::Chat::Message::System,
                  Braintrust::Internal::AnyHash,
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
          def self.new(messages:, type:, tools: nil); end

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
          def to_hash; end

          module Message
            extend Braintrust::Internal::Type::Union

            class System < Braintrust::Internal::Type::BaseModel
              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::OrSymbol) }
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
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::OrSymbol,
                  content: String,
                  name: String
                )
                  .returns(T.attached_class)
              end
              def self.new(role:, content: nil, name: nil); end

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
              def to_hash; end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role) }
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                SYSTEM =
                  T.let(:system, Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::TaggedSymbol)

                sig do
                  override
                    .returns(T::Array[Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role::TaggedSymbol])
                end
                def self.values; end
              end
            end

            class User < Braintrust::Internal::Type::BaseModel
              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::OrSymbol) }
              attr_accessor :role

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
              attr_reader :content

              sig do
                params(
                  content: T.any(
                    String,
                    T::Array[
                      T.any(
                        Braintrust::Models::ChatCompletionContentPartText,
                        Braintrust::Internal::AnyHash,
                        Braintrust::Models::ChatCompletionContentPartImage
                      )
                    ]
                  )
                )
                  .void
              end
              attr_writer :content

              sig { returns(T.nilable(String)) }
              attr_reader :name

              sig { params(name: String).void }
              attr_writer :name

              sig do
                params(
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::OrSymbol,
                  content: T.any(
                    String,
                    T::Array[
                      T.any(
                        Braintrust::Models::ChatCompletionContentPartText,
                        Braintrust::Internal::AnyHash,
                        Braintrust::Models::ChatCompletionContentPartImage
                      )
                    ]
                  ),
                  name: String
                )
                  .returns(T.attached_class)
              end
              def self.new(role:, content: nil, name: nil); end

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
              def to_hash; end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role) }
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                USER = T.let(:user, Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::TaggedSymbol)

                sig do
                  override.returns(T::Array[Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role::TaggedSymbol])
                end
                def self.values; end
              end

              module Content
                extend Braintrust::Internal::Type::Union

                module Array
                  extend Braintrust::Internal::Type::Union

                  sig do
                    override
                      .returns(
                        [Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage]
                      )
                  end
                  def self.variants; end
                end

                sig do
                  override
                    .returns(
                      [
                        String,
                        T::Array[
                                                T.any(
                                                  Braintrust::Models::ChatCompletionContentPartText,
                                                  Braintrust::Models::ChatCompletionContentPartImage
                                                )
                                              ]
                      ]
                    )
                end
                def self.variants; end

                Nested2DArray =
                  T.let(
                    Braintrust::Internal::Type::ArrayOf[union: Braintrust::Models::PromptData::Prompt::Chat::Message::User::Content::Array],
                    Braintrust::Internal::Type::Converter
                  )
              end
            end

            class Assistant < Braintrust::Internal::Type::BaseModel
              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol) }
              attr_accessor :role

              sig { returns(T.nilable(String)) }
              attr_accessor :content

              sig { returns(T.nilable(Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall)) }
              attr_reader :function_call

              sig do
                params(
                  function_call: T.nilable(
                    T.any(
                      Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall,
                      Braintrust::Internal::AnyHash
                    )
                  )
                )
                  .void
              end
              attr_writer :function_call

              sig { returns(T.nilable(String)) }
              attr_accessor :name

              sig { returns(T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])) }
              attr_accessor :tool_calls

              sig do
                params(
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::OrSymbol,
                  content: T.nilable(String),
                  function_call: T.nilable(
                    T.any(
                      Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall,
                      Braintrust::Internal::AnyHash
                    )
                  ),
                  name: T.nilable(String),
                  tool_calls: T.nilable(
                    T::Array[T.any(Braintrust::Models::ChatCompletionMessageToolCall, Braintrust::Internal::AnyHash)]
                  )
                )
                  .returns(T.attached_class)
              end
              def self.new(role:, content: nil, function_call: nil, name: nil, tool_calls: nil); end

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
              def to_hash; end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role) }
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ASSISTANT =
                  T.let(:assistant, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::TaggedSymbol)

                sig do
                  override
                    .returns(T::Array[Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role::TaggedSymbol])
                end
                def self.values; end
              end

              class FunctionCall < Braintrust::Internal::Type::BaseModel
                sig { returns(String) }
                attr_accessor :arguments

                sig { returns(String) }
                attr_accessor :name

                sig { params(arguments: String, name: String).returns(T.attached_class) }
                def self.new(arguments:, name:); end

                sig { override.returns({arguments: String, name: String}) }
                def to_hash; end
              end
            end

            class Tool < Braintrust::Internal::Type::BaseModel
              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol) }
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
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::OrSymbol,
                  content: String,
                  tool_call_id: String
                )
                  .returns(T.attached_class)
              end
              def self.new(role:, content: nil, tool_call_id: nil); end

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
              def to_hash; end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role) }
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                TOOL = T.let(:tool, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::TaggedSymbol)

                sig do
                  override.returns(T::Array[Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role::TaggedSymbol])
                end
                def self.values; end
              end
            end

            class Function < Braintrust::Internal::Type::BaseModel
              sig { returns(String) }
              attr_accessor :name

              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol) }
              attr_accessor :role

              sig { returns(T.nilable(String)) }
              attr_reader :content

              sig { params(content: String).void }
              attr_writer :content

              sig do
                params(
                  name: String,
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::OrSymbol,
                  content: String
                )
                  .returns(T.attached_class)
              end
              def self.new(name:, role:, content: nil); end

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
              def to_hash; end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role) }
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                FUNCTION =
                  T.let(:function, Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::TaggedSymbol)

                sig do
                  override
                    .returns(T::Array[Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role::TaggedSymbol])
                end
                def self.values; end
              end
            end

            class Fallback < Braintrust::Internal::Type::BaseModel
              sig { returns(Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol) }
              attr_accessor :role

              sig { returns(T.nilable(String)) }
              attr_accessor :content

              sig do
                params(
                  role: Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol,
                  content: T.nilable(String)
                )
                  .returns(T.attached_class)
              end
              def self.new(role:, content: nil); end

              sig do
                override
                  .returns(
                    {
                      role: Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::OrSymbol,
                      content: T.nilable(String)
                    }
                  )
              end
              def to_hash; end

              module Role
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role) }
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                MODEL =
                  T.let(:model, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::TaggedSymbol)

                sig do
                  override
                    .returns(T::Array[Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role::TaggedSymbol])
                end
                def self.values; end
              end
            end

            sig do
              override
                .returns(
                  [Braintrust::Models::PromptData::Prompt::Chat::Message::System, Braintrust::Models::PromptData::Prompt::Chat::Message::User, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool, Braintrust::Models::PromptData::Prompt::Chat::Message::Function, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback]
                )
            end
            def self.variants; end
          end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::Prompt::Chat::Type) }
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CHAT = T.let(:chat, Braintrust::Models::PromptData::Prompt::Chat::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::PromptData::Prompt::Chat::Type::TaggedSymbol]) }
            def self.values; end
          end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat]
            )
        end
        def self.variants; end
      end

      module ToolFunction
        extend Braintrust::Internal::Type::Union

        class Function < Braintrust::Internal::Type::BaseModel
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Braintrust::Models::PromptData::ToolFunction::Function::Type::OrSymbol) }
          attr_accessor :type

          sig do
            params(id: String, type: Braintrust::Models::PromptData::ToolFunction::Function::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(id:, type:); end

          sig do
            override
              .returns({id: String, type: Braintrust::Models::PromptData::ToolFunction::Function::Type::OrSymbol})
          end
          def to_hash; end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::ToolFunction::Function::Type) }
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FUNCTION = T.let(:function, Braintrust::Models::PromptData::ToolFunction::Function::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::PromptData::ToolFunction::Function::Type::TaggedSymbol]) }
            def self.values; end
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          sig { returns(String) }
          attr_accessor :name

          sig { returns(Braintrust::Models::PromptData::ToolFunction::Global::Type::OrSymbol) }
          attr_accessor :type

          sig do
            params(name: String, type: Braintrust::Models::PromptData::ToolFunction::Global::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(name:, type:); end

          sig do
            override
              .returns({name: String, type: Braintrust::Models::PromptData::ToolFunction::Global::Type::OrSymbol})
          end
          def to_hash; end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PromptData::ToolFunction::Global::Type) }
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GLOBAL = T.let(:global, Braintrust::Models::PromptData::ToolFunction::Global::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::PromptData::ToolFunction::Global::Type::TaggedSymbol]) }
            def self.values; end
          end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::PromptData::ToolFunction::Function, Braintrust::Models::PromptData::ToolFunction::Global]
            )
        end
        def self.variants; end
      end
    end
  end
end
