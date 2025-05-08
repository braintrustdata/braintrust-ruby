# typed: strong

module Braintrust
  module Models
    class FunctionUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig do
        returns(
          T.nilable(
            T.any(
              Braintrust::FunctionUpdateParams::FunctionData::Prompt,
              Braintrust::FunctionUpdateParams::FunctionData::Code,
              Braintrust::FunctionUpdateParams::FunctionData::Global
            )
          )
        )
      end
      attr_accessor :function_data

      # Name of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::PromptData)) }
      attr_reader :prompt_data

      sig do
        params(prompt_data: T.nilable(Braintrust::PromptData::OrHash)).void
      end
      attr_writer :prompt_data

      # A list of tags for the prompt
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          description: T.nilable(String),
          function_data:
            T.nilable(
              T.any(
                Braintrust::FunctionUpdateParams::FunctionData::Prompt::OrHash,
                Braintrust::FunctionUpdateParams::FunctionData::Code::OrHash,
                Braintrust::FunctionUpdateParams::FunctionData::Global::OrHash
              )
            ),
          name: T.nilable(String),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          tags: T.nilable(T::Array[String]),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Textual description of the prompt
        description: nil,
        function_data: nil,
        # Name of the prompt
        name: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # A list of tags for the prompt
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            description: T.nilable(String),
            function_data:
              T.nilable(
                T.any(
                  Braintrust::FunctionUpdateParams::FunctionData::Prompt,
                  Braintrust::FunctionUpdateParams::FunctionData::Code,
                  Braintrust::FunctionUpdateParams::FunctionData::Global
                )
              ),
            name: T.nilable(String),
            prompt_data: T.nilable(Braintrust::PromptData),
            tags: T.nilable(T::Array[String]),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end

      module FunctionData
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::FunctionUpdateParams::FunctionData::Prompt,
              Braintrust::FunctionUpdateParams::FunctionData::Code,
              Braintrust::FunctionUpdateParams::FunctionData::Global
            )
          end

        class Prompt < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig do
            returns(
              Braintrust::FunctionUpdateParams::FunctionData::Prompt::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              type:
                Braintrust::FunctionUpdateParams::FunctionData::Prompt::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Braintrust::FunctionUpdateParams::FunctionData::Prompt::Type::OrSymbol
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
                  Braintrust::FunctionUpdateParams::FunctionData::Prompt::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PROMPT =
              T.let(
                :prompt,
                Braintrust::FunctionUpdateParams::FunctionData::Prompt::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionUpdateParams::FunctionData::Prompt::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Code < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig do
            returns(
              T.any(
                Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline
              )
            )
          end
          attr_accessor :data

          sig do
            returns(
              Braintrust::FunctionUpdateParams::FunctionData::Code::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              data:
                T.any(
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle::OrHash,
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::OrHash
                ),
              type:
                Braintrust::FunctionUpdateParams::FunctionData::Code::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(data:, type:)
          end

          sig do
            override.returns(
              {
                data:
                  T.any(
                    Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                    Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline
                  ),
                type:
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Data
            extend Braintrust::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline
                )
              end

            class Bundle < Braintrust::Models::CodeBundle
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig do
                returns(
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  type:
                    Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override.returns(
                  {
                    type:
                      Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol
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
                      Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                BUNDLE =
                  T.let(
                    :bundle,
                    Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Inline < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig { returns(String) }
              attr_accessor :code

              sig do
                returns(
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext
                )
              end
              attr_reader :runtime_context

              sig do
                params(
                  runtime_context:
                    Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::OrHash
                ).void
              end
              attr_writer :runtime_context

              sig do
                returns(
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  code: String,
                  runtime_context:
                    Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::OrHash,
                  type:
                    Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(code:, runtime_context:, type:)
              end

              sig do
                override.returns(
                  {
                    code: String,
                    runtime_context:
                      Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext,
                    type:
                      Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::OrSymbol
                  }
                )
              end
              def to_hash
              end

              class RuntimeContext < Braintrust::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(T.self_type, Braintrust::Internal::AnyHash)
                  end

                sig do
                  returns(
                    Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                  )
                end
                attr_accessor :runtime

                sig { returns(String) }
                attr_accessor :version

                sig do
                  params(
                    runtime:
                      Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
                    version: String
                  ).returns(T.attached_class)
                end
                def self.new(runtime:, version:)
                end

                sig do
                  override.returns(
                    {
                      runtime:
                        Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
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
                      T.all(
                        Symbol,
                        Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  NODE =
                    T.let(
                      :node,
                      Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )
                  PYTHON =
                    T.let(
                      :python,
                      Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
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
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                INLINE =
                  T.let(
                    :inline,
                    Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
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
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Variants
                ]
              )
            end
            def self.variants
            end
          end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CODE =
              T.let(
                :code,
                Braintrust::FunctionUpdateParams::FunctionData::Code::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig { returns(String) }
          attr_accessor :name

          sig do
            returns(
              Braintrust::FunctionUpdateParams::FunctionData::Global::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              name: String,
              type:
                Braintrust::FunctionUpdateParams::FunctionData::Global::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override.returns(
              {
                name: String,
                type:
                  Braintrust::FunctionUpdateParams::FunctionData::Global::Type::OrSymbol
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
                  Braintrust::FunctionUpdateParams::FunctionData::Global::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GLOBAL =
              T.let(
                :global,
                Braintrust::FunctionUpdateParams::FunctionData::Global::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionUpdateParams::FunctionData::Global::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::FunctionUpdateParams::FunctionData::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
