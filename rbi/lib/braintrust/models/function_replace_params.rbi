# typed: strong

module Braintrust
  module Models
    class FunctionReplaceParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig do
        returns(
          T.any(
            Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt,
            Braintrust::Models::FunctionReplaceParams::FunctionData::Code,
            Braintrust::Models::FunctionReplaceParams::FunctionData::Global
          )
        )
      end
      attr_accessor :function_data

      # Name of the prompt
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the prompt belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # Unique identifier for the prompt
      sig { returns(String) }
      attr_accessor :slug

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # JSON schema for the function's parameters and return type
      sig { returns(T.nilable(Braintrust::Models::FunctionReplaceParams::FunctionSchema)) }
      attr_reader :function_schema

      sig do
        params(
          function_schema: T.nilable(T.any(Braintrust::Models::FunctionReplaceParams::FunctionSchema, Braintrust::Util::AnyHash))
        )
          .void
      end
      attr_writer :function_schema

      sig { returns(T.nilable(Braintrust::Models::FunctionReplaceParams::FunctionType::OrSymbol)) }
      attr_accessor :function_type

      sig { returns(T.nilable(Braintrust::Models::FunctionReplaceParams::Origin)) }
      attr_reader :origin

      sig do
        params(
          origin: T.nilable(T.any(Braintrust::Models::FunctionReplaceParams::Origin, Braintrust::Util::AnyHash))
        )
          .void
      end
      attr_writer :origin

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      attr_reader :prompt_data

      sig { params(prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash))).void }
      attr_writer :prompt_data

      # A list of tags for the prompt
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          function_data: T.any(
            Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt,
            Braintrust::Util::AnyHash,
            Braintrust::Models::FunctionReplaceParams::FunctionData::Code,
            Braintrust::Models::FunctionReplaceParams::FunctionData::Global
          ),
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_schema: T.nilable(T.any(Braintrust::Models::FunctionReplaceParams::FunctionSchema, Braintrust::Util::AnyHash)),
          function_type: T.nilable(Braintrust::Models::FunctionReplaceParams::FunctionType::OrSymbol),
          origin: T.nilable(T.any(Braintrust::Models::FunctionReplaceParams::Origin, Braintrust::Util::AnyHash)),
          prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)),
          tags: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        function_data:,
        name:,
        project_id:,
        slug:,
        description: nil,
        function_schema: nil,
        function_type: nil,
        origin: nil,
        prompt_data: nil,
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              function_data: T.any(
                Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt,
                Braintrust::Models::FunctionReplaceParams::FunctionData::Code,
                Braintrust::Models::FunctionReplaceParams::FunctionData::Global
              ),
              name: String,
              project_id: String,
              slug: String,
              description: T.nilable(String),
              function_schema: T.nilable(Braintrust::Models::FunctionReplaceParams::FunctionSchema),
              function_type: T.nilable(Braintrust::Models::FunctionReplaceParams::FunctionType::OrSymbol),
              origin: T.nilable(Braintrust::Models::FunctionReplaceParams::Origin),
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

        class Prompt < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt::Type::OrSymbol) }
          attr_accessor :type

          sig do
            params(type: Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig { override.returns({type: Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt::Type::OrSymbol}) }
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt::Type::TaggedSymbol) }

            PROMPT =
              T.let(:prompt, Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt::Type::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt::Type::TaggedSymbol])
            end
            def self.values
            end
          end
        end

        class Code < Braintrust::BaseModel
          sig do
            returns(
              T.any(
                Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle,
                Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline
              )
            )
          end
          attr_accessor :data

          sig { returns(Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Type::OrSymbol) }
          attr_accessor :type

          sig do
            params(
              data: T.any(
                Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle,
                Braintrust::Util::AnyHash,
                Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline
              ),
              type: Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Type::OrSymbol
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
                    Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle,
                    Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline
                  ),
                  type: Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Type::OrSymbol
                }
              )
          end
          def to_hash
          end

          module Data
            extend Braintrust::Union

            class Bundle < Braintrust::Models::CodeBundle
              sig { returns(Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::OrSymbol) }
              attr_accessor :type

              sig do
                params(type: Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::OrSymbol)
                  .returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override
                  .returns(
                    {type: Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::OrSymbol}
                  )
              end
              def to_hash
              end

              module Type
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                    )
                  end

                BUNDLE =
                  T.let(
                    :bundle,
                    Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol]
                    )
                end
                def self.values
                end
              end
            end

            class Inline < Braintrust::BaseModel
              sig { returns(String) }
              attr_accessor :code

              sig { returns(Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext) }
              attr_reader :runtime_context

              sig do
                params(
                  runtime_context: T.any(
                    Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext,
                    Braintrust::Util::AnyHash
                  )
                )
                  .void
              end
              attr_writer :runtime_context

              sig { returns(Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::OrSymbol) }
              attr_accessor :type

              sig do
                params(
                  code: String,
                  runtime_context: T.any(
                    Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext,
                    Braintrust::Util::AnyHash
                  ),
                  type: Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::OrSymbol
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
                      runtime_context: Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext,
                      type: Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::OrSymbol
                    }
                  )
              end
              def to_hash
              end

              class RuntimeContext < Braintrust::BaseModel
                sig do
                  returns(
                    Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                  )
                end
                attr_accessor :runtime

                sig { returns(String) }
                attr_accessor :version

                sig do
                  params(
                    runtime: Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
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
                        runtime: Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
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
                      T.all(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime)
                    end
                  OrSymbol =
                    T.type_alias do
                      T.any(
                        Symbol,
                        Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                      )
                    end

                  NODE =
                    T.let(
                      :node,
                      Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )
                  PYTHON =
                    T.let(
                      :python,
                      Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                    )

                  sig do
                    override
                      .returns(
                        T::Array[
                        Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                        ]
                      )
                  end
                  def self.values
                  end
                end
              end

              module Type
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                    )
                  end

                INLINE =
                  T.let(
                    :inline,
                    Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                  )

                sig do
                  override
                    .returns(
                      T::Array[Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol]
                    )
                end
                def self.values
                end
              end
            end

            sig do
              override
                .returns(
                  [Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline]
                )
            end
            def self.variants
            end
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Type::TaggedSymbol) }

            CODE = T.let(:code, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Type::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Type::TaggedSymbol])
            end
            def self.values
            end
          end
        end

        class Global < Braintrust::BaseModel
          sig { returns(String) }
          attr_accessor :name

          sig { returns(Braintrust::Models::FunctionReplaceParams::FunctionData::Global::Type::OrSymbol) }
          attr_accessor :type

          sig do
            params(
              name: String,
              type: Braintrust::Models::FunctionReplaceParams::FunctionData::Global::Type::OrSymbol
            )
              .returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override
              .returns(
                {name: String, type: Braintrust::Models::FunctionReplaceParams::FunctionData::Global::Type::OrSymbol}
              )
          end
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Global::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Global::Type::TaggedSymbol) }

            GLOBAL =
              T.let(:global, Braintrust::Models::FunctionReplaceParams::FunctionData::Global::Type::TaggedSymbol)

            sig do
              override
                .returns(T::Array[Braintrust::Models::FunctionReplaceParams::FunctionData::Global::Type::TaggedSymbol])
            end
            def self.values
            end
          end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt, Braintrust::Models::FunctionReplaceParams::FunctionData::Code, Braintrust::Models::FunctionReplaceParams::FunctionData::Global]
            )
        end
        def self.variants
        end
      end

      class FunctionSchema < Braintrust::BaseModel
        sig { returns(T.nilable(T.anything)) }
        attr_reader :parameters

        sig { params(parameters: T.anything).void }
        attr_writer :parameters

        sig { returns(T.nilable(T.anything)) }
        attr_reader :returns

        sig { params(returns: T.anything).void }
        attr_writer :returns

        # JSON schema for the function's parameters and return type
        sig { params(parameters: T.anything, returns: T.anything).returns(T.attached_class) }
        def self.new(parameters: nil, returns: nil)
        end

        sig { override.returns({parameters: T.anything, returns: T.anything}) }
        def to_hash
        end
      end

      module FunctionType
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionType) }
        OrSymbol =
          T.type_alias { T.any(Symbol, Braintrust::Models::FunctionReplaceParams::FunctionType::TaggedSymbol) }

        LLM = T.let(:llm, Braintrust::Models::FunctionReplaceParams::FunctionType::TaggedSymbol)
        SCORER = T.let(:scorer, Braintrust::Models::FunctionReplaceParams::FunctionType::TaggedSymbol)
        TASK = T.let(:task, Braintrust::Models::FunctionReplaceParams::FunctionType::TaggedSymbol)
        TOOL = T.let(:tool, Braintrust::Models::FunctionReplaceParams::FunctionType::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::FunctionReplaceParams::FunctionType::TaggedSymbol]) }
        def self.values
        end
      end

      class Origin < Braintrust::BaseModel
        # Id of the object the function is originating from
        sig { returns(String) }
        attr_accessor :object_id_

        # The object type that the ACL applies to
        sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
        attr_accessor :object_type

        # The function exists for internal purposes and should not be displayed in the
        #   list of functions.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :internal

        sig do
          params(
            object_id_: String,
            object_type: Braintrust::Models::ACLObjectType::OrSymbol,
            internal: T.nilable(T::Boolean)
          )
            .returns(T.attached_class)
        end
        def self.new(object_id_:, object_type:, internal: nil)
        end

        sig do
          override
            .returns(
              {object_id_: String, object_type: Braintrust::Models::ACLObjectType::OrSymbol, internal: T.nilable(T::Boolean)}
            )
        end
        def to_hash
        end
      end
    end
  end
end
