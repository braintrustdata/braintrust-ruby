# frozen_string_literal: true

module Braintrust
  module Models
    class PromptData < Braintrust::Internal::Type::BaseModel
      # @!attribute options
      #
      #   @return [Braintrust::Models::PromptOptions, nil]
      optional :options, -> { Braintrust::PromptOptions }, nil?: true

      # @!attribute origin
      #
      #   @return [Braintrust::Models::PromptData::Origin, nil]
      optional :origin, -> { Braintrust::PromptData::Origin }, nil?: true

      # @!attribute parser
      #
      #   @return [Braintrust::Models::PromptData::Parser, nil]
      optional :parser, -> { Braintrust::PromptData::Parser }, nil?: true

      # @!attribute prompt
      #
      #   @return [Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat, nil]
      optional :prompt, union: -> { Braintrust::PromptData::Prompt }, nil?: true

      # @!attribute tool_functions
      #
      #   @return [Array<Braintrust::Models::PromptData::ToolFunction::Function, Braintrust::Models::PromptData::ToolFunction::Global>, nil]
      optional :tool_functions,
               -> { Braintrust::Internal::Type::ArrayOf[union: Braintrust::PromptData::ToolFunction] },
               nil?: true

      # @!method initialize(options: nil, origin: nil, parser: nil, prompt: nil, tool_functions: nil)
      #   The prompt, model, and its parameters
      #
      #   @param options [Braintrust::Models::PromptOptions, nil]
      #   @param origin [Braintrust::Models::PromptData::Origin, nil]
      #   @param parser [Braintrust::Models::PromptData::Parser, nil]
      #   @param prompt [Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat, nil]
      #   @param tool_functions [Array<Braintrust::Models::PromptData::ToolFunction::Function, Braintrust::Models::PromptData::ToolFunction::Global>, nil]

      # @see Braintrust::Models::PromptData#origin
      class Origin < Braintrust::Internal::Type::BaseModel
        # @!attribute project_id
        #
        #   @return [String, nil]
        optional :project_id, String

        # @!attribute prompt_id
        #
        #   @return [String, nil]
        optional :prompt_id, String

        # @!attribute prompt_version
        #
        #   @return [String, nil]
        optional :prompt_version, String

        # @!method initialize(project_id: nil, prompt_id: nil, prompt_version: nil)
        #   @param project_id [String]
        #   @param prompt_id [String]
        #   @param prompt_version [String]
      end

      # @see Braintrust::Models::PromptData#parser
      class Parser < Braintrust::Internal::Type::BaseModel
        # @!attribute choice_scores
        #
        #   @return [Hash{Symbol=>Float}]
        required :choice_scores, Braintrust::Internal::Type::HashOf[Float]

        # @!attribute type
        #
        #   @return [Symbol, Braintrust::Models::PromptData::Parser::Type]
        required :type, enum: -> { Braintrust::PromptData::Parser::Type }

        # @!attribute use_cot
        #
        #   @return [Boolean]
        required :use_cot, Braintrust::Internal::Type::Boolean

        # @!method initialize(choice_scores:, type:, use_cot:)
        #   @param choice_scores [Hash{Symbol=>Float}]
        #   @param type [Symbol, Braintrust::Models::PromptData::Parser::Type]
        #   @param use_cot [Boolean]

        # @see Braintrust::Models::PromptData::Parser#type
        module Type
          extend Braintrust::Internal::Type::Enum

          LLM_CLASSIFIER = :llm_classifier

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Braintrust::Models::PromptData#prompt
      module Prompt
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::PromptData::Prompt::Completion }

        variant -> { Braintrust::PromptData::Prompt::Chat }

        class Completion < Braintrust::Internal::Type::BaseModel
          # @!attribute content
          #
          #   @return [String]
          required :content, String

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Completion::Type]
          required :type, enum: -> { Braintrust::PromptData::Prompt::Completion::Type }

          # @!method initialize(content:, type:)
          #   @param content [String]
          #   @param type [Symbol, Braintrust::Models::PromptData::Prompt::Completion::Type]

          # @see Braintrust::Models::PromptData::Prompt::Completion#type
          module Type
            extend Braintrust::Internal::Type::Enum

            COMPLETION = :completion

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Chat < Braintrust::Internal::Type::BaseModel
          # @!attribute messages
          #
          #   @return [Array<Braintrust::Models::PromptData::Prompt::Chat::Message::System, Braintrust::Models::PromptData::Prompt::Chat::Message::User, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool, Braintrust::Models::PromptData::Prompt::Chat::Message::Function, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback>]
          required :messages,
                   -> {
                     Braintrust::Internal::Type::ArrayOf[union: Braintrust::PromptData::Prompt::Chat::Message]
                   }

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Type]
          required :type, enum: -> { Braintrust::PromptData::Prompt::Chat::Type }

          # @!attribute tools
          #
          #   @return [String, nil]
          optional :tools, String

          # @!method initialize(messages:, type:, tools: nil)
          #   @param messages [Array<Braintrust::Models::PromptData::Prompt::Chat::Message::System, Braintrust::Models::PromptData::Prompt::Chat::Message::User, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool, Braintrust::Models::PromptData::Prompt::Chat::Message::Function, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback>]
          #   @param type [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Type]
          #   @param tools [String]

          module Message
            extend Braintrust::Internal::Type::Union

            variant -> { Braintrust::PromptData::Prompt::Chat::Message::System }

            variant -> { Braintrust::PromptData::Prompt::Chat::Message::User }

            variant -> { Braintrust::PromptData::Prompt::Chat::Message::Assistant }

            variant -> { Braintrust::PromptData::Prompt::Chat::Message::Tool }

            variant -> { Braintrust::PromptData::Prompt::Chat::Message::Function }

            variant -> { Braintrust::PromptData::Prompt::Chat::Message::Fallback }

            class System < Braintrust::Internal::Type::BaseModel
              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role]
              required :role, enum: -> { Braintrust::PromptData::Prompt::Chat::Message::System::Role }

              # @!attribute content
              #
              #   @return [String, nil]
              optional :content, String

              # @!attribute name
              #
              #   @return [String, nil]
              optional :name, String

              # @!method initialize(role:, content: nil, name: nil)
              #   @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role]
              #   @param content [String]
              #   @param name [String]

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::System#role
              module Role
                extend Braintrust::Internal::Type::Enum

                SYSTEM = :system

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class User < Braintrust::Internal::Type::BaseModel
              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role]
              required :role, enum: -> { Braintrust::PromptData::Prompt::Chat::Message::User::Role }

              # @!attribute content
              #
              #   @return [String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>, nil]
              optional :content, union: -> { Braintrust::PromptData::Prompt::Chat::Message::User::Content }

              # @!attribute name
              #
              #   @return [String, nil]
              optional :name, String

              # @!method initialize(role:, content: nil, name: nil)
              #   @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role]
              #   @param content [String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>]
              #   @param name [String]

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::User#role
              module Role
                extend Braintrust::Internal::Type::Enum

                USER = :user

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::User#content
              module Content
                extend Braintrust::Internal::Type::Union

                variant String

                variant -> { Braintrust::Models::PromptData::Prompt::Chat::Message::User::Content::Nested2DArray }

                module Array
                  extend Braintrust::Internal::Type::Union

                  variant -> { Braintrust::ChatCompletionContentPartText }

                  variant -> { Braintrust::ChatCompletionContentPartImage }

                  # @!method self.variants
                  #   @return [Array(Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage)]
                end

                # @!method self.variants
                #   @return [Array(String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>)]

                # @type [Braintrust::Internal::Type::Converter]
                Nested2DArray =
                  Braintrust::Internal::Type::ArrayOf[union: -> {
                    Braintrust::PromptData::Prompt::Chat::Message::User::Content::Array
                  }]
              end
            end

            class Assistant < Braintrust::Internal::Type::BaseModel
              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role]
              required :role, enum: -> { Braintrust::PromptData::Prompt::Chat::Message::Assistant::Role }

              # @!attribute content
              #
              #   @return [String, nil]
              optional :content, String, nil?: true

              # @!attribute function_call
              #
              #   @return [Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall, nil]
              optional :function_call,
                       -> { Braintrust::PromptData::Prompt::Chat::Message::Assistant::FunctionCall },
                       nil?: true

              # @!attribute name
              #
              #   @return [String, nil]
              optional :name, String, nil?: true

              # @!attribute tool_calls
              #
              #   @return [Array<Braintrust::Models::ChatCompletionMessageToolCall>, nil]
              optional :tool_calls,
                       -> { Braintrust::Internal::Type::ArrayOf[Braintrust::ChatCompletionMessageToolCall] },
                       nil?: true

              # @!method initialize(role:, content: nil, function_call: nil, name: nil, tool_calls: nil)
              #   @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role]
              #   @param content [String, nil]
              #   @param function_call [Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall, nil]
              #   @param name [String, nil]
              #   @param tool_calls [Array<Braintrust::Models::ChatCompletionMessageToolCall>, nil]

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant#role
              module Role
                extend Braintrust::Internal::Type::Enum

                ASSISTANT = :assistant

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant#function_call
              class FunctionCall < Braintrust::Internal::Type::BaseModel
                # @!attribute arguments
                #
                #   @return [String]
                required :arguments, String

                # @!attribute name
                #
                #   @return [String]
                required :name, String

                # @!method initialize(arguments:, name:)
                #   @param arguments [String]
                #   @param name [String]
              end
            end

            class Tool < Braintrust::Internal::Type::BaseModel
              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role]
              required :role, enum: -> { Braintrust::PromptData::Prompt::Chat::Message::Tool::Role }

              # @!attribute content
              #
              #   @return [String, nil]
              optional :content, String

              # @!attribute tool_call_id
              #
              #   @return [String, nil]
              optional :tool_call_id, String

              # @!method initialize(role:, content: nil, tool_call_id: nil)
              #   @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role]
              #   @param content [String]
              #   @param tool_call_id [String]

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::Tool#role
              module Role
                extend Braintrust::Internal::Type::Enum

                TOOL = :tool

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class Function < Braintrust::Internal::Type::BaseModel
              # @!attribute name
              #
              #   @return [String]
              required :name, String

              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role]
              required :role, enum: -> { Braintrust::PromptData::Prompt::Chat::Message::Function::Role }

              # @!attribute content
              #
              #   @return [String, nil]
              optional :content, String

              # @!method initialize(name:, role:, content: nil)
              #   @param name [String]
              #   @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role]
              #   @param content [String]

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::Function#role
              module Role
                extend Braintrust::Internal::Type::Enum

                FUNCTION = :function

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class Fallback < Braintrust::Internal::Type::BaseModel
              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role]
              required :role, enum: -> { Braintrust::PromptData::Prompt::Chat::Message::Fallback::Role }

              # @!attribute content
              #
              #   @return [String, nil]
              optional :content, String, nil?: true

              # @!method initialize(role:, content: nil)
              #   @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role]
              #   @param content [String, nil]

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback#role
              module Role
                extend Braintrust::Internal::Type::Enum

                MODEL = :model

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Braintrust::Models::PromptData::Prompt::Chat::Message::System, Braintrust::Models::PromptData::Prompt::Chat::Message::User, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool, Braintrust::Models::PromptData::Prompt::Chat::Message::Function, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback)]
          end

          # @see Braintrust::Models::PromptData::Prompt::Chat#type
          module Type
            extend Braintrust::Internal::Type::Enum

            CHAT = :chat

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat)]
      end

      module ToolFunction
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::PromptData::ToolFunction::Function }

        variant -> { Braintrust::PromptData::ToolFunction::Global }

        class Function < Braintrust::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::PromptData::ToolFunction::Function::Type]
          required :type, enum: -> { Braintrust::PromptData::ToolFunction::Function::Type }

          # @!method initialize(id:, type:)
          #   @param id [String]
          #   @param type [Symbol, Braintrust::Models::PromptData::ToolFunction::Function::Type]

          # @see Braintrust::Models::PromptData::ToolFunction::Function#type
          module Type
            extend Braintrust::Internal::Type::Enum

            FUNCTION = :function

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::PromptData::ToolFunction::Global::Type]
          required :type, enum: -> { Braintrust::PromptData::ToolFunction::Global::Type }

          # @!method initialize(name:, type:)
          #   @param name [String]
          #   @param type [Symbol, Braintrust::Models::PromptData::ToolFunction::Global::Type]

          # @see Braintrust::Models::PromptData::ToolFunction::Global#type
          module Type
            extend Braintrust::Internal::Type::Enum

            GLOBAL = :global

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::Models::PromptData::ToolFunction::Function, Braintrust::Models::PromptData::ToolFunction::Global)]
      end
    end
  end
end
