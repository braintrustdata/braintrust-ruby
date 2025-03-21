# typed: strong

module Braintrust
  module Models
    class FunctionCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig do
        returns(
          T.any(
            Braintrust::Models::FunctionCreateParams::FunctionData::Prompt,
            Braintrust::Models::FunctionCreateParams::FunctionData::Code,
            Braintrust::Models::FunctionCreateParams::FunctionData::Global
          )
        )
      end
      def function_data
      end

      sig do
        params(
          _: T.any(
            Braintrust::Models::FunctionCreateParams::FunctionData::Prompt,
            Braintrust::Models::FunctionCreateParams::FunctionData::Code,
            Braintrust::Models::FunctionCreateParams::FunctionData::Global
          )
        )
          .returns(
            T.any(
              Braintrust::Models::FunctionCreateParams::FunctionData::Prompt,
              Braintrust::Models::FunctionCreateParams::FunctionData::Code,
              Braintrust::Models::FunctionCreateParams::FunctionData::Global
            )
          )
      end
      def function_data=(_)
      end

      # Name of the prompt
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Unique identifier for the project that the prompt belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # Unique identifier for the prompt
      sig { returns(String) }
      def slug
      end

      sig { params(_: String).returns(String) }
      def slug=(_)
      end

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # JSON schema for the function's parameters and return type
      sig { returns(T.nilable(Braintrust::Models::FunctionCreateParams::FunctionSchema)) }
      def function_schema
      end

      sig do
        params(_: T.nilable(Braintrust::Models::FunctionCreateParams::FunctionSchema))
          .returns(T.nilable(Braintrust::Models::FunctionCreateParams::FunctionSchema))
      end
      def function_schema=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::FunctionCreateParams::FunctionType::OrSymbol)) }
      def function_type
      end

      sig do
        params(_: T.nilable(Braintrust::Models::FunctionCreateParams::FunctionType::OrSymbol))
          .returns(T.nilable(Braintrust::Models::FunctionCreateParams::FunctionType::OrSymbol))
      end
      def function_type=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::FunctionCreateParams::Origin)) }
      def origin
      end

      sig do
        params(_: T.nilable(Braintrust::Models::FunctionCreateParams::Origin))
          .returns(T.nilable(Braintrust::Models::FunctionCreateParams::Origin))
      end
      def origin=(_)
      end

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data
      end

      sig { params(_: T.nilable(Braintrust::Models::PromptData)).returns(T.nilable(Braintrust::Models::PromptData)) }
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
          function_data: T.any(
            Braintrust::Models::FunctionCreateParams::FunctionData::Prompt,
            Braintrust::Models::FunctionCreateParams::FunctionData::Code,
            Braintrust::Models::FunctionCreateParams::FunctionData::Global
          ),
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_schema: T.nilable(Braintrust::Models::FunctionCreateParams::FunctionSchema),
          function_type: T.nilable(Braintrust::Models::FunctionCreateParams::FunctionType::OrSymbol),
          origin: T.nilable(Braintrust::Models::FunctionCreateParams::Origin),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          tags: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
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
                Braintrust::Models::FunctionCreateParams::FunctionData::Prompt,
                Braintrust::Models::FunctionCreateParams::FunctionData::Code,
                Braintrust::Models::FunctionCreateParams::FunctionData::Global
              ),
              name: String,
              project_id: String,
              slug: String,
              description: T.nilable(String),
              function_schema: T.nilable(Braintrust::Models::FunctionCreateParams::FunctionSchema),
              function_type: T.nilable(Braintrust::Models::FunctionCreateParams::FunctionType::OrSymbol),
              origin: T.nilable(Braintrust::Models::FunctionCreateParams::Origin),
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
                Braintrust::Models::FunctionCreateParams::FunctionData::Prompt,
                Braintrust::Models::FunctionCreateParams::FunctionData::Code,
                Braintrust::Models::FunctionCreateParams::FunctionData::Global
              )
            }
          end

        class Prompt < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type::OrSymbol)
              .returns(Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(type: Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig { override.returns({type: Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type::OrSymbol}) }
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type::TaggedSymbol) }

            PROMPT = T.let(:prompt, Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type::OrSymbol)
          end
        end

        class Code < Braintrust::BaseModel
          sig do
            returns(
              T.any(
                Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle,
                Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline
              )
            )
          end
          def data
          end

          sig do
            params(
              _: T.any(
                Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle,
                Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline
              )
            )
              .returns(
                T.any(
                  Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle,
                  Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline
                )
              )
          end
          def data=(_)
          end

          sig { returns(Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type::OrSymbol)
              .returns(Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(
              data: T.any(
                Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle,
                Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline
              ),
              type: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type::OrSymbol
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
                    Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle,
                    Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline
                  ),
                  type: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type::OrSymbol
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
                    Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle,
                    Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline
                  )
                }
              end

            class Bundle < Braintrust::Models::CodeBundle
              sig { returns(Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol) }
              def type
              end

              sig do
                params(_: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol)
                  .returns(Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol)
              end
              def type=(_)
              end

              sig do
                params(type: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol)
                  .returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override
                  .returns(
                    {type: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol}
                  )
              end
              def to_hash
              end

              module Type
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type::TaggedSymbol
                    )
                  end

                BUNDLE =
                  T.let(:bundle, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type::OrSymbol)
              end
            end

            class Inline < Braintrust::BaseModel
              sig { returns(String) }
              def code
              end

              sig { params(_: String).returns(String) }
              def code=(_)
              end

              sig { returns(Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext) }
              def runtime_context
              end

              sig do
                params(_: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext)
                  .returns(Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext)
              end
              def runtime_context=(_)
              end

              sig { returns(Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type::OrSymbol) }
              def type
              end

              sig do
                params(_: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type::OrSymbol)
                  .returns(Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type::OrSymbol)
              end
              def type=(_)
              end

              sig do
                params(
                  code: String,
                  runtime_context: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext,
                  type: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type::OrSymbol
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
                      runtime_context: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext,
                      type: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type::OrSymbol
                    }
                  )
              end
              def to_hash
              end

              class RuntimeContext < Braintrust::BaseModel
                sig do
                  returns(
                    Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                  )
                end
                def runtime
                end

                sig do
                  params(
                    _: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                  )
                    .returns(
                      Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
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
                    runtime: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
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
                        runtime: Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol,
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
                      T.all(Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime)
                    end
                  OrSymbol =
                    T.type_alias do
                      T.any(
                        Symbol,
                        Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::TaggedSymbol
                      )
                    end

                  NODE =
                    T.let(
                      :node,
                      Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                    )
                  PYTHON =
                    T.let(
                      :python,
                      Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime::OrSymbol
                    )
                end
              end

              module Type
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type) }
                OrSymbol =
                  T.type_alias do
                    T.any(
                      Symbol,
                      Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type::TaggedSymbol
                    )
                  end

                INLINE =
                  T.let(:inline, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type::OrSymbol)
              end
            end
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type::TaggedSymbol) }

            CODE = T.let(:code, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type::OrSymbol)
          end
        end

        class Global < Braintrust::BaseModel
          sig { returns(String) }
          def name
          end

          sig { params(_: String).returns(String) }
          def name=(_)
          end

          sig { returns(Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type::OrSymbol)
              .returns(Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(name: String, type: Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override
              .returns(
                {name: String, type: Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type::OrSymbol}
              )
          end
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type::TaggedSymbol) }

            GLOBAL = T.let(:global, Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type::OrSymbol)
          end
        end
      end

      class FunctionSchema < Braintrust::BaseModel
        sig { returns(T.nilable(T.anything)) }
        def parameters
        end

        sig { params(_: T.anything).returns(T.anything) }
        def parameters=(_)
        end

        sig { returns(T.nilable(T.anything)) }
        def returns
        end

        sig { params(_: T.anything).returns(T.anything) }
        def returns=(_)
        end

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

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::FunctionCreateParams::FunctionType) }
        OrSymbol =
          T.type_alias { T.any(Symbol, Braintrust::Models::FunctionCreateParams::FunctionType::TaggedSymbol) }

        LLM = T.let(:llm, Braintrust::Models::FunctionCreateParams::FunctionType::OrSymbol)
        SCORER = T.let(:scorer, Braintrust::Models::FunctionCreateParams::FunctionType::OrSymbol)
        TASK = T.let(:task, Braintrust::Models::FunctionCreateParams::FunctionType::OrSymbol)
        TOOL = T.let(:tool, Braintrust::Models::FunctionCreateParams::FunctionType::OrSymbol)
      end

      class Origin < Braintrust::BaseModel
        # Id of the object the function is originating from
        sig { returns(String) }
        def object_id_
        end

        sig { params(_: String).returns(String) }
        def object_id_=(_)
        end

        # The object type that the ACL applies to
        sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
        def object_type
        end

        sig do
          params(_: Braintrust::Models::ACLObjectType::OrSymbol).returns(Braintrust::Models::ACLObjectType::OrSymbol)
        end
        def object_type=(_)
        end

        # The function exists for internal purposes and should not be displayed in the
        #   list of functions.
        sig { returns(T.nilable(T::Boolean)) }
        def internal
        end

        sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
        def internal=(_)
        end

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
