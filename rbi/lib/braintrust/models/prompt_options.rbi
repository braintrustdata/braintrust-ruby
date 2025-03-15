# typed: strong

module Braintrust
  module Models
    class PromptOptions < Braintrust::BaseModel
      sig { returns(T.nilable(String)) }
      def model
      end

      sig { params(_: String).returns(String) }
      def model=(_)
      end

      sig do
        returns(
          T.nilable(
            T.any(
              Braintrust::Models::PromptOptions::Params::OpenAIModelParams,
              Braintrust::Models::PromptOptions::Params::AnthropicModelParams,
              Braintrust::Models::PromptOptions::Params::GoogleModelParams,
              Braintrust::Models::PromptOptions::Params::WindowAIModelParams,
              Braintrust::Models::PromptOptions::Params::JsCompletionParams
            )
          )
        )
      end
      def params
      end

      sig do
        params(
          _: T.any(
            Braintrust::Models::PromptOptions::Params::OpenAIModelParams,
            Braintrust::Models::PromptOptions::Params::AnthropicModelParams,
            Braintrust::Models::PromptOptions::Params::GoogleModelParams,
            Braintrust::Models::PromptOptions::Params::WindowAIModelParams,
            Braintrust::Models::PromptOptions::Params::JsCompletionParams
          )
        )
          .returns(
            T.any(
              Braintrust::Models::PromptOptions::Params::OpenAIModelParams,
              Braintrust::Models::PromptOptions::Params::AnthropicModelParams,
              Braintrust::Models::PromptOptions::Params::GoogleModelParams,
              Braintrust::Models::PromptOptions::Params::WindowAIModelParams,
              Braintrust::Models::PromptOptions::Params::JsCompletionParams
            )
          )
      end
      def params=(_)
      end

      sig { returns(T.nilable(String)) }
      def position
      end

      sig { params(_: String).returns(String) }
      def position=(_)
      end

      sig do
        params(
          model: String,
          params: T.any(
            Braintrust::Models::PromptOptions::Params::OpenAIModelParams,
            Braintrust::Models::PromptOptions::Params::AnthropicModelParams,
            Braintrust::Models::PromptOptions::Params::GoogleModelParams,
            Braintrust::Models::PromptOptions::Params::WindowAIModelParams,
            Braintrust::Models::PromptOptions::Params::JsCompletionParams
          ),
          position: String
        )
          .returns(T.attached_class)
      end
      def self.new(model: nil, params: nil, position: nil)
      end

      sig do
        override
          .returns(
            {
              model: String,
              params: T.any(
                Braintrust::Models::PromptOptions::Params::OpenAIModelParams,
                Braintrust::Models::PromptOptions::Params::AnthropicModelParams,
                Braintrust::Models::PromptOptions::Params::GoogleModelParams,
                Braintrust::Models::PromptOptions::Params::WindowAIModelParams,
                Braintrust::Models::PromptOptions::Params::JsCompletionParams
              ),
              position: String
            }
          )
      end
      def to_hash
      end

      class Params < Braintrust::Union
        abstract!

        class OpenAIModelParams < Braintrust::BaseModel
          sig { returns(T.nilable(Float)) }
          def frequency_penalty
          end

          sig { params(_: Float).returns(Float) }
          def frequency_penalty=(_)
          end

          sig do
            returns(
              T.nilable(
                T.any(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function)
              )
            )
          end
          def function_call
          end

          sig do
            params(
              _: T.any(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function)
            )
              .returns(
                T.any(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function)
              )
          end
          def function_call=(_)
          end

          # The successor to max_tokens
          sig { returns(T.nilable(Float)) }
          def max_completion_tokens
          end

          sig { params(_: Float).returns(Float) }
          def max_completion_tokens=(_)
          end

          sig { returns(T.nilable(Float)) }
          def max_tokens
          end

          sig { params(_: Float).returns(Float) }
          def max_tokens=(_)
          end

          sig { returns(T.nilable(Float)) }
          def n
          end

          sig { params(_: Float).returns(Float) }
          def n=(_)
          end

          sig { returns(T.nilable(Float)) }
          def presence_penalty
          end

          sig { params(_: Float).returns(Float) }
          def presence_penalty=(_)
          end

          sig { returns(T.nilable(Symbol)) }
          def reasoning_effort
          end

          sig { params(_: Symbol).returns(Symbol) }
          def reasoning_effort=(_)
          end

          sig do
            returns(
              T.nilable(
                T.any(
                  Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject,
                  Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema,
                  Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text
                )
              )
            )
          end
          def response_format
          end

          sig do
            params(
              _: T.nilable(
                T.any(
                  Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject,
                  Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema,
                  Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text
                )
              )
            )
              .returns(
                T.nilable(
                  T.any(
                    Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject,
                    Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema,
                    Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text
                  )
                )
              )
          end
          def response_format=(_)
          end

          sig { returns(T.nilable(T::Array[String])) }
          def stop
          end

          sig { params(_: T::Array[String]).returns(T::Array[String]) }
          def stop=(_)
          end

          sig { returns(T.nilable(Float)) }
          def temperature
          end

          sig { params(_: Float).returns(Float) }
          def temperature=(_)
          end

          sig do
            returns(
              T.nilable(
                T.any(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function)
              )
            )
          end
          def tool_choice
          end

          sig do
            params(
              _: T.any(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function)
            )
              .returns(T.any(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function))
          end
          def tool_choice=(_)
          end

          sig { returns(T.nilable(Float)) }
          def top_p
          end

          sig { params(_: Float).returns(Float) }
          def top_p=(_)
          end

          sig { returns(T.nilable(T::Boolean)) }
          def use_cache
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def use_cache=(_)
          end

          sig do
            params(
              frequency_penalty: Float,
              function_call: T.any(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function),
              max_completion_tokens: Float,
              max_tokens: Float,
              n: Float,
              presence_penalty: Float,
              reasoning_effort: Symbol,
              response_format: T.nilable(
                T.any(
                  Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject,
                  Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema,
                  Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text
                )
              ),
              stop: T::Array[String],
              temperature: Float,
              tool_choice: T.any(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function),
              top_p: Float,
              use_cache: T::Boolean
            )
              .returns(T.attached_class)
          end
          def self.new(
            frequency_penalty: nil,
            function_call: nil,
            max_completion_tokens: nil,
            max_tokens: nil,
            n: nil,
            presence_penalty: nil,
            reasoning_effort: nil,
            response_format: nil,
            stop: nil,
            temperature: nil,
            tool_choice: nil,
            top_p: nil,
            use_cache: nil
          )
          end

          sig do
            override
              .returns(
                {
                  frequency_penalty: Float,
                  function_call: T.any(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function),
                  max_completion_tokens: Float,
                  max_tokens: Float,
                  n: Float,
                  presence_penalty: Float,
                  reasoning_effort: Symbol,
                  response_format: T.nilable(
                    T.any(
                      Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject,
                      Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema,
                      Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text
                    )
                  ),
                  stop: T::Array[String],
                  temperature: Float,
                  tool_choice: T.any(Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function),
                  top_p: Float,
                  use_cache: T::Boolean
                }
              )
          end
          def to_hash
          end

          class FunctionCall < Braintrust::Union
            abstract!

            class UnionMember0 < Braintrust::Enum
              abstract!

              AUTO = :auto
              NONE = :none

              class << self
                sig { override.returns(T::Array[Symbol]) }
                def values
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

              sig { params(name: String).returns(T.attached_class) }
              def self.new(name:)
              end

              sig { override.returns({name: String}) }
              def to_hash
              end
            end

            class << self
              sig do
                override
                  .returns([Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function])
              end
              def variants
              end
            end
          end

          class ReasoningEffort < Braintrust::Enum
            abstract!

            LOW = :low
            MEDIUM = :medium
            HIGH = :high

            class << self
              sig { override.returns(T::Array[Symbol]) }
              def values
              end
            end
          end

          class ResponseFormat < Braintrust::Union
            abstract!

            class JsonObject < Braintrust::BaseModel
              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig { params(type: Symbol).returns(T.attached_class) }
              def self.new(type:)
              end

              sig { override.returns({type: Symbol}) }
              def to_hash
              end

              class Type < Braintrust::Enum
                abstract!

                JSON_OBJECT = :json_object

                class << self
                  sig { override.returns(T::Array[Symbol]) }
                  def values
                  end
                end
              end
            end

            class JsonSchema < Braintrust::BaseModel
              sig do
                returns(
                  Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema
                )
              end
              def json_schema
              end

              sig do
                params(
                  _: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema
                )
                  .returns(
                    Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema
                  )
              end
              def json_schema=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                params(
                  json_schema: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema,
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(json_schema:, type:)
              end

              sig do
                override
                  .returns(
                    {
                      json_schema: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema,
                      type: Symbol
                    }
                  )
              end
              def to_hash
              end

              class JsonSchema < Braintrust::BaseModel
                sig { returns(String) }
                def name
                end

                sig { params(_: String).returns(String) }
                def name=(_)
                end

                sig { returns(T.nilable(String)) }
                def description
                end

                sig { params(_: String).returns(String) }
                def description=(_)
                end

                sig { returns(T.nilable(T.any(T::Hash[Symbol, T.nilable(T.anything)], String))) }
                def schema
                end

                sig do
                  params(_: T.any(T::Hash[Symbol, T.nilable(T.anything)], String))
                    .returns(T.any(T::Hash[Symbol, T.nilable(T.anything)], String))
                end
                def schema=(_)
                end

                sig { returns(T.nilable(T::Boolean)) }
                def strict
                end

                sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
                def strict=(_)
                end

                sig do
                  params(
                    name: String,
                    description: String,
                    schema: T.any(T::Hash[Symbol, T.nilable(T.anything)], String),
                    strict: T.nilable(T::Boolean)
                  )
                    .returns(T.attached_class)
                end
                def self.new(name:, description: nil, schema: nil, strict: nil)
                end

                sig do
                  override
                    .returns(
                      {
                        name: String,
                        description: String,
                        schema: T.any(T::Hash[Symbol, T.nilable(T.anything)], String),
                        strict: T.nilable(T::Boolean)
                      }
                    )
                end
                def to_hash
                end

                class Schema < Braintrust::Union
                  abstract!

                  ObjectMap = T.type_alias { T::Hash[Symbol, T.nilable(T.anything)] }

                  class << self
                    sig { override.returns([T::Hash[Symbol, T.nilable(T.anything)], String]) }
                    def variants
                    end
                  end
                end
              end

              class Type < Braintrust::Enum
                abstract!

                JSON_SCHEMA = :json_schema

                class << self
                  sig { override.returns(T::Array[Symbol]) }
                  def values
                  end
                end
              end
            end

            class Text < Braintrust::BaseModel
              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig { params(type: Symbol).returns(T.attached_class) }
              def self.new(type:)
              end

              sig { override.returns({type: Symbol}) }
              def to_hash
              end

              class Type < Braintrust::Enum
                abstract!

                TEXT = :text

                class << self
                  sig { override.returns(T::Array[Symbol]) }
                  def values
                  end
                end
              end
            end

            class << self
              sig do
                override
                  .returns(
                    [Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text]
                  )
              end
              def variants
              end
            end
          end

          class ToolChoice < Braintrust::Union
            abstract!

            class UnionMember0 < Braintrust::Enum
              abstract!

              AUTO = :auto
              NONE = :none
              REQUIRED = :required

              class << self
                sig { override.returns(T::Array[Symbol]) }
                def values
                end
              end
            end

            class Function < Braintrust::BaseModel
              sig { returns(Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function) }
              def function
              end

              sig do
                params(_: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function)
                  .returns(Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function)
              end
              def function=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                params(
                  function: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function,
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(function:, type:)
              end

              sig do
                override
                  .returns(
                    {
                      function: Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function,
                      type: Symbol
                    }
                  )
              end
              def to_hash
              end

              class Function < Braintrust::BaseModel
                sig { returns(String) }
                def name
                end

                sig { params(_: String).returns(String) }
                def name=(_)
                end

                sig { params(name: String).returns(T.attached_class) }
                def self.new(name:)
                end

                sig { override.returns({name: String}) }
                def to_hash
                end
              end

              class Type < Braintrust::Enum
                abstract!

                FUNCTION = :function

                class << self
                  sig { override.returns(T::Array[Symbol]) }
                  def values
                  end
                end
              end
            end

            class << self
              sig do
                override
                  .returns([Symbol, Braintrust::Models::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function])
              end
              def variants
              end
            end
          end
        end

        class AnthropicModelParams < Braintrust::BaseModel
          sig { returns(Float) }
          def max_tokens
          end

          sig { params(_: Float).returns(Float) }
          def max_tokens=(_)
          end

          sig { returns(Float) }
          def temperature
          end

          sig { params(_: Float).returns(Float) }
          def temperature=(_)
          end

          # This is a legacy parameter that should not be used.
          sig { returns(T.nilable(Float)) }
          def max_tokens_to_sample
          end

          sig { params(_: Float).returns(Float) }
          def max_tokens_to_sample=(_)
          end

          sig { returns(T.nilable(T::Array[String])) }
          def stop_sequences
          end

          sig { params(_: T::Array[String]).returns(T::Array[String]) }
          def stop_sequences=(_)
          end

          sig { returns(T.nilable(Float)) }
          def top_k
          end

          sig { params(_: Float).returns(Float) }
          def top_k=(_)
          end

          sig { returns(T.nilable(Float)) }
          def top_p
          end

          sig { params(_: Float).returns(Float) }
          def top_p=(_)
          end

          sig { returns(T.nilable(T::Boolean)) }
          def use_cache
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def use_cache=(_)
          end

          sig do
            params(
              max_tokens: Float,
              temperature: Float,
              max_tokens_to_sample: Float,
              stop_sequences: T::Array[String],
              top_k: Float,
              top_p: Float,
              use_cache: T::Boolean
            )
              .returns(T.attached_class)
          end
          def self.new(
            max_tokens:,
            temperature:,
            max_tokens_to_sample: nil,
            stop_sequences: nil,
            top_k: nil,
            top_p: nil,
            use_cache: nil
          )
          end

          sig do
            override
              .returns(
                {
                  max_tokens: Float,
                  temperature: Float,
                  max_tokens_to_sample: Float,
                  stop_sequences: T::Array[String],
                  top_k: Float,
                  top_p: Float,
                  use_cache: T::Boolean
                }
              )
          end
          def to_hash
          end
        end

        class GoogleModelParams < Braintrust::BaseModel
          sig { returns(T.nilable(Float)) }
          def max_output_tokens
          end

          sig { params(_: Float).returns(Float) }
          def max_output_tokens=(_)
          end

          sig { returns(T.nilable(Float)) }
          def temperature
          end

          sig { params(_: Float).returns(Float) }
          def temperature=(_)
          end

          sig { returns(T.nilable(Float)) }
          def top_k
          end

          sig { params(_: Float).returns(Float) }
          def top_k=(_)
          end

          sig { returns(T.nilable(Float)) }
          def top_p
          end

          sig { params(_: Float).returns(Float) }
          def top_p=(_)
          end

          sig { returns(T.nilable(T::Boolean)) }
          def use_cache
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def use_cache=(_)
          end

          sig do
            params(
              max_output_tokens: Float,
              temperature: Float,
              top_k: Float,
              top_p: Float,
              use_cache: T::Boolean
            )
              .returns(T.attached_class)
          end
          def self.new(max_output_tokens: nil, temperature: nil, top_k: nil, top_p: nil, use_cache: nil)
          end

          sig do
            override
              .returns({
                         max_output_tokens: Float,
                         temperature: Float,
                         top_k: Float,
                         top_p: Float,
                         use_cache: T::Boolean
                       })
          end
          def to_hash
          end
        end

        class WindowAIModelParams < Braintrust::BaseModel
          sig { returns(T.nilable(Float)) }
          def temperature
          end

          sig { params(_: Float).returns(Float) }
          def temperature=(_)
          end

          sig { returns(T.nilable(Float)) }
          def top_k
          end

          sig { params(_: Float).returns(Float) }
          def top_k=(_)
          end

          sig { returns(T.nilable(T::Boolean)) }
          def use_cache
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def use_cache=(_)
          end

          sig { params(temperature: Float, top_k: Float, use_cache: T::Boolean).returns(T.attached_class) }
          def self.new(temperature: nil, top_k: nil, use_cache: nil)
          end

          sig { override.returns({temperature: Float, top_k: Float, use_cache: T::Boolean}) }
          def to_hash
          end
        end

        class JsCompletionParams < Braintrust::BaseModel
          sig { returns(T.nilable(T::Boolean)) }
          def use_cache
          end

          sig { params(_: T::Boolean).returns(T::Boolean) }
          def use_cache=(_)
          end

          sig { params(use_cache: T::Boolean).returns(T.attached_class) }
          def self.new(use_cache: nil)
          end

          sig { override.returns({use_cache: T::Boolean}) }
          def to_hash
          end
        end

        class << self
          sig do
            override
              .returns(
                [Braintrust::Models::PromptOptions::Params::OpenAIModelParams, Braintrust::Models::PromptOptions::Params::AnthropicModelParams, Braintrust::Models::PromptOptions::Params::GoogleModelParams, Braintrust::Models::PromptOptions::Params::WindowAIModelParams, Braintrust::Models::PromptOptions::Params::JsCompletionParams]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
