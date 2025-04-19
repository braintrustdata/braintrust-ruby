# frozen_string_literal: true

module Braintrust
  module Models
    class PromptOptions < Braintrust::Internal::Type::BaseModel
      # @!attribute [r] model
      #
      #   @return [String, nil]
      optional :model, String

      # @!parse
      #   # @return [String]
      #   attr_writer :model

      # @!attribute [r] params
      #
      #   @return [Braintrust::Models::PromptOptions::Params::OpenAIModelParams, Braintrust::Models::PromptOptions::Params::AnthropicModelParams, Braintrust::Models::PromptOptions::Params::GoogleModelParams, Braintrust::Models::PromptOptions::Params::WindowAIModelParams, Braintrust::Models::PromptOptions::Params::JsCompletionParams, nil]
      optional :params, union: -> { Braintrust::Models::PromptOptions::Params }

      # @!parse
      #   # @return [Braintrust::Models::PromptOptions::Params::OpenAIModelParams, Braintrust::Models::PromptOptions::Params::AnthropicModelParams, Braintrust::Models::PromptOptions::Params::GoogleModelParams, Braintrust::Models::PromptOptions::Params::WindowAIModelParams, Braintrust::Models::PromptOptions::Params::JsCompletionParams]
      #   attr_writer :params

      # @!attribute [r] position
      #
      #   @return [String, nil]
      optional :position, String

      # @!parse
      #   # @return [String]
      #   attr_writer :position

      # @!method initialize(model: nil, params: nil, position: nil)
      #   @param model [String]
      #   @param params [Braintrust::Models::PromptOptions::Params::OpenAIModelParams, Braintrust::Models::PromptOptions::Params::AnthropicModelParams, Braintrust::Models::PromptOptions::Params::GoogleModelParams, Braintrust::Models::PromptOptions::Params::WindowAIModelParams, Braintrust::Models::PromptOptions::Params::JsCompletionParams]
      #   @param position [String]

      # @see Braintrust::Models::PromptOptions#params
      module Params
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams }

        variant -> { Braintrust::Models::PromptOptions::Params::AnthropicModelParams }

        variant -> { Braintrust::Models::PromptOptions::Params::GoogleModelParams }

        variant -> { Braintrust::Models::PromptOptions::Params::WindowAIModelParams }

        variant -> { Braintrust::Models::PromptOptions::Params::JsCompletionParams }

        class OpenAIModelParams < Braintrust::Internal::Type::BaseModel
          # @!attribute [r] frequency_penalty
          #
          #   @return [Float, nil]
          optional :frequency_penalty, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :frequency_penalty

          # @!attribute [r] function_call
          #
          #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall, nil]
          optional :function_call,
                   union: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall }

          # @!parse
          #   # @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall]
          #   attr_writer :function_call

          # @!attribute [r] max_completion_tokens
          #   The successor to max_tokens
          #
          #   @return [Float, nil]
          optional :max_completion_tokens, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :max_completion_tokens

          # @!attribute [r] max_tokens
          #
          #   @return [Float, nil]
          optional :max_tokens, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :max_tokens

          # @!attribute [r] n
          #
          #   @return [Float, nil]
          optional :n, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :n

          # @!attribute [r] presence_penalty
          #
          #   @return [Float, nil]
          optional :presence_penalty, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :presence_penalty

          # @!attribute [r] reasoning_effort
          #
          #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ReasoningEffort, nil]
          optional :reasoning_effort,
                   enum: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ReasoningEffort }

          # @!parse
          #   # @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ReasoningEffort]
          #   attr_writer :reasoning_effort

          # @!attribute response_format
          #
          #   @return [Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text, nil]
          optional :response_format,
                   union: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat },
                   nil?: true

          # @!attribute [r] stop
          #
          #   @return [Array<String>, nil]
          optional :stop, Braintrust::Internal::Type::ArrayOf[String]

          # @!parse
          #   # @return [Array<String>]
          #   attr_writer :stop

          # @!attribute [r] temperature
          #
          #   @return [Float, nil]
          optional :temperature, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :temperature

          # @!attribute [r] tool_choice
          #
          #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice, nil]
          optional :tool_choice,
                   union: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice }

          # @!parse
          #   # @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice]
          #   attr_writer :tool_choice

          # @!attribute [r] top_p
          #
          #   @return [Float, nil]
          optional :top_p, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :top_p

          # @!attribute [r] use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::Internal::Type::Boolean

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :use_cache

          # @!method initialize(frequency_penalty: nil, function_call: nil, max_completion_tokens: nil, max_tokens: nil, n: nil, presence_penalty: nil, reasoning_effort: nil, response_format: nil, stop: nil, temperature: nil, tool_choice: nil, top_p: nil, use_cache: nil)
          #   @param frequency_penalty [Float]
          #   @param function_call [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall]
          #   @param max_completion_tokens [Float]
          #   @param max_tokens [Float]
          #   @param n [Float]
          #   @param presence_penalty [Float]
          #   @param reasoning_effort [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ReasoningEffort]
          #   @param response_format [Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text, nil]
          #   @param stop [Array<String>]
          #   @param temperature [Float]
          #   @param tool_choice [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice]
          #   @param top_p [Float]
          #   @param use_cache [Boolean]

          # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams#function_call
          module FunctionCall
            extend Braintrust::Internal::Type::Union

            variant const: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::AUTO }

            variant const: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::NONE }

            variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function }

            class Function < Braintrust::Internal::Type::BaseModel
              # @!attribute name
              #
              #   @return [String]
              required :name, String

              # @!method initialize(name:)
              #   @param name [String]
            end

            # @!method self.variants
            #   @return [Array(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function)]

            # @!group

            AUTO = :auto
            NONE = :none

            # @!endgroup
          end

          # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams#reasoning_effort
          module ReasoningEffort
            extend Braintrust::Internal::Type::Enum

            LOW = :low
            MEDIUM = :medium
            HIGH = :high

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams#response_format
          module ResponseFormat
            extend Braintrust::Internal::Type::Union

            variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject }

            variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema }

            variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text }

            class JsonObject < Braintrust::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type]
              required :type,
                       enum: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type }

              # @!method initialize(type:)
              #   @param type [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type]

              # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject#type
              module Type
                extend Braintrust::Internal::Type::Enum

                JSON_OBJECT = :json_object

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class JsonSchema < Braintrust::Internal::Type::BaseModel
              # @!attribute json_schema
              #
              #   @return [Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema]
              required :json_schema,
                       -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema }

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type]
              required :type,
                       enum: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type }

              # @!method initialize(json_schema:, type:)
              #   @param json_schema [Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema]
              #   @param type [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type]

              # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema#json_schema
              class JsonSchema < Braintrust::Internal::Type::BaseModel
                # @!attribute name
                #
                #   @return [String]
                required :name, String

                # @!attribute [r] description
                #
                #   @return [String, nil]
                optional :description, String

                # @!parse
                #   # @return [String]
                #   attr_writer :description

                # @!attribute [r] schema
                #
                #   @return [Hash{Symbol=>Object, nil}, String, nil]
                optional :schema,
                         union: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::Schema }

                # @!parse
                #   # @return [Hash{Symbol=>Object, nil}, String]
                #   attr_writer :schema

                # @!attribute strict
                #
                #   @return [Boolean, nil]
                optional :strict, Braintrust::Internal::Type::Boolean, nil?: true

                # @!method initialize(name:, description: nil, schema: nil, strict: nil)
                #   @param name [String]
                #   @param description [String]
                #   @param schema [Hash{Symbol=>Object, nil}, String]
                #   @param strict [Boolean, nil]

                # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema#schema
                module Schema
                  extend Braintrust::Internal::Type::Union

                  variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::Schema::ObjectMap }

                  variant String

                  # @!method self.variants
                  #   @return [Array(Hash{Symbol=>Object, nil}, String)]

                  ObjectMap = Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                                 nil?: true]
                end
              end

              # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema#type
              module Type
                extend Braintrust::Internal::Type::Enum

                JSON_SCHEMA = :json_schema

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class Text < Braintrust::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type]
              required :type,
                       enum: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type }

              # @!method initialize(type:)
              #   @param type [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type]

              # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text#type
              module Type
                extend Braintrust::Internal::Type::Enum

                TEXT = :text

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text)]
          end

          # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams#tool_choice
          module ToolChoice
            extend Braintrust::Internal::Type::Union

            variant const: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::AUTO }

            variant const: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::NONE }

            variant const: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::REQUIRED }

            variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function }

            class Function < Braintrust::Internal::Type::BaseModel
              # @!attribute function
              #
              #   @return [Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function]
              required :function,
                       -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function }

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type]
              required :type,
                       enum: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type }

              # @!method initialize(function:, type:)
              #   @param function [Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function]
              #   @param type [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type]

              # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function#function
              class Function < Braintrust::Internal::Type::BaseModel
                # @!attribute name
                #
                #   @return [String]
                required :name, String

                # @!method initialize(name:)
                #   @param name [String]
              end

              # @see Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function#type
              module Type
                extend Braintrust::Internal::Type::Enum

                FUNCTION = :function

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function)]

            # @!group

            AUTO = :auto
            NONE = :none
            REQUIRED = :required

            # @!endgroup
          end
        end

        class AnthropicModelParams < Braintrust::Internal::Type::BaseModel
          # @!attribute max_tokens
          #
          #   @return [Float]
          required :max_tokens, Float

          # @!attribute temperature
          #
          #   @return [Float]
          required :temperature, Float

          # @!attribute [r] max_tokens_to_sample
          #   This is a legacy parameter that should not be used.
          #
          #   @return [Float, nil]
          optional :max_tokens_to_sample, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :max_tokens_to_sample

          # @!attribute [r] stop_sequences
          #
          #   @return [Array<String>, nil]
          optional :stop_sequences, Braintrust::Internal::Type::ArrayOf[String]

          # @!parse
          #   # @return [Array<String>]
          #   attr_writer :stop_sequences

          # @!attribute [r] top_k
          #
          #   @return [Float, nil]
          optional :top_k, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :top_k

          # @!attribute [r] top_p
          #
          #   @return [Float, nil]
          optional :top_p, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :top_p

          # @!attribute [r] use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::Internal::Type::Boolean

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :use_cache

          # @!method initialize(max_tokens:, temperature:, max_tokens_to_sample: nil, stop_sequences: nil, top_k: nil, top_p: nil, use_cache: nil)
          #   @param max_tokens [Float]
          #   @param temperature [Float]
          #   @param max_tokens_to_sample [Float]
          #   @param stop_sequences [Array<String>]
          #   @param top_k [Float]
          #   @param top_p [Float]
          #   @param use_cache [Boolean]
        end

        class GoogleModelParams < Braintrust::Internal::Type::BaseModel
          # @!attribute [r] max_output_tokens
          #
          #   @return [Float, nil]
          optional :max_output_tokens, Float, api_name: :maxOutputTokens

          # @!parse
          #   # @return [Float]
          #   attr_writer :max_output_tokens

          # @!attribute [r] temperature
          #
          #   @return [Float, nil]
          optional :temperature, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :temperature

          # @!attribute [r] top_k
          #
          #   @return [Float, nil]
          optional :top_k, Float, api_name: :topK

          # @!parse
          #   # @return [Float]
          #   attr_writer :top_k

          # @!attribute [r] top_p
          #
          #   @return [Float, nil]
          optional :top_p, Float, api_name: :topP

          # @!parse
          #   # @return [Float]
          #   attr_writer :top_p

          # @!attribute [r] use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::Internal::Type::Boolean

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :use_cache

          # @!method initialize(max_output_tokens: nil, temperature: nil, top_k: nil, top_p: nil, use_cache: nil)
          #   @param max_output_tokens [Float]
          #   @param temperature [Float]
          #   @param top_k [Float]
          #   @param top_p [Float]
          #   @param use_cache [Boolean]
        end

        class WindowAIModelParams < Braintrust::Internal::Type::BaseModel
          # @!attribute [r] temperature
          #
          #   @return [Float, nil]
          optional :temperature, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :temperature

          # @!attribute [r] top_k
          #
          #   @return [Float, nil]
          optional :top_k, Float, api_name: :topK

          # @!parse
          #   # @return [Float]
          #   attr_writer :top_k

          # @!attribute [r] use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::Internal::Type::Boolean

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :use_cache

          # @!method initialize(temperature: nil, top_k: nil, use_cache: nil)
          #   @param temperature [Float]
          #   @param top_k [Float]
          #   @param use_cache [Boolean]
        end

        class JsCompletionParams < Braintrust::Internal::Type::BaseModel
          # @!attribute [r] use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::Internal::Type::Boolean

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :use_cache

          # @!method initialize(use_cache: nil)
          #   @param use_cache [Boolean]
        end

        # @!method self.variants
        #   @return [Array(Braintrust::Models::PromptOptions::Params::OpenAIModelParams, Braintrust::Models::PromptOptions::Params::AnthropicModelParams, Braintrust::Models::PromptOptions::Params::GoogleModelParams, Braintrust::Models::PromptOptions::Params::WindowAIModelParams, Braintrust::Models::PromptOptions::Params::JsCompletionParams)]
      end
    end
  end
end
