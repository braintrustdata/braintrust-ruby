# frozen_string_literal: true

module Braintrust
  module Models
    class PromptData < Braintrust::Internal::Type::BaseModel
      # @!attribute options
      #
      #   @return [Braintrust::Models::PromptOptions, nil]
      optional :options, -> { Braintrust::Models::PromptOptions }, nil?: true

      # @!attribute origin
      #
      #   @return [Braintrust::Models::PromptData::Origin, nil]
      optional :origin, -> { Braintrust::Models::PromptData::Origin }, nil?: true

      # @!attribute parser
      #
      #   @return [Braintrust::Models::PromptData::Parser, nil]
      optional :parser, -> { Braintrust::Models::PromptData::Parser }, nil?: true

      # @!attribute prompt
      #
      #   @return [Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat, nil]
      optional :prompt, union: -> { Braintrust::Models::PromptData::Prompt }, nil?: true

      # @!attribute tool_functions
      #
      #   @return [Array<Braintrust::Models::PromptData::ToolFunction::Function, Braintrust::Models::PromptData::ToolFunction::Global>, nil]
      optional :tool_functions,
               -> { Braintrust::Internal::Type::ArrayOf[union: Braintrust::Models::PromptData::ToolFunction] },
               nil?: true

      # @!parse
      #   # The prompt, model, and its parameters
      #   #
      #   # @param options [Braintrust::Models::PromptOptions, nil]
      #   # @param origin [Braintrust::Models::PromptData::Origin, nil]
      #   # @param parser [Braintrust::Models::PromptData::Parser, nil]
      #   # @param prompt [Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat, nil]
      #   # @param tool_functions [Array<Braintrust::Models::PromptData::ToolFunction::Function, Braintrust::Models::PromptData::ToolFunction::Global>, nil]
      #   #
      #   def initialize(options: nil, origin: nil, parser: nil, prompt: nil, tool_functions: nil, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      # @see Braintrust::Models::PromptData#origin
      class Origin < Braintrust::Internal::Type::BaseModel
        # @!attribute [r] project_id
        #
        #   @return [String, nil]
        optional :project_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :project_id

        # @!attribute [r] prompt_id
        #
        #   @return [String, nil]
        optional :prompt_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :prompt_id

        # @!attribute [r] prompt_version
        #
        #   @return [String, nil]
        optional :prompt_version, String

        # @!parse
        #   # @return [String]
        #   attr_writer :prompt_version

        # @!parse
        #   # @param project_id [String]
        #   # @param prompt_id [String]
        #   # @param prompt_version [String]
        #   #
        #   def initialize(project_id: nil, prompt_id: nil, prompt_version: nil, **) = super

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
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
        required :type, enum: -> { Braintrust::Models::PromptData::Parser::Type }

        # @!attribute use_cot
        #
        #   @return [Boolean]
        required :use_cot, Braintrust::Internal::Type::Boolean

        # @!parse
        #   # @param choice_scores [Hash{Symbol=>Float}]
        #   # @param type [Symbol, Braintrust::Models::PromptData::Parser::Type]
        #   # @param use_cot [Boolean]
        #   #
        #   def initialize(choice_scores:, type:, use_cot:, **) = super

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

        # @see Braintrust::Models::PromptData::Parser#type
        module Type
          extend Braintrust::Internal::Type::Enum

          LLM_CLASSIFIER = :llm_classifier

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      # @see Braintrust::Models::PromptData#prompt
      module Prompt
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::Models::PromptData::Prompt::Completion }

        variant -> { Braintrust::Models::PromptData::Prompt::Chat }

        class Completion < Braintrust::Internal::Type::BaseModel
          # @!attribute content
          #
          #   @return [String]
          required :content, String

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Completion::Type]
          required :type, enum: -> { Braintrust::Models::PromptData::Prompt::Completion::Type }

          # @!parse
          #   # @param content [String]
          #   # @param type [Symbol, Braintrust::Models::PromptData::Prompt::Completion::Type]
          #   #
          #   def initialize(content:, type:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::PromptData::Prompt::Completion#type
          module Type
            extend Braintrust::Internal::Type::Enum

            COMPLETION = :completion

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end

        class Chat < Braintrust::Internal::Type::BaseModel
          # @!attribute messages
          #
          #   @return [Array<Braintrust::Models::PromptData::Prompt::Chat::Message::System, Braintrust::Models::PromptData::Prompt::Chat::Message::User, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool, Braintrust::Models::PromptData::Prompt::Chat::Message::Function, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback>]
          required :messages,
                   -> { Braintrust::Internal::Type::ArrayOf[union: Braintrust::Models::PromptData::Prompt::Chat::Message] }

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Type]
          required :type, enum: -> { Braintrust::Models::PromptData::Prompt::Chat::Type }

          # @!attribute [r] tools
          #
          #   @return [String, nil]
          optional :tools, String

          # @!parse
          #   # @return [String]
          #   attr_writer :tools

          # @!parse
          #   # @param messages [Array<Braintrust::Models::PromptData::Prompt::Chat::Message::System, Braintrust::Models::PromptData::Prompt::Chat::Message::User, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool, Braintrust::Models::PromptData::Prompt::Chat::Message::Function, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback>]
          #   # @param type [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Type]
          #   # @param tools [String]
          #   #
          #   def initialize(messages:, type:, tools: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          module Message
            extend Braintrust::Internal::Type::Union

            variant -> { Braintrust::Models::PromptData::Prompt::Chat::Message::System }

            variant -> { Braintrust::Models::PromptData::Prompt::Chat::Message::User }

            variant -> { Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant }

            variant -> { Braintrust::Models::PromptData::Prompt::Chat::Message::Tool }

            variant -> { Braintrust::Models::PromptData::Prompt::Chat::Message::Function }

            variant -> { Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback }

            class System < Braintrust::Internal::Type::BaseModel
              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role]
              required :role, enum: -> { Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role }

              # @!attribute [r] content
              #
              #   @return [String, nil]
              optional :content, String

              # @!parse
              #   # @return [String]
              #   attr_writer :content

              # @!attribute [r] name
              #
              #   @return [String, nil]
              optional :name, String

              # @!parse
              #   # @return [String]
              #   attr_writer :name

              # @!parse
              #   # @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::System::Role]
              #   # @param content [String]
              #   # @param name [String]
              #   #
              #   def initialize(role:, content: nil, name: nil, **) = super

              # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::System#role
              module Role
                extend Braintrust::Internal::Type::Enum

                SYSTEM = :system

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
              end
            end

            class User < Braintrust::Internal::Type::BaseModel
              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role]
              required :role, enum: -> { Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role }

              # @!attribute [r] content
              #
              #   @return [String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>, nil]
              optional :content, union: -> { Braintrust::Models::PromptData::Prompt::Chat::Message::User::Content }

              # @!parse
              #   # @return [String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>]
              #   attr_writer :content

              # @!attribute [r] name
              #
              #   @return [String, nil]
              optional :name, String

              # @!parse
              #   # @return [String]
              #   attr_writer :name

              # @!parse
              #   # @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::User::Role]
              #   # @param content [String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>]
              #   # @param name [String]
              #   #
              #   def initialize(role:, content: nil, name: nil, **) = super

              # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::User#role
              module Role
                extend Braintrust::Internal::Type::Enum

                USER = :user

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
              end

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::User#content
              module Content
                extend Braintrust::Internal::Type::Union

                variant String

                variant -> { Braintrust::Models::PromptData::Prompt::Chat::Message::User::Content::Nested2DArray }

                module Array
                  extend Braintrust::Internal::Type::Union

                  variant -> { Braintrust::Models::ChatCompletionContentPartText }

                  variant -> { Braintrust::Models::ChatCompletionContentPartImage }

                  # @!parse
                  #   # @return [Array(Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage)]
                  #   def self.variants; end
                end

                # @!parse
                #   # @return [Array(String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>)]
                #   def self.variants; end

                Nested2DArray =
                  Braintrust::Internal::Type::ArrayOf[union: -> { Braintrust::Models::PromptData::Prompt::Chat::Message::User::Content::Array }]
              end
            end

            class Assistant < Braintrust::Internal::Type::BaseModel
              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role]
              required :role, enum: -> { Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role }

              # @!attribute content
              #
              #   @return [String, nil]
              optional :content, String, nil?: true

              # @!attribute function_call
              #
              #   @return [Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall, nil]
              optional :function_call,
                       -> { Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall },
                       nil?: true

              # @!attribute name
              #
              #   @return [String, nil]
              optional :name, String, nil?: true

              # @!attribute tool_calls
              #
              #   @return [Array<Braintrust::Models::ChatCompletionMessageToolCall>, nil]
              optional :tool_calls,
                       -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::ChatCompletionMessageToolCall] },
                       nil?: true

              # @!parse
              #   # @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::Role]
              #   # @param content [String, nil]
              #   # @param function_call [Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant::FunctionCall, nil]
              #   # @param name [String, nil]
              #   # @param tool_calls [Array<Braintrust::Models::ChatCompletionMessageToolCall>, nil]
              #   #
              #   def initialize(role:, content: nil, function_call: nil, name: nil, tool_calls: nil, **) = super

              # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant#role
              module Role
                extend Braintrust::Internal::Type::Enum

                ASSISTANT = :assistant

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
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

                # @!parse
                #   # @param arguments [String]
                #   # @param name [String]
                #   #
                #   def initialize(arguments:, name:, **) = super

                # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
              end
            end

            class Tool < Braintrust::Internal::Type::BaseModel
              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role]
              required :role, enum: -> { Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role }

              # @!attribute [r] content
              #
              #   @return [String, nil]
              optional :content, String

              # @!parse
              #   # @return [String]
              #   attr_writer :content

              # @!attribute [r] tool_call_id
              #
              #   @return [String, nil]
              optional :tool_call_id, String

              # @!parse
              #   # @return [String]
              #   attr_writer :tool_call_id

              # @!parse
              #   # @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool::Role]
              #   # @param content [String]
              #   # @param tool_call_id [String]
              #   #
              #   def initialize(role:, content: nil, tool_call_id: nil, **) = super

              # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::Tool#role
              module Role
                extend Braintrust::Internal::Type::Enum

                TOOL = :tool

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
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
              required :role, enum: -> { Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role }

              # @!attribute [r] content
              #
              #   @return [String, nil]
              optional :content, String

              # @!parse
              #   # @return [String]
              #   attr_writer :content

              # @!parse
              #   # @param name [String]
              #   # @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Function::Role]
              #   # @param content [String]
              #   #
              #   def initialize(name:, role:, content: nil, **) = super

              # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::Function#role
              module Role
                extend Braintrust::Internal::Type::Enum

                FUNCTION = :function

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
              end
            end

            class Fallback < Braintrust::Internal::Type::BaseModel
              # @!attribute role
              #
              #   @return [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role]
              required :role, enum: -> { Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role }

              # @!attribute content
              #
              #   @return [String, nil]
              optional :content, String, nil?: true

              # @!parse
              #   # @param role [Symbol, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback::Role]
              #   # @param content [String, nil]
              #   #
              #   def initialize(role:, content: nil, **) = super

              # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

              # @see Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback#role
              module Role
                extend Braintrust::Internal::Type::Enum

                MODEL = :model

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
              end
            end

            # @!parse
            #   # @return [Array(Braintrust::Models::PromptData::Prompt::Chat::Message::System, Braintrust::Models::PromptData::Prompt::Chat::Message::User, Braintrust::Models::PromptData::Prompt::Chat::Message::Assistant, Braintrust::Models::PromptData::Prompt::Chat::Message::Tool, Braintrust::Models::PromptData::Prompt::Chat::Message::Function, Braintrust::Models::PromptData::Prompt::Chat::Message::Fallback)]
            #   def self.variants; end
          end

          # @see Braintrust::Models::PromptData::Prompt::Chat#type
          module Type
            extend Braintrust::Internal::Type::Enum

            CHAT = :chat

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end

        # @!parse
        #   # @return [Array(Braintrust::Models::PromptData::Prompt::Completion, Braintrust::Models::PromptData::Prompt::Chat)]
        #   def self.variants; end
      end

      module ToolFunction
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::Models::PromptData::ToolFunction::Function }

        variant -> { Braintrust::Models::PromptData::ToolFunction::Global }

        class Function < Braintrust::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::PromptData::ToolFunction::Function::Type]
          required :type, enum: -> { Braintrust::Models::PromptData::ToolFunction::Function::Type }

          # @!parse
          #   # @param id [String]
          #   # @param type [Symbol, Braintrust::Models::PromptData::ToolFunction::Function::Type]
          #   #
          #   def initialize(id:, type:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::PromptData::ToolFunction::Function#type
          module Type
            extend Braintrust::Internal::Type::Enum

            FUNCTION = :function

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
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
          required :type, enum: -> { Braintrust::Models::PromptData::ToolFunction::Global::Type }

          # @!parse
          #   # @param name [String]
          #   # @param type [Symbol, Braintrust::Models::PromptData::ToolFunction::Global::Type]
          #   #
          #   def initialize(name:, type:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::PromptData::ToolFunction::Global#type
          module Type
            extend Braintrust::Internal::Type::Enum

            GLOBAL = :global

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end

        # @!parse
        #   # @return [Array(Braintrust::Models::PromptData::ToolFunction::Function, Braintrust::Models::PromptData::ToolFunction::Global)]
        #   def self.variants; end
      end
    end
  end
end
