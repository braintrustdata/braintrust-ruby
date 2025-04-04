# typed: strong

module Braintrust
  module Models
    class FunctionUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :description

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
      attr_accessor :function_data

      # Name of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      attr_reader :prompt_data

      sig { params(prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::AnyHash))).void }
      attr_writer :prompt_data

      # A list of tags for the prompt
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          description: T.nilable(String),
          function_data: T.nilable(
            T.any(
              Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt,
              Braintrust::Internal::AnyHash,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Code,
              Braintrust::Models::FunctionUpdateParams::FunctionData::Global
            )
          ),
          name: T.nilable(String),
          prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::AnyHash)),
          tags: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        description: nil,
        function_data: nil,
        name: nil,
        prompt_data: nil,
        tags: nil,
        request_options: {}
      )
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
        extend Braintrust::Internal::Type::Union

        class Prompt < Braintrust::Internal::Type::BaseModel
          sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::OrSymbol) }
          attr_accessor :type

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
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::TaggedSymbol) }

            PROMPT =
              T.let(:prompt, Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type::TaggedSymbol])
            end
            def self.values
            end
          end
        end

        class Code < Braintrust::Internal::Type::BaseModel
          sig do
            returns(
              T.any(
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline
              )
            )
          end
          attr_accessor :data

          sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::OrSymbol) }
          attr_accessor :type

          sig do
            params(
              data: T.any(
                Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                Braintrust::Internal::AnyHash,
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
            extend Braintrust::Internal::Type::Union

            class Bundle < Braintrust::Models::CodeBundle
              sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol) }
              attr_accessor :type

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
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                    )
                  end

                BUNDLE =
                  T.let(
                    :bundle,
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol]
                    )
                end
                def self.values
                end
              end
            end

            class Inline < Braintrust::Internal::Type::BaseModel
              sig { returns(String) }
              attr_accessor :code

              sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext) }
              attr_reader :runtime_context

              sig do
                params(
                  runtime_context: T.any(
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext,
                    Braintrust::Internal::AnyHash
                  )
                )
                  .void
              end
              attr_writer :runtime_context

              sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::OrSymbol) }
              attr_accessor :type

              sig do
                params(
                  code: String,
                  runtime_context: T.any(
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext,
                    Braintrust::Internal::AnyHash
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

              class RuntimeContext < Braintrust::Internal::Type::BaseModel
                sig do
                  returns(
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                  )
                end
                attr_accessor :runtime

                sig { returns(String) }
                attr_accessor :version

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
                  extend Braintrust::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime)
                    end
                  OrSymbol =
                    T.type_alias do
                      T.any(
                        Symbol,
                        String,
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

                  sig do
                    override
                      .returns(
                        T::Array[
                        Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                        ]
                      )
                  end
                  def self.values
                  end
                end
              end

              module Type
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                    )
                  end

                INLINE =
                  T.let(
                    :inline,
                    Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol]
                    )
                end
                def self.values
                end
              end
            end

            sig do
              override
                .returns(
                  [Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline]
                )
            end
            def self.variants
            end
          end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::TaggedSymbol) }

            CODE = T.let(:code, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type::TaggedSymbol])
            end
            def self.values
            end
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          sig { returns(String) }
          attr_accessor :name

          sig { returns(Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::OrSymbol) }
          attr_accessor :type

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
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::TaggedSymbol) }

            GLOBAL =
              T.let(:global, Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type::TaggedSymbol])
            end
            def self.values
            end
          end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt, Braintrust::Models::FunctionUpdateParams::FunctionData::Code, Braintrust::Models::FunctionUpdateParams::FunctionData::Global]
            )
        end
        def self.variants
        end
      end
    end
  end
end
