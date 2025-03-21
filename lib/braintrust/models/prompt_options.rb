# frozen_string_literal: true

module Braintrust
  module Models
    class PromptOptions < Braintrust::BaseModel
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

      # @!parse
      #   # @param model [String]
      #   # @param params [Braintrust::Models::PromptOptions::Params::OpenAIModelParams, Braintrust::Models::PromptOptions::Params::AnthropicModelParams, Braintrust::Models::PromptOptions::Params::GoogleModelParams, Braintrust::Models::PromptOptions::Params::WindowAIModelParams, Braintrust::Models::PromptOptions::Params::JsCompletionParams]
      #   # @param position [String]
      #   #
      #   def initialize(model: nil, params: nil, position: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      module Params
        extend Braintrust::Union

        variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams }

        variant -> { Braintrust::Models::PromptOptions::Params::AnthropicModelParams }

        variant -> { Braintrust::Models::PromptOptions::Params::GoogleModelParams }

        variant -> { Braintrust::Models::PromptOptions::Params::WindowAIModelParams }

        variant -> { Braintrust::Models::PromptOptions::Params::JsCompletionParams }

        class OpenAIModelParams < Braintrust::BaseModel
          # @!attribute [r] frequency_penalty
          #
          #   @return [Float, nil]
          optional :frequency_penalty, Float

          # @!parse
          #   # @return [Float]
          #   attr_writer :frequency_penalty

          # @!attribute [r] function_call
          #
          #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function, nil]
          optional :function_call,
                   union: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall }

          # @!parse
          #   # @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function]
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
          optional :stop, Braintrust::ArrayOf[String]

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
          #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function, nil]
          optional :tool_choice,
                   union: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice }

          # @!parse
          #   # @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function]
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
          optional :use_cache, Braintrust::BooleanModel

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :use_cache

          # @!parse
          #   # @param frequency_penalty [Float]
          #   # @param function_call [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function]
          #   # @param max_completion_tokens [Float]
          #   # @param max_tokens [Float]
          #   # @param n [Float]
          #   # @param presence_penalty [Float]
          #   # @param reasoning_effort [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ReasoningEffort]
          #   # @param response_format [Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text, nil]
          #   # @param stop [Array<String>]
          #   # @param temperature [Float]
          #   # @param tool_choice [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function]
          #   # @param top_p [Float]
          #   # @param use_cache [Boolean]
          #   #
          #   def initialize(
          #     frequency_penalty: nil,
          #     function_call: nil,
          #     max_completion_tokens: nil,
          #     max_tokens: nil,
          #     n: nil,
          #     presence_penalty: nil,
          #     reasoning_effort: nil,
          #     response_format: nil,
          #     stop: nil,
          #     temperature: nil,
          #     tool_choice: nil,
          #     top_p: nil,
          #     use_cache: nil,
          #     **
          #   )
          #     super
          #   end

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          module FunctionCall
            extend Braintrust::Union

            # @!group

            AUTO = :auto
            NONE = :none

            # @!endgroup

            variant const: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::AUTO

            variant const: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::NONE

            variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function }

            class Function < Braintrust::BaseModel
              # @!attribute name
              #
              #   @return [String]
              required :name, String

              # @!parse
              #   # @param name [String]
              #   #
              #   def initialize(name:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void
            end

            # @!parse
            #   class << self
            #     # @return [Array(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function)]
            #     def variants; end
            #   end
          end

          module ReasoningEffort
            extend Braintrust::Enum

            LOW = :low
            MEDIUM = :medium
            HIGH = :high

            finalize!
          end

          module ResponseFormat
            extend Braintrust::Union

            variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject }

            variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema }

            variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text }

            class JsonObject < Braintrust::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type]
              required :type,
                       enum: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type }

              # @!parse
              #   # @param type [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type]
              #   #
              #   def initialize(type:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void

              module Type
                extend Braintrust::Enum

                JSON_OBJECT = :json_object

                finalize!
              end
            end

            class JsonSchema < Braintrust::BaseModel
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

              # @!parse
              #   # @param json_schema [Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema]
              #   # @param type [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type]
              #   #
              #   def initialize(json_schema:, type:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void

              class JsonSchema < Braintrust::BaseModel
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
                optional :strict, Braintrust::BooleanModel, nil?: true

                # @!parse
                #   # @param name [String]
                #   # @param description [String]
                #   # @param schema [Hash{Symbol=>Object, nil}, String]
                #   # @param strict [Boolean, nil]
                #   #
                #   def initialize(name:, description: nil, schema: nil, strict: nil, **) = super

                # def initialize: (Hash | Braintrust::BaseModel) -> void

                module Schema
                  extend Braintrust::Union

                  ObjectMap = Braintrust::HashOf[Braintrust::Unknown, nil?: true]

                  variant Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::Schema::ObjectMap

                  variant String

                  # @!parse
                  #   class << self
                  #     # @return [Array(Hash{Symbol=>Object, nil}, String)]
                  #     def variants; end
                  #   end
                end
              end

              module Type
                extend Braintrust::Enum

                JSON_SCHEMA = :json_schema

                finalize!
              end
            end

            class Text < Braintrust::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type]
              required :type,
                       enum: -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type }

              # @!parse
              #   # @param type [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type]
              #   #
              #   def initialize(type:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void

              module Type
                extend Braintrust::Enum

                TEXT = :text

                finalize!
              end
            end

            # @!parse
            #   class << self
            #     # @return [Array(Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text)]
            #     def variants; end
            #   end
          end

          module ToolChoice
            extend Braintrust::Union

            # @!group

            AUTO = :auto
            NONE = :none
            REQUIRED = :required

            # @!endgroup

            variant const: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::AUTO

            variant const: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::NONE

            variant const: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::REQUIRED

            variant -> { Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function }

            class Function < Braintrust::BaseModel
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

              # @!parse
              #   # @param function [Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function]
              #   # @param type [Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type]
              #   #
              #   def initialize(function:, type:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void

              class Function < Braintrust::BaseModel
                # @!attribute name
                #
                #   @return [String]
                required :name, String

                # @!parse
                #   # @param name [String]
                #   #
                #   def initialize(name:, **) = super

                # def initialize: (Hash | Braintrust::BaseModel) -> void
              end

              module Type
                extend Braintrust::Enum

                FUNCTION = :function

                finalize!
              end
            end

            # @!parse
            #   class << self
            #     # @return [Array(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function)]
            #     def variants; end
            #   end
          end
        end

        class AnthropicModelParams < Braintrust::BaseModel
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
          optional :stop_sequences, Braintrust::ArrayOf[String]

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
          optional :use_cache, Braintrust::BooleanModel

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :use_cache

          # @!parse
          #   # @param max_tokens [Float]
          #   # @param temperature [Float]
          #   # @param max_tokens_to_sample [Float]
          #   # @param stop_sequences [Array<String>]
          #   # @param top_k [Float]
          #   # @param top_p [Float]
          #   # @param use_cache [Boolean]
          #   #
          #   def initialize(
          #     max_tokens:,
          #     temperature:,
          #     max_tokens_to_sample: nil,
          #     stop_sequences: nil,
          #     top_k: nil,
          #     top_p: nil,
          #     use_cache: nil,
          #     **
          #   )
          #     super
          #   end

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class GoogleModelParams < Braintrust::BaseModel
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
          optional :use_cache, Braintrust::BooleanModel

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :use_cache

          # @!parse
          #   # @param max_output_tokens [Float]
          #   # @param temperature [Float]
          #   # @param top_k [Float]
          #   # @param top_p [Float]
          #   # @param use_cache [Boolean]
          #   #
          #   def initialize(max_output_tokens: nil, temperature: nil, top_k: nil, top_p: nil, use_cache: nil, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class WindowAIModelParams < Braintrust::BaseModel
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
          optional :use_cache, Braintrust::BooleanModel

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :use_cache

          # @!parse
          #   # @param temperature [Float]
          #   # @param top_k [Float]
          #   # @param use_cache [Boolean]
          #   #
          #   def initialize(temperature: nil, top_k: nil, use_cache: nil, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        class JsCompletionParams < Braintrust::BaseModel
          # @!attribute [r] use_cache
          #
          #   @return [Boolean, nil]
          optional :use_cache, Braintrust::BooleanModel

          # @!parse
          #   # @return [Boolean]
          #   attr_writer :use_cache

          # @!parse
          #   # @param use_cache [Boolean]
          #   #
          #   def initialize(use_cache: nil, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void
        end

        # @!parse
        #   class << self
        #     # @return [Array(Braintrust::Models::PromptOptions::Params::OpenAIModelParams, Braintrust::Models::PromptOptions::Params::AnthropicModelParams, Braintrust::Models::PromptOptions::Params::GoogleModelParams, Braintrust::Models::PromptOptions::Params::WindowAIModelParams, Braintrust::Models::PromptOptions::Params::JsCompletionParams)]
        #     def variants; end
        #   end
      end
    end
  end
end
