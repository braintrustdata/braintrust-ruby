# typed: strong

module Braintrust
  module Models
    class FunctionInvokeParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # The expected output of the function
      sig { returns(T.nilable(T.anything)) }
      def expected
      end

      sig { params(_: T.anything).returns(T.anything) }
      def expected=(_)
      end

      # Argument to the function, which can be any JSON serializable value
      sig { returns(T.nilable(T.anything)) }
      def input
      end

      sig { params(_: T.anything).returns(T.anything) }
      def input=(_)
      end

      # If the function is an LLM, additional messages to pass along to it
      sig do
        returns(
          T.nilable(
            T::Array[
            T.any(
              Braintrust::Models::FunctionInvokeParams::Message::System,
              Braintrust::Models::FunctionInvokeParams::Message::User,
              Braintrust::Models::FunctionInvokeParams::Message::Assistant,
              Braintrust::Models::FunctionInvokeParams::Message::Tool,
              Braintrust::Models::FunctionInvokeParams::Message::Function,
              Braintrust::Models::FunctionInvokeParams::Message::Fallback
            )
            ]
          )
        )
      end
      def messages
      end

      sig do
        params(
          _: T::Array[
          T.any(
            Braintrust::Models::FunctionInvokeParams::Message::System,
            Braintrust::Models::FunctionInvokeParams::Message::User,
            Braintrust::Models::FunctionInvokeParams::Message::Assistant,
            Braintrust::Models::FunctionInvokeParams::Message::Tool,
            Braintrust::Models::FunctionInvokeParams::Message::Function,
            Braintrust::Models::FunctionInvokeParams::Message::Fallback
          )
          ]
        )
          .returns(
            T::Array[
            T.any(
              Braintrust::Models::FunctionInvokeParams::Message::System,
              Braintrust::Models::FunctionInvokeParams::Message::User,
              Braintrust::Models::FunctionInvokeParams::Message::Assistant,
              Braintrust::Models::FunctionInvokeParams::Message::Tool,
              Braintrust::Models::FunctionInvokeParams::Message::Function,
              Braintrust::Models::FunctionInvokeParams::Message::Fallback
            )
            ]
          )
      end
      def messages=(_)
      end

      # Any relevant metadata
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      # The mode format of the returned value (defaults to 'auto')
      sig { returns(T.nilable(Braintrust::Models::FunctionInvokeParams::Mode::OrSymbol)) }
      def mode
      end

      sig do
        params(_: T.nilable(Braintrust::Models::FunctionInvokeParams::Mode::OrSymbol))
          .returns(T.nilable(Braintrust::Models::FunctionInvokeParams::Mode::OrSymbol))
      end
      def mode=(_)
      end

      # Options for tracing the function call
      sig { returns(T.nilable(T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String))) }
      def parent
      end

      sig do
        params(_: T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String))
          .returns(T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String))
      end
      def parent=(_)
      end

      # Whether to stream the response. If true, results will be returned in the
      #   Braintrust SSE format.
      sig { returns(T.nilable(T::Boolean)) }
      def stream
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def stream=(_)
      end

      # The version of the function
      sig { returns(T.nilable(String)) }
      def version
      end

      sig { params(_: String).returns(String) }
      def version=(_)
      end

      sig do
        params(
          expected: T.anything,
          input: T.anything,
          messages: T::Array[
          T.any(
            Braintrust::Models::FunctionInvokeParams::Message::System,
            Braintrust::Models::FunctionInvokeParams::Message::User,
            Braintrust::Models::FunctionInvokeParams::Message::Assistant,
            Braintrust::Models::FunctionInvokeParams::Message::Tool,
            Braintrust::Models::FunctionInvokeParams::Message::Function,
            Braintrust::Models::FunctionInvokeParams::Message::Fallback
          )
          ],
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          mode: T.nilable(Braintrust::Models::FunctionInvokeParams::Mode::OrSymbol),
          parent: T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String),
          stream: T.nilable(T::Boolean),
          version: String,
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
        expected: nil,
        input: nil,
        messages: nil,
        metadata: nil,
        mode: nil,
        parent: nil,
        stream: nil,
        version: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              expected: T.anything,
              input: T.anything,
              messages: T::Array[
              T.any(
                Braintrust::Models::FunctionInvokeParams::Message::System,
                Braintrust::Models::FunctionInvokeParams::Message::User,
                Braintrust::Models::FunctionInvokeParams::Message::Assistant,
                Braintrust::Models::FunctionInvokeParams::Message::Tool,
                Braintrust::Models::FunctionInvokeParams::Message::Function,
                Braintrust::Models::FunctionInvokeParams::Message::Fallback
              )
              ],
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              mode: T.nilable(Braintrust::Models::FunctionInvokeParams::Mode::OrSymbol),
              parent: T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String),
              stream: T.nilable(T::Boolean),
              version: String,
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      module Message
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Braintrust::Models::FunctionInvokeParams::Message::System,
                Braintrust::Models::FunctionInvokeParams::Message::User,
                Braintrust::Models::FunctionInvokeParams::Message::Assistant,
                Braintrust::Models::FunctionInvokeParams::Message::Tool,
                Braintrust::Models::FunctionInvokeParams::Message::Function,
                Braintrust::Models::FunctionInvokeParams::Message::Fallback
              )
            }
          end

        class System < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::System::Role::OrSymbol) }
          def role
          end

          sig do
            params(_: Braintrust::Models::FunctionInvokeParams::Message::System::Role::OrSymbol)
              .returns(Braintrust::Models::FunctionInvokeParams::Message::System::Role::OrSymbol)
          end
          def role=(_)
          end

          sig { returns(T.nilable(String)) }
          def content
          end

          sig { params(_: String).returns(String) }
          def content=(_)
          end

          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: String).returns(String) }
          def name=(_)
          end

          sig do
            params(
              role: Braintrust::Models::FunctionInvokeParams::Message::System::Role::OrSymbol,
              content: String,
              name: String
            )
              .returns(T.attached_class)
          end
          def self.new(role:, content: nil, name: nil)
          end

          sig do
            override
              .returns(
                {role: Braintrust::Models::FunctionInvokeParams::Message::System::Role::OrSymbol, content: String, name: String}
              )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionInvokeParams::Message::System::Role) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionInvokeParams::Message::System::Role::TaggedSymbol) }

            SYSTEM = T.let(:system, Braintrust::Models::FunctionInvokeParams::Message::System::Role::TaggedSymbol)

            class << self
              sig { override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::System::Role::TaggedSymbol]) }
              def values
              end
            end
          end
        end

        class User < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::User::Role::OrSymbol) }
          def role
          end

          sig do
            params(_: Braintrust::Models::FunctionInvokeParams::Message::User::Role::OrSymbol)
              .returns(Braintrust::Models::FunctionInvokeParams::Message::User::Role::OrSymbol)
          end
          def role=(_)
          end

          sig do
            returns(
              T.nilable(
                T.any(
                  String,
                  T::Array[
                  T.any(
                    Braintrust::Models::ChatCompletionContentPartText,
                    Braintrust::Models::ChatCompletionContentPartImage
                  )
                  ]
                )
              )
            )
          end
          def content
          end

          sig do
            params(
              _: T.any(
                String,
                T::Array[
                T.any(
                  Braintrust::Models::ChatCompletionContentPartText,
                  Braintrust::Models::ChatCompletionContentPartImage
                )
                ]
              )
            )
              .returns(
                T.any(
                  String,
                  T::Array[
                  T.any(
                    Braintrust::Models::ChatCompletionContentPartText,
                    Braintrust::Models::ChatCompletionContentPartImage
                  )
                  ]
                )
              )
          end
          def content=(_)
          end

          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: String).returns(String) }
          def name=(_)
          end

          sig do
            params(
              role: Braintrust::Models::FunctionInvokeParams::Message::User::Role::OrSymbol,
              content: T.any(
                String,
                T::Array[
                T.any(
                  Braintrust::Models::ChatCompletionContentPartText,
                  Braintrust::Models::ChatCompletionContentPartImage
                )
                ]
              ),
              name: String
            )
              .returns(T.attached_class)
          end
          def self.new(role:, content: nil, name: nil)
          end

          sig do
            override
              .returns(
                {
                  role: Braintrust::Models::FunctionInvokeParams::Message::User::Role::OrSymbol,
                  content: T.any(
                    String,
                    T::Array[
                    T.any(
                      Braintrust::Models::ChatCompletionContentPartText,
                      Braintrust::Models::ChatCompletionContentPartImage
                    )
                    ]
                  ),
                  name: String
                }
              )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionInvokeParams::Message::User::Role) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionInvokeParams::Message::User::Role::TaggedSymbol) }

            USER = T.let(:user, Braintrust::Models::FunctionInvokeParams::Message::User::Role::TaggedSymbol)

            class << self
              sig { override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::User::Role::TaggedSymbol]) }
              def values
              end
            end
          end

          module Content
            extend Braintrust::Union

            Variants =
              type_template(:out) do
                {
                  fixed: T.any(
                    String,
                    T::Array[
                    T.any(
                      Braintrust::Models::ChatCompletionContentPartText,
                      Braintrust::Models::ChatCompletionContentPartImage
                    )
                    ]
                  )
                }
              end

            Nested2DArray =
              T.let(
                Braintrust::ArrayOf[union: Braintrust::Models::FunctionInvokeParams::Message::User::Content::Array],
                Braintrust::Converter
              )

            module Array
              extend Braintrust::Union

              Variants =
                type_template(:out) do
                  {
                    fixed: T.any(
                      Braintrust::Models::ChatCompletionContentPartText,
                      Braintrust::Models::ChatCompletionContentPartImage
                    )
                  }
                end

              class << self
                sig do
                  override
                    .returns(
                      [Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage]
                    )
                end
                def variants
                end
              end
            end

            class << self
              sig do
                override
                  .returns(
                    [
                      String,
                      T::Array[
                                          T.any(
                                            Braintrust::Models::ChatCompletionContentPartText,
                                            Braintrust::Models::ChatCompletionContentPartImage
                                          )
                                          ]
                    ]
                  )
              end
              def variants
              end
            end
          end
        end

        class Assistant < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::OrSymbol) }
          def role
          end

          sig do
            params(_: Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::OrSymbol)
              .returns(Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::OrSymbol)
          end
          def role=(_)
          end

          sig { returns(T.nilable(String)) }
          def content
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def content=(_)
          end

          sig { returns(T.nilable(Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall)) }
          def function_call
          end

          sig do
            params(
              _: T.nilable(
                T.any(
                  Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall,
                  Braintrust::Util::AnyHash
                )
              )
            )
              .returns(
                T.nilable(
                  T.any(
                    Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall,
                    Braintrust::Util::AnyHash
                  )
                )
              )
          end
          def function_call=(_)
          end

          sig { returns(T.nilable(String)) }
          def name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def name=(_)
          end

          sig { returns(T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])) }
          def tool_calls
          end

          sig do
            params(_: T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall]))
              .returns(T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall]))
          end
          def tool_calls=(_)
          end

          sig do
            params(
              role: Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::OrSymbol,
              content: T.nilable(String),
              function_call: T.nilable(Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall),
              name: T.nilable(String),
              tool_calls: T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])
            )
              .returns(T.attached_class)
          end
          def self.new(role:, content: nil, function_call: nil, name: nil, tool_calls: nil)
          end

          sig do
            override
              .returns(
                {
                  role: Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::OrSymbol,
                  content: T.nilable(String),
                  function_call: T.nilable(Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall),
                  name: T.nilable(String),
                  tool_calls: T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])
                }
              )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::TaggedSymbol) }

            ASSISTANT =
              T.let(:assistant, Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::TaggedSymbol)

            class << self
              sig do
                override
                  .returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::TaggedSymbol])
              end
              def values
              end
            end
          end

          class FunctionCall < Braintrust::BaseModel
            sig { returns(String) }
            def arguments
            end

            sig { params(_: String).returns(String) }
            def arguments=(_)
            end

            sig { returns(String) }
            def name
            end

            sig { params(_: String).returns(String) }
            def name=(_)
            end

            sig { params(arguments: String, name: String).returns(T.attached_class) }
            def self.new(arguments:, name:)
            end

            sig { override.returns({arguments: String, name: String}) }
            def to_hash
            end
          end
        end

        class Tool < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::Tool::Role::OrSymbol) }
          def role
          end

          sig do
            params(_: Braintrust::Models::FunctionInvokeParams::Message::Tool::Role::OrSymbol)
              .returns(Braintrust::Models::FunctionInvokeParams::Message::Tool::Role::OrSymbol)
          end
          def role=(_)
          end

          sig { returns(T.nilable(String)) }
          def content
          end

          sig { params(_: String).returns(String) }
          def content=(_)
          end

          sig { returns(T.nilable(String)) }
          def tool_call_id
          end

          sig { params(_: String).returns(String) }
          def tool_call_id=(_)
          end

          sig do
            params(
              role: Braintrust::Models::FunctionInvokeParams::Message::Tool::Role::OrSymbol,
              content: String,
              tool_call_id: String
            )
              .returns(T.attached_class)
          end
          def self.new(role:, content: nil, tool_call_id: nil)
          end

          sig do
            override
              .returns(
                {
                  role: Braintrust::Models::FunctionInvokeParams::Message::Tool::Role::OrSymbol,
                  content: String,
                  tool_call_id: String
                }
              )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionInvokeParams::Message::Tool::Role) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionInvokeParams::Message::Tool::Role::TaggedSymbol) }

            TOOL = T.let(:tool, Braintrust::Models::FunctionInvokeParams::Message::Tool::Role::TaggedSymbol)

            class << self
              sig { override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::Tool::Role::TaggedSymbol]) }
              def values
              end
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

          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::Function::Role::OrSymbol) }
          def role
          end

          sig do
            params(_: Braintrust::Models::FunctionInvokeParams::Message::Function::Role::OrSymbol)
              .returns(Braintrust::Models::FunctionInvokeParams::Message::Function::Role::OrSymbol)
          end
          def role=(_)
          end

          sig { returns(T.nilable(String)) }
          def content
          end

          sig { params(_: String).returns(String) }
          def content=(_)
          end

          sig do
            params(
              name: String,
              role: Braintrust::Models::FunctionInvokeParams::Message::Function::Role::OrSymbol,
              content: String
            )
              .returns(T.attached_class)
          end
          def self.new(name:, role:, content: nil)
          end

          sig do
            override
              .returns(
                {
                  name: String,
                  role: Braintrust::Models::FunctionInvokeParams::Message::Function::Role::OrSymbol,
                  content: String
                }
              )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionInvokeParams::Message::Function::Role) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionInvokeParams::Message::Function::Role::TaggedSymbol) }

            FUNCTION =
              T.let(:function, Braintrust::Models::FunctionInvokeParams::Message::Function::Role::TaggedSymbol)

            class << self
              sig do
                override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::Function::Role::TaggedSymbol])
              end
              def values
              end
            end
          end
        end

        class Fallback < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role::OrSymbol) }
          def role
          end

          sig do
            params(_: Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role::OrSymbol)
              .returns(Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role::OrSymbol)
          end
          def role=(_)
          end

          sig { returns(T.nilable(String)) }
          def content
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def content=(_)
          end

          sig do
            params(
              role: Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role::OrSymbol,
              content: T.nilable(String)
            )
              .returns(T.attached_class)
          end
          def self.new(role:, content: nil)
          end

          sig do
            override
              .returns(
                {
                  role: Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role::OrSymbol,
                  content: T.nilable(String)
                }
              )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role::TaggedSymbol) }

            MODEL = T.let(:model, Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role::TaggedSymbol)

            class << self
              sig do
                override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role::TaggedSymbol])
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
                [Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback]
              )
          end
          def variants
          end
        end
      end

      # The mode format of the returned value (defaults to 'auto')
      module Mode
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::FunctionInvokeParams::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::FunctionInvokeParams::Mode::TaggedSymbol) }

        AUTO = T.let(:auto, Braintrust::Models::FunctionInvokeParams::Mode::TaggedSymbol)
        PARALLEL = T.let(:parallel, Braintrust::Models::FunctionInvokeParams::Mode::TaggedSymbol)

        class << self
          sig { override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Mode::TaggedSymbol]) }
          def values
          end
        end
      end

      # Options for tracing the function call
      module Parent
        extend Braintrust::Union

        Variants =
          type_template(:out) { {fixed: T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String)} }

        class SpanParentStruct < Braintrust::BaseModel
          # The id of the container object you are logging to
          sig { returns(String) }
          def object_id_
          end

          sig { params(_: String).returns(String) }
          def object_id_=(_)
          end

          sig { returns(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::OrSymbol) }
          def object_type
          end

          sig do
            params(_: Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::OrSymbol)
              .returns(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::OrSymbol)
          end
          def object_type=(_)
          end

          # Include these properties in every span created under this parent
          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          def propagated_event
          end

          sig do
            params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
              .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          end
          def propagated_event=(_)
          end

          # Identifiers for the row to to log a subspan under
          sig { returns(T.nilable(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs)) }
          def row_ids
          end

          sig do
            params(
              _: T.nilable(
                T.any(
                  Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs,
                  Braintrust::Util::AnyHash
                )
              )
            )
              .returns(
                T.nilable(
                  T.any(
                    Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs,
                    Braintrust::Util::AnyHash
                  )
                )
              )
          end
          def row_ids=(_)
          end

          # Span parent properties
          sig do
            params(
              object_id_: String,
              object_type: Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::OrSymbol,
              propagated_event: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              row_ids: T.nilable(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs)
            )
              .returns(T.attached_class)
          end
          def self.new(object_id_:, object_type:, propagated_event: nil, row_ids: nil)
          end

          sig do
            override
              .returns(
                {
                  object_id_: String,
                  object_type: Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::OrSymbol,
                  propagated_event: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
                  row_ids: T.nilable(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs)
                }
              )
          end
          def to_hash
          end

          module ObjectType
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType) }
            OrSymbol =
              T.type_alias do
                T.any(
                  Symbol,
                  Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
                )
              end

            PROJECT_LOGS =
              T.let(
                :project_logs,
                Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )
            EXPERIMENT =
              T.let(
                :experiment,
                Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )
            PLAYGROUND_LOGS =
              T.let(
                :playground_logs,
                Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )

            class << self
              sig do
                override
                  .returns(
                    T::Array[Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol]
                  )
              end
              def values
              end
            end
          end

          class RowIDs < Braintrust::BaseModel
            # The id of the row
            sig { returns(String) }
            def id
            end

            sig { params(_: String).returns(String) }
            def id=(_)
            end

            # The root_span_id of the row
            sig { returns(String) }
            def root_span_id
            end

            sig { params(_: String).returns(String) }
            def root_span_id=(_)
            end

            # The span_id of the row
            sig { returns(String) }
            def span_id
            end

            sig { params(_: String).returns(String) }
            def span_id=(_)
            end

            # Identifiers for the row to to log a subspan under
            sig { params(id: String, root_span_id: String, span_id: String).returns(T.attached_class) }
            def self.new(id:, root_span_id:, span_id:)
            end

            sig { override.returns({id: String, root_span_id: String, span_id: String}) }
            def to_hash
            end
          end
        end

        class << self
          sig { override.returns([Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String]) }
          def variants
          end
        end
      end
    end
  end
end
