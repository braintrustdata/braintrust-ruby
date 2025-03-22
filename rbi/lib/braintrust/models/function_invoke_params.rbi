# typed: strong

module Braintrust
  module Models
    class FunctionInvokeParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # The expected output of the function
      sig { returns(T.nilable(T.anything)) }
      attr_reader :expected

      sig { params(expected: T.anything).void }
      attr_writer :expected

      # Argument to the function, which can be any JSON serializable value
      sig { returns(T.nilable(T.anything)) }
      attr_reader :input

      sig { params(input: T.anything).void }
      attr_writer :input

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
      attr_reader :messages

      sig do
        params(
          messages: T::Array[
          T.any(
            Braintrust::Models::FunctionInvokeParams::Message::System,
            Braintrust::Util::AnyHash,
            Braintrust::Models::FunctionInvokeParams::Message::User,
            Braintrust::Models::FunctionInvokeParams::Message::Assistant,
            Braintrust::Models::FunctionInvokeParams::Message::Tool,
            Braintrust::Models::FunctionInvokeParams::Message::Function,
            Braintrust::Models::FunctionInvokeParams::Message::Fallback
          )
          ]
        )
          .void
      end
      attr_writer :messages

      # Any relevant metadata
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      # The mode format of the returned value (defaults to 'auto')
      sig { returns(T.nilable(Braintrust::Models::FunctionInvokeParams::Mode::OrSymbol)) }
      attr_accessor :mode

      # Options for tracing the function call
      sig { returns(T.nilable(T.any(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String))) }
      attr_reader :parent

      sig do
        params(
          parent: T.any(
            Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct,
            Braintrust::Util::AnyHash,
            String
          )
        )
          .void
      end
      attr_writer :parent

      # Whether to stream the response. If true, results will be returned in the
      #   Braintrust SSE format.
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :stream

      # The version of the function
      sig { returns(T.nilable(String)) }
      attr_reader :version

      sig { params(version: String).void }
      attr_writer :version

      sig do
        params(
          expected: T.anything,
          input: T.anything,
          messages: T::Array[
          T.any(
            Braintrust::Models::FunctionInvokeParams::Message::System,
            Braintrust::Util::AnyHash,
            Braintrust::Models::FunctionInvokeParams::Message::User,
            Braintrust::Models::FunctionInvokeParams::Message::Assistant,
            Braintrust::Models::FunctionInvokeParams::Message::Tool,
            Braintrust::Models::FunctionInvokeParams::Message::Function,
            Braintrust::Models::FunctionInvokeParams::Message::Fallback
          )
          ],
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          mode: T.nilable(Braintrust::Models::FunctionInvokeParams::Mode::OrSymbol),
          parent: T.any(
            Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct,
            Braintrust::Util::AnyHash,
            String
          ),
          stream: T.nilable(T::Boolean),
          version: String,
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
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

        class System < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::System::Role::OrSymbol) }
          attr_accessor :role

          sig { returns(T.nilable(String)) }
          attr_reader :content

          sig { params(content: String).void }
          attr_writer :content

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

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

            sig { override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::System::Role::TaggedSymbol]) }
            def self.values
            end
          end
        end

        class User < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::User::Role::OrSymbol) }
          attr_accessor :role

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
          attr_reader :content

          sig do
            params(
              content: T.any(
                String,
                T::Array[
                T.any(
                  Braintrust::Models::ChatCompletionContentPartText,
                  Braintrust::Util::AnyHash,
                  Braintrust::Models::ChatCompletionContentPartImage
                )
                ]
              )
            )
              .void
          end
          attr_writer :content

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig do
            params(
              role: Braintrust::Models::FunctionInvokeParams::Message::User::Role::OrSymbol,
              content: T.any(
                String,
                T::Array[
                T.any(
                  Braintrust::Models::ChatCompletionContentPartText,
                  Braintrust::Util::AnyHash,
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

            sig { override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::User::Role::TaggedSymbol]) }
            def self.values
            end
          end

          module Content
            extend Braintrust::Union

            Nested2DArray =
              T.let(
                Braintrust::ArrayOf[union: Braintrust::Models::FunctionInvokeParams::Message::User::Content::Array],
                Braintrust::Converter
              )

            module Array
              extend Braintrust::Union

              sig do
                override
                  .returns(
                    [Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage]
                  )
              end
              def self.variants
              end
            end

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
            def self.variants
            end
          end
        end

        class Assistant < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::OrSymbol) }
          attr_accessor :role

          sig { returns(T.nilable(String)) }
          attr_accessor :content

          sig { returns(T.nilable(Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall)) }
          attr_reader :function_call

          sig do
            params(
              function_call: T.nilable(
                T.any(
                  Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall,
                  Braintrust::Util::AnyHash
                )
              )
            )
              .void
          end
          attr_writer :function_call

          sig { returns(T.nilable(String)) }
          attr_accessor :name

          sig { returns(T.nilable(T::Array[Braintrust::Models::ChatCompletionMessageToolCall])) }
          attr_accessor :tool_calls

          sig do
            params(
              role: Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::OrSymbol,
              content: T.nilable(String),
              function_call: T.nilable(
                T.any(
                  Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall,
                  Braintrust::Util::AnyHash
                )
              ),
              name: T.nilable(String),
              tool_calls: T.nilable(T::Array[T.any(Braintrust::Models::ChatCompletionMessageToolCall, Braintrust::Util::AnyHash)])
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

            sig do
              override
                .returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role::TaggedSymbol])
            end
            def self.values
            end
          end

          class FunctionCall < Braintrust::BaseModel
            sig { returns(String) }
            attr_accessor :arguments

            sig { returns(String) }
            attr_accessor :name

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
          attr_accessor :role

          sig { returns(T.nilable(String)) }
          attr_reader :content

          sig { params(content: String).void }
          attr_writer :content

          sig { returns(T.nilable(String)) }
          attr_reader :tool_call_id

          sig { params(tool_call_id: String).void }
          attr_writer :tool_call_id

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

            sig { override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::Tool::Role::TaggedSymbol]) }
            def self.values
            end
          end
        end

        class Function < Braintrust::BaseModel
          sig { returns(String) }
          attr_accessor :name

          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::Function::Role::OrSymbol) }
          attr_accessor :role

          sig { returns(T.nilable(String)) }
          attr_reader :content

          sig { params(content: String).void }
          attr_writer :content

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

            sig do
              override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::Function::Role::TaggedSymbol])
            end
            def self.values
            end
          end
        end

        class Fallback < Braintrust::BaseModel
          sig { returns(Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role::OrSymbol) }
          attr_accessor :role

          sig { returns(T.nilable(String)) }
          attr_accessor :content

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

            sig do
              override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role::TaggedSymbol])
            end
            def self.values
            end
          end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback]
            )
        end
        def self.variants
        end
      end

      # The mode format of the returned value (defaults to 'auto')
      module Mode
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::FunctionInvokeParams::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::FunctionInvokeParams::Mode::TaggedSymbol) }

        AUTO = T.let(:auto, Braintrust::Models::FunctionInvokeParams::Mode::TaggedSymbol)
        PARALLEL = T.let(:parallel, Braintrust::Models::FunctionInvokeParams::Mode::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::FunctionInvokeParams::Mode::TaggedSymbol]) }
        def self.values
        end
      end

      # Options for tracing the function call
      module Parent
        extend Braintrust::Union

        class SpanParentStruct < Braintrust::BaseModel
          # The id of the container object you are logging to
          sig { returns(String) }
          attr_accessor :object_id_

          sig { returns(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::OrSymbol) }
          attr_accessor :object_type

          # Include these properties in every span created under this parent
          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          attr_accessor :propagated_event

          # Identifiers for the row to to log a subspan under
          sig { returns(T.nilable(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs)) }
          attr_reader :row_ids

          sig do
            params(
              row_ids: T.nilable(
                T.any(
                  Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs,
                  Braintrust::Util::AnyHash
                )
              )
            )
              .void
          end
          attr_writer :row_ids

          # Span parent properties
          sig do
            params(
              object_id_: String,
              object_type: Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::OrSymbol,
              propagated_event: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              row_ids: T.nilable(
                T.any(
                  Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs,
                  Braintrust::Util::AnyHash
                )
              )
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

            sig do
              override
                .returns(
                  T::Array[Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol]
                )
            end
            def self.values
            end
          end

          class RowIDs < Braintrust::BaseModel
            # The id of the row
            sig { returns(String) }
            attr_accessor :id

            # The root_span_id of the row
            sig { returns(String) }
            attr_accessor :root_span_id

            # The span_id of the row
            sig { returns(String) }
            attr_accessor :span_id

            # Identifiers for the row to to log a subspan under
            sig { params(id: String, root_span_id: String, span_id: String).returns(T.attached_class) }
            def self.new(id:, root_span_id:, span_id:)
            end

            sig { override.returns({id: String, root_span_id: String, span_id: String}) }
            def to_hash
            end
          end
        end

        sig { override.returns([Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String]) }
        def self.variants
        end
      end
    end
  end
end
