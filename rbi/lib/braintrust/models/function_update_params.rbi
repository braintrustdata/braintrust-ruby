# typed: strong

module Braintrust
  module Models
    class FunctionUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig do
        returns(
          T.nilable(
            T.any(
              Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Code,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Global
            )
          )
        )
      end
      def function_data
      end

      sig do
        params(
          _: T.nilable(
            T.any(
              Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Code,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Global
            )
          )
        )
          .returns(
            T.nilable(
              T.any(
                Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt,
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code,
                Braintrust::Models::FunctionUpdateParams::FunctionData::Global
              )
            )
          )
      end
      def function_data=(_)
      end

      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data
      end

      sig { params(_: T.nilable(Braintrust::Models::PromptData)).returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def tags
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def tags=(_)
      end

      sig do
        params(
          description: T.nilable(String),
          function_data: T.nilable(
            T.any(
              Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Code,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Global
            )
          ),
          name: T.nilable(String),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          tags: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(description: nil, function_data: nil, name: nil, prompt_data: nil, tags: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              description: T.nilable(String),
              function_data: T.nilable(
                T.any(
                  Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt,
                  Braintrust::Models::FunctionUpdateParams::FunctionData::Code,
                  Braintrust::Models::FunctionUpdateParams::FunctionData::Global
                )
              ),
              name: T.nilable(String),
              prompt_data: T.nilable(Braintrust::Models::PromptData),
              tags: T.nilable(T::Array[String]),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      class FunctionData < Braintrust::Union
        abstract!

        class Prompt < Braintrust::BaseModel
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

            PROMPT = :prompt

            class << self
              sig { override.returns(T::Array[Symbol]) }
              def values
              end
            end
          end
        end

        class Code < Braintrust::BaseModel
          sig do
            returns(
              T.any(
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline
              )
            )
          end
          def data
          end

          sig do
            params(
              _: T.any(
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline
              )
            )
              .returns(
                T.any(
                  Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                  Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline
                )
              )
          end
          def data=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig do
            params(
              data: T.any(
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline
              ),
              type: Symbol
            )
              .returns(T.attached_class)
          end
          def self.new(data:, type:)
          end

          sig do
            override
              .returns(
                {
                  data: T.any(
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline
                  ),
                  type: Symbol
                }
              )
          end
          def to_hash
          end

          class Data < Braintrust::Union
            abstract!

            class Bundle < Braintrust::Models::CodeBundle
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

                BUNDLE = :bundle

                class << self
                  sig { override.returns(T::Array[Symbol]) }
                  def values
                  end
                end
              end
            end

            class Inline < Braintrust::BaseModel
              sig { returns(String) }
              def code
              end

              sig { params(_: String).returns(String) }
              def code=(_)
              end

              sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext) }
              def runtime_context
              end

              sig do
                params(_: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext)
                  .returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext)
              end
              def runtime_context=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig do
                params(
                  code: String,
                  runtime_context: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext,
                  type: Symbol
                )
                  .returns(T.attached_class)
              end
              def self.new(code:, runtime_context:, type:)
              end

              sig do
                override
                  .returns(
                    {
                      code: String,
                      runtime_context: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext,
                      type: Symbol
                    }
                  )
              end
              def to_hash
              end

              class RuntimeContext < Braintrust::BaseModel
                sig { returns(Symbol) }
                def runtime
                end

                sig { params(_: Symbol).returns(Symbol) }
                def runtime=(_)
                end

                sig { returns(String) }
                def version
                end

                sig { params(_: String).returns(String) }
                def version=(_)
                end

                sig { params(runtime: Symbol, version: String).returns(T.attached_class) }
                def self.new(runtime:, version:)
                end

                sig { override.returns({runtime: Symbol, version: String}) }
                def to_hash
                end

                class Runtime < Braintrust::Enum
                  abstract!

                  NODE = :node
                  PYTHON = :python

                  class << self
                    sig { override.returns(T::Array[Symbol]) }
                    def values
                    end
                  end
                end
              end

              class Type < Braintrust::Enum
                abstract!

                INLINE = :inline

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
                    [[NilClass, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle], [NilClass, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline]]
                  )
              end
              private def variants
              end
            end
          end

          class Type < Braintrust::Enum
            abstract!

            CODE = :code

            class << self
              sig { override.returns(T::Array[Symbol]) }
              def values
              end
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

          sig { params(name: String, type: Symbol).returns(T.attached_class) }
          def self.new(name:, type:)
          end

          sig { override.returns({name: String, type: Symbol}) }
          def to_hash
          end

          class Type < Braintrust::Enum
            abstract!

            GLOBAL = :global

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
                [[NilClass, Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt], [NilClass, Braintrust::Models::FunctionUpdateParams::FunctionData::Code], [NilClass, Braintrust::Models::FunctionUpdateParams::FunctionData::Global]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
