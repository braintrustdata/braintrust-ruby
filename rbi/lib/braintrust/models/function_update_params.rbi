# typed: strong

module Braintrust
  module Models
    class FunctionUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Textual description of the prompt
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

      # Name of the prompt
      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)))
      end
      def prompt_data=(_)
      end

      # A list of tags for the prompt
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
              Braintrust::Util::AnyHash,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Code,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Global
            )
          ),
          name: T.nilable(String),
          prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)),
          tags: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
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

      module FunctionData
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt,
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code,
                Braintrust::Models::FunctionUpdateParams::FunctionData::Global
              )
            }
          end

        class Prompt < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::OrSymbol)
              .returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(type: Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig { override.returns({type: Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::OrSymbol}) }
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::TaggedSymbol) }

            PROMPT =
              T.let(:prompt, Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::TaggedSymbol)

            class << self
              sig do
                override
                  .returns(T::Array[Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::TaggedSymbol])
              end
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

          sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::OrSymbol)
              .returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(
              data: T.any(
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                Braintrust::Util::AnyHash,
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline
              ),
              type: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::OrSymbol
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
                  type: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::OrSymbol
                }
              )
          end
          def to_hash
          end

          module Data
            extend Braintrust::Union

            Variants =
              type_template(:out) do
                {
                  fixed: T.any(
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline
                  )
                }
              end

            class Bundle < Braintrust::Models::CodeBundle
              sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol) }
              def type
              end

              sig do
                params(_: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol)
                  .returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol)
              end
              def type=(_)
              end

              sig do
                params(type: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol)
                  .returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override
                  .returns(
                    {type: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol}
                  )
              end
              def to_hash
              end

              module Type
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                    )
                  end

                BUNDLE =
                  T.let(
                    :bundle,
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                  )

                class << self
                  sig do
                    override
                      .returns(
                        T::Array[Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol]
                      )
                  end
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
                params(
                  _: T.any(
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext,
                    Braintrust::Util::AnyHash
                  )
                )
                  .returns(
                    T.any(
                      Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext,
                      Braintrust::Util::AnyHash
                    )
                  )
              end
              def runtime_context=(_)
              end

              sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::OrSymbol) }
              def type
              end

              sig do
                params(_: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::OrSymbol)
                  .returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::OrSymbol)
              end
              def type=(_)
              end

              sig do
                params(
                  code: String,
                  runtime_context: T.any(
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext,
                    Braintrust::Util::AnyHash
                  ),
                  type: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::OrSymbol
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
                      type: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::OrSymbol
                    }
                  )
              end
              def to_hash
              end

              class RuntimeContext < Braintrust::BaseModel
                sig do
                  returns(
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                  )
                end
                def runtime
                end

                sig do
                  params(
                    _: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                  )
                    .returns(
                      Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                    )
                end
                def runtime=(_)
                end

                sig { returns(String) }
                def version
                end

                sig { params(_: String).returns(String) }
                def version=(_)
                end

                sig do
                  params(
                    runtime: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
                    version: String
                  )
                    .returns(T.attached_class)
                end
                def self.new(runtime:, version:)
                end

                sig do
                  override
                    .returns(
                      {
                        runtime: Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
                        version: String
                      }
                    )
                end
                def to_hash
                end

                module Runtime
                  extend Braintrust::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime)
                    end
                  OrSymbol =
                    T.type_alias do
                      T.any(
                        Symbol,
                        Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                      )
                    end

                  NODE =
                    T.let(
                      :node,
                      Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )
                  PYTHON =
                    T.let(
                      :python,
                      Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )

                  class << self
                    sig do
                      override
                        .returns(
                          T::Array[
                          Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                          ]
                        )
                    end
                    def values
                    end
                  end
                end
              end

              module Type
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                    )
                  end

                INLINE =
                  T.let(
                    :inline,
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                  )

                class << self
                  sig do
                    override
                      .returns(
                        T::Array[Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol]
                      )
                  end
                  def values
                  end
                end
              end
            end

            class << self
              sig do
                override
                  .returns(
                    [Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline]
                  )
              end
              def variants
              end
            end
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::TaggedSymbol) }

            CODE = T.let(:code, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::TaggedSymbol)

            class << self
              sig do
                override
                  .returns(T::Array[Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::TaggedSymbol])
              end
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

          sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::OrSymbol)
              .returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(name: String, type: Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override
              .returns(
                {name: String, type: Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::OrSymbol}
              )
          end
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::TaggedSymbol) }

            GLOBAL =
              T.let(:global, Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::TaggedSymbol)

            class << self
              sig do
                override
                  .returns(T::Array[Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::TaggedSymbol])
              end
              def values
              end
            end
          end
        end

        class << self
          sig do
            override
              .returns(
                [Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt, Braintrust::Models::FunctionUpdateParams::FunctionData::Code, Braintrust::Models::FunctionUpdateParams::FunctionData::Global]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
