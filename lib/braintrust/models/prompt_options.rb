# frozen_string_literal: true

module Braintrust
  module Models
    class PromptOptions < Braintrust::Internal::Type::BaseModel
      # @!attribute model
      #
      #   @return [String, nil]
      optional :model, String

      # @!attribute params
      #
      #   @return [Braintrust::PromptOptions::Params::OpenAIModelParams, Braintrust::PromptOptions::Params::AnthropicModelParams, Braintrust::PromptOptions::Params::GoogleModelParams, Braintrust::PromptOptions::Params::WindowAIModelParams, Braintrust::PromptOptions::Params::JsCompletionParams, nil]
      optional :params, union: -> { Braintrust::PromptOptions::Params }

      # @!attribute position
      #
      #   @return [String, nil]
      optional :position, String

      # @!method initialize(model: nil, params: nil, position: nil)
      #   @param model [String]
      #   @param params [Braintrust::PromptOptions::Params::OpenAIModelParams, Braintrust::PromptOptions::Params::AnthropicModelParams, Braintrust::PromptOptions::Params::GoogleModelParams, Braintrust::PromptOptions::Params::WindowAIModelParams, Braintrust::PromptOptions::Params::JsCompletionParams]
      #   @param position [String]

      # @see Braintrust::PromptOptions#params
      module Params
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::PromptOptions::Params::OpenAIModelParams }

        variant -> { Braintrust::PromptOptions::Params::AnthropicModelParams }

        variant -> { Braintrust::PromptOptions::Params::GoogleModelParams }

        variant -> { Braintrust::PromptOptions::Params::WindowAIModelParams }

        variant -> { Braintrust::PromptOptions::Params::JsCompletionParams }

        class OpenAIModelParams < Braintrust::Internal::Type::BaseModel
          # @!attribute frequency_penalty
          #
          #   @return [Float, nil]
          optional :frequency_penalty, Float

          # @!attribute function_call
          #
          #   @return [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function, Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall, nil]
          optional :function_call,
                   union: -> {
                     Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall
                   }

          # @!attribute max_completion_tokens
          #   The successor to max_tokens
          #
          #   @return [Float, nil]
          optional :max_completion_tokens, Float

          # @!attribute max_tokens
          #
          #   @return [Float, nil]
          optional :max_tokens, Float

          # @!attribute n
          #
          #   @return [Float, nil]
          optional :n, Float

          # @!attribute presence_penalty
          #
          #   @return [Float, nil]
          optional :presence_penalty, Float

          # @!attribute reasoning_effort
          #
          #   @return [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort, nil]
          optional :reasoning_effort,
                   enum: -> { Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort }

          # @!attribute response_format
          #
          #   @return [Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text, nil]
          optional :response_format,
                   union: -> { Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat },
                   nil?: true

          # @!attribute stop
          #
          #   @return [Array<String>, nil]
          optional :stop, Braintrust::Internal::Type::ArrayOf[String]

          # @!attribute temperature
          #
          #   @return [Float, nil]
          optional :temperature, Float

          # @!attribute tool_choice
          #
          #   @return [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function, Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice, nil]
          optional :tool_choice,
                   union: -> {
                     Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice
                   }

          # @!attribute top_p
          #
          #   @return [Float, nil]
          optional :top_p, Float

          # @!attribute use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::Internal::Type::Boolean

          # @!method initialize(frequency_penalty: nil, function_call: nil, max_completion_tokens: nil, max_tokens: nil, n: nil, presence_penalty: nil, reasoning_effort: nil, response_format: nil, stop: nil, temperature: nil, tool_choice: nil, top_p: nil, use_cache: nil)
          #   @param frequency_penalty [Float]
          #
          #   @param function_call [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function, Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall]
          #
          #   @param max_completion_tokens [Float] The successor to max_tokens
          #
          #   @param max_tokens [Float]
          #
          #   @param n [Float]
          #
          #   @param presence_penalty [Float]
          #
          #   @param reasoning_effort [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort]
          #
          #   @param response_format [Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text, nil]
          #
          #   @param stop [Array<String>]
          #
          #   @param temperature [Float]
          #
          #   @param tool_choice [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function, Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice]
          #
          #   @param top_p [Float]
          #
          #   @param use_cache [Boolean]

          # @see Braintrust::PromptOptions::Params::OpenAIModelParams#function_call
          module FunctionCall
            extend Braintrust::Internal::Type::Union

            variant const: -> { Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::AUTO }

            variant const: -> { Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::NONE }

            variant -> { Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function }

            class Function < Braintrust::Internal::Type::BaseModel
              # @!attribute name
              #
              #   @return [String]
              required :name, String

              # @!method initialize(name:)
              #   @param name [String]
            end

            # @!method self.variants
            #   @return [Array(Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function)]

            define_sorbet_constant!(:Variants) do
              T.type_alias do
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::TaggedSymbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function
                )
              end
            end

            # @!group

            AUTO = :auto
            NONE = :none

            # @!endgroup
          end

          # @see Braintrust::PromptOptions::Params::OpenAIModelParams#reasoning_effort
          module ReasoningEffort
            extend Braintrust::Internal::Type::Enum

            LOW = :low
            MEDIUM = :medium
            HIGH = :high

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Braintrust::PromptOptions::Params::OpenAIModelParams#response_format
          module ResponseFormat
            extend Braintrust::Internal::Type::Union

            variant -> { Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject }

            variant -> { Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema }

            variant -> { Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text }

            class JsonObject < Braintrust::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type]
              required :type,
                       enum: -> {
                         Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type
                       }

              # @!method initialize(type:)
              #   @param type [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type]

              # @see Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject#type
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
              #   @return [Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema]
              required :json_schema,
                       -> {
                         Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema
                       }

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type]
              required :type,
                       enum: -> {
                         Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type
                       }

              # @!method initialize(json_schema:, type:)
              #   @param json_schema [Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema]
              #   @param type [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type]

              # @see Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema#json_schema
              class JsonSchema < Braintrust::Internal::Type::BaseModel
                # @!attribute name
                #
                #   @return [String]
                required :name, String

                # @!attribute description
                #
                #   @return [String, nil]
                optional :description, String

                # @!attribute schema
                #
                #   @return [Hash{Symbol=>Object, nil}, String, nil]
                optional :schema,
                         union: -> {
                           Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::Schema
                         }

                # @!attribute strict
                #
                #   @return [Boolean, nil]
                optional :strict, Braintrust::Internal::Type::Boolean, nil?: true

                # @!method initialize(name:, description: nil, schema: nil, strict: nil)
                #   @param name [String]
                #   @param description [String]
                #   @param schema [Hash{Symbol=>Object, nil}, String]
                #   @param strict [Boolean, nil]

                # @see Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema#schema
                module Schema
                  extend Braintrust::Internal::Type::Union

                  variant -> {
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::Schema::ObjectMap
                  }

                  variant String

                  # @!method self.variants
                  #   @return [Array(Hash{Symbol=>Object, nil}, String)]

                  define_sorbet_constant!(:Variants) do
                    T.type_alias { T.any(T::Hash[Symbol, T.nilable(T.anything)], String) }
                  end

                  # @type [Braintrust::Internal::Type::Converter]
                  ObjectMap = Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown,
                                                                 nil?: true]
                end
              end

              # @see Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema#type
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
              #   @return [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type]
              required :type,
                       enum: -> {
                         Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type
                       }

              # @!method initialize(type:)
              #   @param type [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type]

              # @see Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text#type
              module Type
                extend Braintrust::Internal::Type::Enum

                TEXT = :text

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema, Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text)]

            define_sorbet_constant!(:Variants) do
              T.type_alias do
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text
                )
              end
            end
          end

          # @see Braintrust::PromptOptions::Params::OpenAIModelParams#tool_choice
          module ToolChoice
            extend Braintrust::Internal::Type::Union

            variant const: -> { Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::AUTO }

            variant const: -> { Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::NONE }

            variant const: -> { Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::REQUIRED }

            variant -> { Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function }

            class Function < Braintrust::Internal::Type::BaseModel
              # @!attribute function
              #
              #   @return [Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function]
              required :function,
                       -> {
                         Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function
                       }

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type]
              required :type,
                       enum: -> {
                         Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type
                       }

              # @!method initialize(function:, type:)
              #   @param function [Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function]
              #   @param type [Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type]

              # @see Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function#function
              class Function < Braintrust::Internal::Type::BaseModel
                # @!attribute name
                #
                #   @return [String]
                required :name, String

                # @!method initialize(name:)
                #   @param name [String]
              end

              # @see Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function#type
              module Type
                extend Braintrust::Internal::Type::Enum

                FUNCTION = :function

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Symbol, Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function)]

            define_sorbet_constant!(:Variants) do
              T.type_alias do
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::TaggedSymbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function
                )
              end
            end

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

          # @!attribute max_tokens_to_sample
          #   This is a legacy parameter that should not be used.
          #
          #   @return [Float, nil]
          optional :max_tokens_to_sample, Float

          # @!attribute stop_sequences
          #
          #   @return [Array<String>, nil]
          optional :stop_sequences, Braintrust::Internal::Type::ArrayOf[String]

          # @!attribute top_k
          #
          #   @return [Float, nil]
          optional :top_k, Float

          # @!attribute top_p
          #
          #   @return [Float, nil]
          optional :top_p, Float

          # @!attribute use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::Internal::Type::Boolean

          # @!method initialize(max_tokens:, temperature:, max_tokens_to_sample: nil, stop_sequences: nil, top_k: nil, top_p: nil, use_cache: nil)
          #   @param max_tokens [Float]
          #
          #   @param temperature [Float]
          #
          #   @param max_tokens_to_sample [Float] This is a legacy parameter that should not be used.
          #
          #   @param stop_sequences [Array<String>]
          #
          #   @param top_k [Float]
          #
          #   @param top_p [Float]
          #
          #   @param use_cache [Boolean]
        end

        class GoogleModelParams < Braintrust::Internal::Type::BaseModel
          # @!attribute max_output_tokens
          #
          #   @return [Float, nil]
          optional :max_output_tokens, Float, api_name: :maxOutputTokens

          # @!attribute temperature
          #
          #   @return [Float, nil]
          optional :temperature, Float

          # @!attribute top_k
          #
          #   @return [Float, nil]
          optional :top_k, Float, api_name: :topK

          # @!attribute top_p
          #
          #   @return [Float, nil]
          optional :top_p, Float, api_name: :topP

          # @!attribute use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::Internal::Type::Boolean

          # @!method initialize(max_output_tokens: nil, temperature: nil, top_k: nil, top_p: nil, use_cache: nil)
          #   @param max_output_tokens [Float]
          #   @param temperature [Float]
          #   @param top_k [Float]
          #   @param top_p [Float]
          #   @param use_cache [Boolean]
        end

        class WindowAIModelParams < Braintrust::Internal::Type::BaseModel
          # @!attribute temperature
          #
          #   @return [Float, nil]
          optional :temperature, Float

          # @!attribute top_k
          #
          #   @return [Float, nil]
          optional :top_k, Float, api_name: :topK

          # @!attribute use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::Internal::Type::Boolean

          # @!method initialize(temperature: nil, top_k: nil, use_cache: nil)
          #   @param temperature [Float]
          #   @param top_k [Float]
          #   @param use_cache [Boolean]
        end

        class JsCompletionParams < Braintrust::Internal::Type::BaseModel
          # @!attribute use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::Internal::Type::Boolean

          # @!method initialize(use_cache: nil)
          #   @param use_cache [Boolean]
        end

        # @!method self.variants
        #   @return [Array(Braintrust::PromptOptions::Params::OpenAIModelParams, Braintrust::PromptOptions::Params::AnthropicModelParams, Braintrust::PromptOptions::Params::GoogleModelParams, Braintrust::PromptOptions::Params::WindowAIModelParams, Braintrust::PromptOptions::Params::JsCompletionParams)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              Braintrust::PromptOptions::Params::OpenAIModelParams,
              Braintrust::PromptOptions::Params::AnthropicModelParams,
              Braintrust::PromptOptions::Params::GoogleModelParams,
              Braintrust::PromptOptions::Params::WindowAIModelParams,
              Braintrust::PromptOptions::Params::JsCompletionParams
            )
          end
        end
      end
    end
  end
end
