# typed: strong

module Braintrust
  module Models
    class FunctionInvokeParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(T.anything)) }
      def input
      end

      sig { params(_: T.anything).returns(T.anything) }
      def input=(_)
      end

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

      sig { returns(T.nilable(Symbol)) }
      def mode
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def mode=(_)
      end

      sig { returns(T.nilable(T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String))) }
      def parent
      end

      sig do
        params(_: T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String))
          .returns(T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String))
      end
      def parent=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def stream
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def stream=(_)
      end

      sig { returns(T.nilable(String)) }
      def version
      end

      sig { params(_: String).returns(String) }
      def version=(_)
      end

      sig do
        params(
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
          mode: T.nilable(Symbol),
          parent: T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String),
          stream: T.nilable(T::Boolean),
          version: String,
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(
        input: nil,
        messages: nil,
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
              mode: T.nilable(Symbol),
              parent: T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String),
              stream: T.nilable(T::Boolean),
              version: String,
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Message < Braintrust::Union
        abstract!

        class System < Braintrust::BaseModel
          sig { returns(Symbol) }
          def role
          end

          sig { params(_: Symbol).returns(Symbol) }
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

          sig { params(role: Symbol, content: String, name: String).void }
          def initialize(role:, content: nil, name: nil)
          end

          sig { override.returns({role: Symbol, content: String, name: String}) }
          def to_hash
          end

          class Role < Braintrust::Enum
            abstract!

            SYSTEM = :system

            sig { override.returns(T::Array[Symbol]) }
            def self.values
            end
          end
        end

        class User < Braintrust::BaseModel
          sig { returns(Symbol) }
          def role
          end

          sig { params(_: Symbol).returns(Symbol) }
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
              role: Symbol,
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
              .void
          end
          def initialize(role:, content: nil, name: nil)
          end

          sig do
            override
              .returns(
                {
                  role: Symbol,
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

          class Role < Braintrust::Enum
            abstract!

            USER = :user

            sig { override.returns(T::Array[Symbol]) }
            def self.values
            end
          end

          class Content < Braintrust::Union
            abstract!

            Nested2DArray = T.type_alias do
              T::Array[
              T.any(
                Braintrust::Models::ChatCompletionContentPartText,
                Braintrust::Models::ChatCompletionContentPartImage
              )
              ]
            end

            class Array < Braintrust::Union
              abstract!

              sig do
                override
                  .returns(
                    [[NilClass, Braintrust::Models::ChatCompletionContentPartText], [NilClass, Braintrust::Models::ChatCompletionContentPartImage]]
                  )
              end
              private_class_method def self.variants
              end
            end

            sig do
              override
                .returns(
                  [
                    [NilClass, String],
                    [
                      NilClass,
                      T::Array[
                                        T.any(
                                          Braintrust::Models::ChatCompletionContentPartText,
                                          Braintrust::Models::ChatCompletionContentPartImage
                                        )
                                        ]
                    ]
                  ]
                )
            end
            private_class_method def self.variants
            end
          end
        end

        class Assistant < Braintrust::BaseModel
          sig { returns(Symbol) }
          def role
          end

          sig { params(_: Symbol).returns(Symbol) }
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
            params(_: T.nilable(Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall))
              .returns(T.nilable(Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall))
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
              role: Symbol,
              content: T.nilable(String),
              function_call: T.nilable(Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall),
              name: T.nilable(String),
              tool_calls: T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])
            )
              .void
          end
          def initialize(role:, content: nil, function_call: nil, name: nil, tool_calls: nil)
          end

          sig do
            override
              .returns(
                {
                  role: Symbol,
                  content: T.nilable(String),
                  function_call: T.nilable(Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall),
                  name: T.nilable(String),
                  tool_calls: T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])
                }
              )
          end
          def to_hash
          end

          class Role < Braintrust::Enum
            abstract!

            ASSISTANT = :assistant

            sig { override.returns(T::Array[Symbol]) }
            def self.values
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

            sig { params(arguments: String, name: String).void }
            def initialize(arguments:, name:)
            end

            sig { override.returns({arguments: String, name: String}) }
            def to_hash
            end
          end
        end

        class Tool < Braintrust::BaseModel
          sig { returns(Symbol) }
          def role
          end

          sig { params(_: Symbol).returns(Symbol) }
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

          sig { params(role: Symbol, content: String, tool_call_id: String).void }
          def initialize(role:, content: nil, tool_call_id: nil)
          end

          sig { override.returns({role: Symbol, content: String, tool_call_id: String}) }
          def to_hash
          end

          class Role < Braintrust::Enum
            abstract!

            TOOL = :tool

            sig { override.returns(T::Array[Symbol]) }
            def self.values
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

          sig { returns(Symbol) }
          def role
          end

          sig { params(_: Symbol).returns(Symbol) }
          def role=(_)
          end

          sig { returns(T.nilable(String)) }
          def content
          end

          sig { params(_: String).returns(String) }
          def content=(_)
          end

          sig { params(name: String, role: Symbol, content: String).void }
          def initialize(name:, role:, content: nil)
          end

          sig { override.returns({name: String, role: Symbol, content: String}) }
          def to_hash
          end

          class Role < Braintrust::Enum
            abstract!

            FUNCTION = :function

            sig { override.returns(T::Array[Symbol]) }
            def self.values
            end
          end
        end

        class Fallback < Braintrust::BaseModel
          sig { returns(Symbol) }
          def role
          end

          sig { params(_: Symbol).returns(Symbol) }
          def role=(_)
          end

          sig { returns(T.nilable(String)) }
          def content
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def content=(_)
          end

          sig { params(role: Symbol, content: T.nilable(String)).void }
          def initialize(role:, content: nil)
          end

          sig { override.returns({role: Symbol, content: T.nilable(String)}) }
          def to_hash
          end

          class Role < Braintrust::Enum
            abstract!

            MODEL = :model

            sig { override.returns(T::Array[Symbol]) }
            def self.values
            end
          end
        end

        sig do
          override
            .returns(
              [[NilClass, Braintrust::Models::FunctionInvokeParams::Message::System], [NilClass, Braintrust::Models::FunctionInvokeParams::Message::User], [NilClass, Braintrust::Models::FunctionInvokeParams::Message::Assistant], [NilClass, Braintrust::Models::FunctionInvokeParams::Message::Tool], [NilClass, Braintrust::Models::FunctionInvokeParams::Message::Function], [NilClass, Braintrust::Models::FunctionInvokeParams::Message::Fallback]]
            )
        end
        private_class_method def self.variants
        end
      end

      class Mode < Braintrust::Enum
        abstract!

        AUTO = T.let(:auto, T.nilable(Symbol))
        PARALLEL = T.let(:parallel, T.nilable(Symbol))

        sig { override.returns(T::Array[Symbol]) }
        def self.values
        end
      end

      class Parent < Braintrust::Union
        abstract!

        class SpanParentStruct < Braintrust::BaseModel
          sig { returns(String) }
          def object_id_
          end

          sig { params(_: String).returns(String) }
          def object_id_=(_)
          end

          sig { returns(Symbol) }
          def object_type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def object_type=(_)
          end

          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          def propagated_event
          end

          sig do
            params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
              .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          end
          def propagated_event=(_)
          end

          sig { returns(T.nilable(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs)) }
          def row_ids
          end

          sig do
            params(_: T.nilable(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs))
              .returns(T.nilable(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs))
          end
          def row_ids=(_)
          end

          sig do
            params(
              object_id_: String,
              object_type: Symbol,
              propagated_event: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              row_ids: T.nilable(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs)
            )
              .void
          end
          def initialize(object_id_:, object_type:, propagated_event: nil, row_ids: nil)
          end

          sig do
            override
              .returns(
                {
                  object_id_: String,
                  object_type: Symbol,
                  propagated_event: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
                  row_ids: T.nilable(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs)
                }
              )
          end
          def to_hash
          end

          class ObjectType < Braintrust::Enum
            abstract!

            PROJECT_LOGS = :project_logs
            EXPERIMENT = :experiment

            sig { override.returns(T::Array[Symbol]) }
            def self.values
            end
          end

          class RowIDs < Braintrust::BaseModel
            sig { returns(String) }
            def id
            end

            sig { params(_: String).returns(String) }
            def id=(_)
            end

            sig { returns(String) }
            def root_span_id
            end

            sig { params(_: String).returns(String) }
            def root_span_id=(_)
            end

            sig { returns(String) }
            def span_id
            end

            sig { params(_: String).returns(String) }
            def span_id=(_)
            end

            sig { params(id: String, root_span_id: String, span_id: String).void }
            def initialize(id:, root_span_id:, span_id:)
            end

            sig { override.returns({id: String, root_span_id: String, span_id: String}) }
            def to_hash
            end
          end
        end

        sig do
          override
            .returns(
              [[NilClass, Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct], [NilClass, String]]
            )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
