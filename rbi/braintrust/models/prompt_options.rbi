# typed: strong

module Braintrust
  module Models
    class PromptOptions < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Braintrust::PromptOptions, Braintrust::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_reader :model

      sig { params(model: String).void }
      attr_writer :model

      sig do
        returns(
          T.nilable(
            T.any(
              Braintrust::PromptOptions::Params::OpenAIModelParams,
              Braintrust::PromptOptions::Params::AnthropicModelParams,
              Braintrust::PromptOptions::Params::GoogleModelParams,
              Braintrust::PromptOptions::Params::WindowAIModelParams,
              Braintrust::PromptOptions::Params::JsCompletionParams
            )
          )
        )
      end
      attr_reader :params

      sig do
        params(
          params:
            T.any(
              Braintrust::PromptOptions::Params::OpenAIModelParams::OrHash,
              Braintrust::PromptOptions::Params::AnthropicModelParams::OrHash,
              Braintrust::PromptOptions::Params::GoogleModelParams::OrHash,
              Braintrust::PromptOptions::Params::WindowAIModelParams::OrHash,
              Braintrust::PromptOptions::Params::JsCompletionParams::OrHash
            )
        ).void
      end
      attr_writer :params

      sig { returns(T.nilable(String)) }
      attr_reader :position

      sig { params(position: String).void }
      attr_writer :position

      sig do
        params(
          model: String,
          params:
            T.any(
              Braintrust::PromptOptions::Params::OpenAIModelParams::OrHash,
              Braintrust::PromptOptions::Params::AnthropicModelParams::OrHash,
              Braintrust::PromptOptions::Params::GoogleModelParams::OrHash,
              Braintrust::PromptOptions::Params::WindowAIModelParams::OrHash,
              Braintrust::PromptOptions::Params::JsCompletionParams::OrHash
            ),
          position: String
        ).returns(T.attached_class)
      end
      def self.new(model: nil, params: nil, position: nil)
      end

      sig do
        override.returns(
          {
            model: String,
            params:
              T.any(
                Braintrust::PromptOptions::Params::OpenAIModelParams,
                Braintrust::PromptOptions::Params::AnthropicModelParams,
                Braintrust::PromptOptions::Params::GoogleModelParams,
                Braintrust::PromptOptions::Params::WindowAIModelParams,
                Braintrust::PromptOptions::Params::JsCompletionParams
              ),
            position: String
          }
        )
      end
      def to_hash
      end

      module Params
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::PromptOptions::Params::OpenAIModelParams,
              Braintrust::PromptOptions::Params::AnthropicModelParams,
              Braintrust::PromptOptions::Params::GoogleModelParams,
              Braintrust::PromptOptions::Params::WindowAIModelParams,
              Braintrust::PromptOptions::Params::JsCompletionParams
            )
          end

        class OpenAIModelParams < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::PromptOptions::Params::OpenAIModelParams,
                Braintrust::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Float)) }
          attr_reader :frequency_penalty

          sig { params(frequency_penalty: Float).void }
          attr_writer :frequency_penalty

          sig do
            returns(
              T.nilable(
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::OrSymbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function
                )
              )
            )
          end
          attr_reader :function_call

          sig do
            params(
              function_call:
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::OrSymbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function::OrHash
                )
            ).void
          end
          attr_writer :function_call

          # The successor to max_tokens
          sig { returns(T.nilable(Float)) }
          attr_reader :max_completion_tokens

          sig { params(max_completion_tokens: Float).void }
          attr_writer :max_completion_tokens

          sig { returns(T.nilable(Float)) }
          attr_reader :max_tokens

          sig { params(max_tokens: Float).void }
          attr_writer :max_tokens

          sig { returns(T.nilable(Float)) }
          attr_reader :n

          sig { params(n: Float).void }
          attr_writer :n

          sig { returns(T.nilable(Float)) }
          attr_reader :presence_penalty

          sig { params(presence_penalty: Float).void }
          attr_writer :presence_penalty

          sig do
            returns(
              T.nilable(
                Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort::OrSymbol
              )
            )
          end
          attr_reader :reasoning_effort

          sig do
            params(
              reasoning_effort:
                Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort::OrSymbol
            ).void
          end
          attr_writer :reasoning_effort

          sig do
            returns(
              T.nilable(
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text
                )
              )
            )
          end
          attr_accessor :response_format

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :stop

          sig { params(stop: T::Array[String]).void }
          attr_writer :stop

          sig { returns(T.nilable(Float)) }
          attr_reader :temperature

          sig { params(temperature: Float).void }
          attr_writer :temperature

          sig do
            returns(
              T.nilable(
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::OrSymbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function
                )
              )
            )
          end
          attr_reader :tool_choice

          sig do
            params(
              tool_choice:
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::OrSymbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::OrHash
                )
            ).void
          end
          attr_writer :tool_choice

          sig { returns(T.nilable(Float)) }
          attr_reader :top_p

          sig { params(top_p: Float).void }
          attr_writer :top_p

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :use_cache

          sig { params(use_cache: T::Boolean).void }
          attr_writer :use_cache

          sig do
            params(
              frequency_penalty: Float,
              function_call:
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::OrSymbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function::OrHash
                ),
              max_completion_tokens: Float,
              max_tokens: Float,
              n: Float,
              presence_penalty: Float,
              reasoning_effort:
                Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort::OrSymbol,
              response_format:
                T.nilable(
                  T.any(
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::OrHash,
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::OrHash,
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::OrHash
                  )
                ),
              stop: T::Array[String],
              temperature: Float,
              tool_choice:
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::OrSymbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::OrHash
                ),
              top_p: Float,
              use_cache: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            frequency_penalty: nil,
            function_call: nil,
            # The successor to max_tokens
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
            override.returns(
              {
                frequency_penalty: Float,
                function_call:
                  T.any(
                    Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::OrSymbol,
                    Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function
                  ),
                max_completion_tokens: Float,
                max_tokens: Float,
                n: Float,
                presence_penalty: Float,
                reasoning_effort:
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort::OrSymbol,
                response_format:
                  T.nilable(
                    T.any(
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject,
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema,
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text
                    )
                  ),
                stop: T::Array[String],
                temperature: Float,
                tool_choice:
                  T.any(
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::OrSymbol,
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function
                  ),
                top_p: Float,
                use_cache: T::Boolean
              }
            )
          end
          def to_hash
          end

          module FunctionCall
            extend Braintrust::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::TaggedSymbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function
                )
              end

            class Function < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Function,
                    Braintrust::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :name

              sig { params(name: String).returns(T.attached_class) }
              def self.new(name:)
              end

              sig { override.returns({ name: String }) }
              def to_hash
              end
            end

            sig do
              override.returns(
                T::Array[
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::Variants
                ]
              )
            end
            def self.variants
            end

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AUTO =
              T.let(
                :auto,
                Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::TaggedSymbol
              )
            NONE =
              T.let(
                :none,
                Braintrust::PromptOptions::Params::OpenAIModelParams::FunctionCall::TaggedSymbol
              )
          end

          module ReasoningEffort
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LOW =
              T.let(
                :low,
                Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort::TaggedSymbol
              )
            MEDIUM =
              T.let(
                :medium,
                Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort::TaggedSymbol
              )
            HIGH =
              T.let(
                :high,
                Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ReasoningEffort::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module ResponseFormat
            extend Braintrust::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text
                )
              end

            class JsonObject < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject,
                    Braintrust::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  type:
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override.returns(
                  {
                    type:
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type::OrSymbol
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
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                JSON_OBJECT =
                  T.let(
                    :json_object,
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonObject::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class JsonSchema < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema,
                    Braintrust::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema
                )
              end
              attr_reader :json_schema

              sig do
                params(
                  json_schema:
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::OrHash
                ).void
              end
              attr_writer :json_schema

              sig do
                returns(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  json_schema:
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::OrHash,
                  type:
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(json_schema:, type:)
              end

              sig do
                override.returns(
                  {
                    json_schema:
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema,
                    type:
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type::OrSymbol
                  }
                )
              end
              def to_hash
              end

              class JsonSchema < Braintrust::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema,
                      Braintrust::Internal::AnyHash
                    )
                  end

                sig { returns(String) }
                attr_accessor :name

                sig { returns(T.nilable(String)) }
                attr_reader :description

                sig { params(description: String).void }
                attr_writer :description

                sig do
                  returns(
                    T.nilable(
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::Schema::Variants
                    )
                  )
                end
                attr_reader :schema

                sig do
                  params(
                    schema:
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::Schema::Variants
                  ).void
                end
                attr_writer :schema

                sig { returns(T.nilable(T::Boolean)) }
                attr_accessor :strict

                sig do
                  params(
                    name: String,
                    description: String,
                    schema:
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::Schema::Variants,
                    strict: T.nilable(T::Boolean)
                  ).returns(T.attached_class)
                end
                def self.new(name:, description: nil, schema: nil, strict: nil)
                end

                sig do
                  override.returns(
                    {
                      name: String,
                      description: String,
                      schema:
                        Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::Schema::Variants,
                      strict: T.nilable(T::Boolean)
                    }
                  )
                end
                def to_hash
                end

                module Schema
                  extend Braintrust::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(T::Hash[Symbol, T.nilable(T.anything)], String)
                    end

                  sig do
                    override.returns(
                      T::Array[
                        Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::JsonSchema::Schema::Variants
                      ]
                    )
                  end
                  def self.variants
                  end

                  ObjectMap =
                    T.let(
                      Braintrust::Internal::Type::HashOf[
                        Braintrust::Internal::Type::Unknown,
                        nil?: true
                      ],
                      Braintrust::Internal::Type::Converter
                    )
                end
              end

              module Type
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                JSON_SCHEMA =
                  T.let(
                    :json_schema,
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::JsonSchema::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Text < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text,
                    Braintrust::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  type:
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override.returns(
                  {
                    type:
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type::OrSymbol
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
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                TEXT =
                  T.let(
                    :text,
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Text::Type::TaggedSymbol
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
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ResponseFormat::Variants
                ]
              )
            end
            def self.variants
            end
          end

          module ToolChoice
            extend Braintrust::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::TaggedSymbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function
                )
              end

            class Function < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function,
                    Braintrust::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function
                )
              end
              attr_reader :function

              sig do
                params(
                  function:
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function::OrHash
                ).void
              end
              attr_writer :function

              sig do
                returns(
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  function:
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function::OrHash,
                  type:
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(function:, type:)
              end

              sig do
                override.returns(
                  {
                    function:
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function,
                    type:
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type::OrSymbol
                  }
                )
              end
              def to_hash
              end

              class Function < Braintrust::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Function,
                      Braintrust::Internal::AnyHash
                    )
                  end

                sig { returns(String) }
                attr_accessor :name

                sig { params(name: String).returns(T.attached_class) }
                def self.new(name:)
                end

                sig { override.returns({ name: String }) }
                def to_hash
                end
              end

              module Type
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                FUNCTION =
                  T.let(
                    :function,
                    Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Function::Type::TaggedSymbol
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
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::Variants
                ]
              )
            end
            def self.variants
            end

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AUTO =
              T.let(
                :auto,
                Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::TaggedSymbol
              )
            NONE =
              T.let(
                :none,
                Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::TaggedSymbol
              )
            REQUIRED =
              T.let(
                :required,
                Braintrust::PromptOptions::Params::OpenAIModelParams::ToolChoice::TaggedSymbol
              )
          end
        end

        class AnthropicModelParams < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::PromptOptions::Params::AnthropicModelParams,
                Braintrust::Internal::AnyHash
              )
            end

          sig { returns(Float) }
          attr_accessor :max_tokens

          sig { returns(Float) }
          attr_accessor :temperature

          # This is a legacy parameter that should not be used.
          sig { returns(T.nilable(Float)) }
          attr_reader :max_tokens_to_sample

          sig { params(max_tokens_to_sample: Float).void }
          attr_writer :max_tokens_to_sample

          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :stop_sequences

          sig { params(stop_sequences: T::Array[String]).void }
          attr_writer :stop_sequences

          sig { returns(T.nilable(Float)) }
          attr_reader :top_k

          sig { params(top_k: Float).void }
          attr_writer :top_k

          sig { returns(T.nilable(Float)) }
          attr_reader :top_p

          sig { params(top_p: Float).void }
          attr_writer :top_p

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :use_cache

          sig { params(use_cache: T::Boolean).void }
          attr_writer :use_cache

          sig do
            params(
              max_tokens: Float,
              temperature: Float,
              max_tokens_to_sample: Float,
              stop_sequences: T::Array[String],
              top_k: Float,
              top_p: Float,
              use_cache: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            max_tokens:,
            temperature:,
            # This is a legacy parameter that should not be used.
            max_tokens_to_sample: nil,
            stop_sequences: nil,
            top_k: nil,
            top_p: nil,
            use_cache: nil
          )
          end

          sig do
            override.returns(
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

        class GoogleModelParams < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::PromptOptions::Params::GoogleModelParams,
                Braintrust::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Float)) }
          attr_reader :max_output_tokens

          sig { params(max_output_tokens: Float).void }
          attr_writer :max_output_tokens

          sig { returns(T.nilable(Float)) }
          attr_reader :temperature

          sig { params(temperature: Float).void }
          attr_writer :temperature

          sig { returns(T.nilable(Float)) }
          attr_reader :top_k

          sig { params(top_k: Float).void }
          attr_writer :top_k

          sig { returns(T.nilable(Float)) }
          attr_reader :top_p

          sig { params(top_p: Float).void }
          attr_writer :top_p

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :use_cache

          sig { params(use_cache: T::Boolean).void }
          attr_writer :use_cache

          sig do
            params(
              max_output_tokens: Float,
              temperature: Float,
              top_k: Float,
              top_p: Float,
              use_cache: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(
            max_output_tokens: nil,
            temperature: nil,
            top_k: nil,
            top_p: nil,
            use_cache: nil
          )
          end

          sig do
            override.returns(
              {
                max_output_tokens: Float,
                temperature: Float,
                top_k: Float,
                top_p: Float,
                use_cache: T::Boolean
              }
            )
          end
          def to_hash
          end
        end

        class WindowAIModelParams < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::PromptOptions::Params::WindowAIModelParams,
                Braintrust::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Float)) }
          attr_reader :temperature

          sig { params(temperature: Float).void }
          attr_writer :temperature

          sig { returns(T.nilable(Float)) }
          attr_reader :top_k

          sig { params(top_k: Float).void }
          attr_writer :top_k

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :use_cache

          sig { params(use_cache: T::Boolean).void }
          attr_writer :use_cache

          sig do
            params(
              temperature: Float,
              top_k: Float,
              use_cache: T::Boolean
            ).returns(T.attached_class)
          end
          def self.new(temperature: nil, top_k: nil, use_cache: nil)
          end

          sig do
            override.returns(
              { temperature: Float, top_k: Float, use_cache: T::Boolean }
            )
          end
          def to_hash
          end
        end

        class JsCompletionParams < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::PromptOptions::Params::JsCompletionParams,
                Braintrust::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :use_cache

          sig { params(use_cache: T::Boolean).void }
          attr_writer :use_cache

          sig { params(use_cache: T::Boolean).returns(T.attached_class) }
          def self.new(use_cache: nil)
          end

          sig { override.returns({ use_cache: T::Boolean }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::PromptOptions::Params::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
