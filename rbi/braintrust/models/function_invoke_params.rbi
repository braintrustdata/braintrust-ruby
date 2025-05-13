# typed: strong

module Braintrust
  module Models
    class FunctionInvokeParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Braintrust::FunctionInvokeParams, Braintrust::Internal::AnyHash)
        end

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
                Braintrust::FunctionInvokeParams::Message::System,
                Braintrust::FunctionInvokeParams::Message::User,
                Braintrust::FunctionInvokeParams::Message::Assistant,
                Braintrust::FunctionInvokeParams::Message::Tool,
                Braintrust::FunctionInvokeParams::Message::Function,
                Braintrust::FunctionInvokeParams::Message::Fallback
              )
            ]
          )
        )
      end
      attr_reader :messages

      sig do
        params(
          messages:
            T::Array[
              T.any(
                Braintrust::FunctionInvokeParams::Message::System::OrHash,
                Braintrust::FunctionInvokeParams::Message::User::OrHash,
                Braintrust::FunctionInvokeParams::Message::Assistant::OrHash,
                Braintrust::FunctionInvokeParams::Message::Tool::OrHash,
                Braintrust::FunctionInvokeParams::Message::Function::OrHash,
                Braintrust::FunctionInvokeParams::Message::Fallback::OrHash
              )
            ]
        ).void
      end
      attr_writer :messages

      # Any relevant metadata
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      # The mode format of the returned value (defaults to 'auto')
      sig do
        returns(T.nilable(Braintrust::FunctionInvokeParams::Mode::OrSymbol))
      end
      attr_accessor :mode

      # Options for tracing the function call
      sig do
        returns(
          T.nilable(
            T.any(
              Braintrust::FunctionInvokeParams::Parent::SpanParentStruct,
              String
            )
          )
        )
      end
      attr_reader :parent

      sig do
        params(
          parent:
            T.any(
              Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::OrHash,
              String
            )
        ).void
      end
      attr_writer :parent

      # Whether to stream the response. If true, results will be returned in the
      # Braintrust SSE format.
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
          messages:
            T::Array[
              T.any(
                Braintrust::FunctionInvokeParams::Message::System::OrHash,
                Braintrust::FunctionInvokeParams::Message::User::OrHash,
                Braintrust::FunctionInvokeParams::Message::Assistant::OrHash,
                Braintrust::FunctionInvokeParams::Message::Tool::OrHash,
                Braintrust::FunctionInvokeParams::Message::Function::OrHash,
                Braintrust::FunctionInvokeParams::Message::Fallback::OrHash
              )
            ],
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          mode: T.nilable(Braintrust::FunctionInvokeParams::Mode::OrSymbol),
          parent:
            T.any(
              Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::OrHash,
              String
            ),
          stream: T.nilable(T::Boolean),
          version: String,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The expected output of the function
        expected: nil,
        # Argument to the function, which can be any JSON serializable value
        input: nil,
        # If the function is an LLM, additional messages to pass along to it
        messages: nil,
        # Any relevant metadata
        metadata: nil,
        # The mode format of the returned value (defaults to 'auto')
        mode: nil,
        # Options for tracing the function call
        parent: nil,
        # Whether to stream the response. If true, results will be returned in the
        # Braintrust SSE format.
        stream: nil,
        # The version of the function
        version: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            expected: T.anything,
            input: T.anything,
            messages:
              T::Array[
                T.any(
                  Braintrust::FunctionInvokeParams::Message::System,
                  Braintrust::FunctionInvokeParams::Message::User,
                  Braintrust::FunctionInvokeParams::Message::Assistant,
                  Braintrust::FunctionInvokeParams::Message::Tool,
                  Braintrust::FunctionInvokeParams::Message::Function,
                  Braintrust::FunctionInvokeParams::Message::Fallback
                )
              ],
            metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
            mode: T.nilable(Braintrust::FunctionInvokeParams::Mode::OrSymbol),
            parent:
              T.any(
                Braintrust::FunctionInvokeParams::Parent::SpanParentStruct,
                String
              ),
            stream: T.nilable(T::Boolean),
            version: String,
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Message
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::FunctionInvokeParams::Message::System,
              Braintrust::FunctionInvokeParams::Message::User,
              Braintrust::FunctionInvokeParams::Message::Assistant,
              Braintrust::FunctionInvokeParams::Message::Tool,
              Braintrust::FunctionInvokeParams::Message::Function,
              Braintrust::FunctionInvokeParams::Message::Fallback
            )
          end

        class System < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::FunctionInvokeParams::Message::System,
                Braintrust::Internal::AnyHash
              )
            end

          sig do
            returns(
              Braintrust::FunctionInvokeParams::Message::System::Role::OrSymbol
            )
          end
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
              role:
                Braintrust::FunctionInvokeParams::Message::System::Role::OrSymbol,
              content: String,
              name: String
            ).returns(T.attached_class)
          end
          def self.new(role:, content: nil, name: nil)
          end

          sig do
            override.returns(
              {
                role:
                  Braintrust::FunctionInvokeParams::Message::System::Role::OrSymbol,
                content: String,
                name: String
              }
            )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::FunctionInvokeParams::Message::System::Role
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SYSTEM =
              T.let(
                :system,
                Braintrust::FunctionInvokeParams::Message::System::Role::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionInvokeParams::Message::System::Role::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class User < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::FunctionInvokeParams::Message::User,
                Braintrust::Internal::AnyHash
              )
            end

          sig do
            returns(
              Braintrust::FunctionInvokeParams::Message::User::Role::OrSymbol
            )
          end
          attr_accessor :role

          sig do
            returns(
              T.nilable(
                T.any(
                  String,
                  T::Array[
                    T.any(
                      Braintrust::ChatCompletionContentPartText,
                      Braintrust::ChatCompletionContentPartImage
                    )
                  ]
                )
              )
            )
          end
          attr_reader :content

          sig do
            params(
              content:
                T.any(
                  String,
                  T::Array[
                    T.any(
                      Braintrust::ChatCompletionContentPartText::OrHash,
                      Braintrust::ChatCompletionContentPartImage::OrHash
                    )
                  ]
                )
            ).void
          end
          attr_writer :content

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig do
            params(
              role:
                Braintrust::FunctionInvokeParams::Message::User::Role::OrSymbol,
              content:
                T.any(
                  String,
                  T::Array[
                    T.any(
                      Braintrust::ChatCompletionContentPartText::OrHash,
                      Braintrust::ChatCompletionContentPartImage::OrHash
                    )
                  ]
                ),
              name: String
            ).returns(T.attached_class)
          end
          def self.new(role:, content: nil, name: nil)
          end

          sig do
            override.returns(
              {
                role:
                  Braintrust::FunctionInvokeParams::Message::User::Role::OrSymbol,
                content:
                  T.any(
                    String,
                    T::Array[
                      T.any(
                        Braintrust::ChatCompletionContentPartText,
                        Braintrust::ChatCompletionContentPartImage
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
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::FunctionInvokeParams::Message::User::Role
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER =
              T.let(
                :user,
                Braintrust::FunctionInvokeParams::Message::User::Role::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionInvokeParams::Message::User::Role::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Content
            extend Braintrust::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  String,
                  T::Array[
                    T.any(
                      Braintrust::ChatCompletionContentPartText,
                      Braintrust::ChatCompletionContentPartImage
                    )
                  ]
                )
              end

            module Array
              extend Braintrust::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Braintrust::ChatCompletionContentPartText,
                    Braintrust::ChatCompletionContentPartImage
                  )
                end

              sig do
                override.returns(
                  T::Array[
                    Braintrust::FunctionInvokeParams::Message::User::Content::Array::Variants
                  ]
                )
              end
              def self.variants
              end
            end

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionInvokeParams::Message::User::Content::Variants
                ]
              )
            end
            def self.variants
            end

            Nested2DArray =
              T.let(
                Braintrust::Internal::Type::ArrayOf[
                  union:
                    Braintrust::FunctionInvokeParams::Message::User::Content::Array
                ],
                Braintrust::Internal::Type::Converter
              )
          end
        end

        class Assistant < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::FunctionInvokeParams::Message::Assistant,
                Braintrust::Internal::AnyHash
              )
            end

          sig do
            returns(
              Braintrust::FunctionInvokeParams::Message::Assistant::Role::OrSymbol
            )
          end
          attr_accessor :role

          sig { returns(T.nilable(String)) }
          attr_accessor :content

          sig do
            returns(
              T.nilable(
                Braintrust::FunctionInvokeParams::Message::Assistant::FunctionCall
              )
            )
          end
          attr_reader :function_call

          sig do
            params(
              function_call:
                T.nilable(
                  Braintrust::FunctionInvokeParams::Message::Assistant::FunctionCall::OrHash
                )
            ).void
          end
          attr_writer :function_call

          sig { returns(T.nilable(String)) }
          attr_accessor :name

          sig do
            returns(
              T.nilable(T::Array[Braintrust::ChatCompletionMessageToolCall])
            )
          end
          attr_accessor :tool_calls

          sig do
            params(
              role:
                Braintrust::FunctionInvokeParams::Message::Assistant::Role::OrSymbol,
              content: T.nilable(String),
              function_call:
                T.nilable(
                  Braintrust::FunctionInvokeParams::Message::Assistant::FunctionCall::OrHash
                ),
              name: T.nilable(String),
              tool_calls:
                T.nilable(
                  T::Array[Braintrust::ChatCompletionMessageToolCall::OrHash]
                )
            ).returns(T.attached_class)
          end
          def self.new(
            role:,
            content: nil,
            function_call: nil,
            name: nil,
            tool_calls: nil
          )
          end

          sig do
            override.returns(
              {
                role:
                  Braintrust::FunctionInvokeParams::Message::Assistant::Role::OrSymbol,
                content: T.nilable(String),
                function_call:
                  T.nilable(
                    Braintrust::FunctionInvokeParams::Message::Assistant::FunctionCall
                  ),
                name: T.nilable(String),
                tool_calls:
                  T.nilable(T::Array[Braintrust::ChatCompletionMessageToolCall])
              }
            )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::FunctionInvokeParams::Message::Assistant::Role
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ASSISTANT =
              T.let(
                :assistant,
                Braintrust::FunctionInvokeParams::Message::Assistant::Role::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionInvokeParams::Message::Assistant::Role::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class FunctionCall < Braintrust::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Braintrust::FunctionInvokeParams::Message::Assistant::FunctionCall,
                  Braintrust::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :arguments

            sig { returns(String) }
            attr_accessor :name

            sig do
              params(arguments: String, name: String).returns(T.attached_class)
            end
            def self.new(arguments:, name:)
            end

            sig { override.returns({ arguments: String, name: String }) }
            def to_hash
            end
          end
        end

        class Tool < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::FunctionInvokeParams::Message::Tool,
                Braintrust::Internal::AnyHash
              )
            end

          sig do
            returns(
              Braintrust::FunctionInvokeParams::Message::Tool::Role::OrSymbol
            )
          end
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
              role:
                Braintrust::FunctionInvokeParams::Message::Tool::Role::OrSymbol,
              content: String,
              tool_call_id: String
            ).returns(T.attached_class)
          end
          def self.new(role:, content: nil, tool_call_id: nil)
          end

          sig do
            override.returns(
              {
                role:
                  Braintrust::FunctionInvokeParams::Message::Tool::Role::OrSymbol,
                content: String,
                tool_call_id: String
              }
            )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::FunctionInvokeParams::Message::Tool::Role
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TOOL =
              T.let(
                :tool,
                Braintrust::FunctionInvokeParams::Message::Tool::Role::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionInvokeParams::Message::Tool::Role::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Function < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::FunctionInvokeParams::Message::Function,
                Braintrust::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :name

          sig do
            returns(
              Braintrust::FunctionInvokeParams::Message::Function::Role::OrSymbol
            )
          end
          attr_accessor :role

          sig { returns(T.nilable(String)) }
          attr_reader :content

          sig { params(content: String).void }
          attr_writer :content

          sig do
            params(
              name: String,
              role:
                Braintrust::FunctionInvokeParams::Message::Function::Role::OrSymbol,
              content: String
            ).returns(T.attached_class)
          end
          def self.new(name:, role:, content: nil)
          end

          sig do
            override.returns(
              {
                name: String,
                role:
                  Braintrust::FunctionInvokeParams::Message::Function::Role::OrSymbol,
                content: String
              }
            )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::FunctionInvokeParams::Message::Function::Role
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FUNCTION =
              T.let(
                :function,
                Braintrust::FunctionInvokeParams::Message::Function::Role::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionInvokeParams::Message::Function::Role::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Fallback < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::FunctionInvokeParams::Message::Fallback,
                Braintrust::Internal::AnyHash
              )
            end

          sig do
            returns(
              Braintrust::FunctionInvokeParams::Message::Fallback::Role::OrSymbol
            )
          end
          attr_accessor :role

          sig { returns(T.nilable(String)) }
          attr_accessor :content

          sig do
            params(
              role:
                Braintrust::FunctionInvokeParams::Message::Fallback::Role::OrSymbol,
              content: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(role:, content: nil)
          end

          sig do
            override.returns(
              {
                role:
                  Braintrust::FunctionInvokeParams::Message::Fallback::Role::OrSymbol,
                content: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          module Role
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::FunctionInvokeParams::Message::Fallback::Role
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MODEL =
              T.let(
                :model,
                Braintrust::FunctionInvokeParams::Message::Fallback::Role::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionInvokeParams::Message::Fallback::Role::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::FunctionInvokeParams::Message::Variants]
          )
        end
        def self.variants
        end
      end

      # The mode format of the returned value (defaults to 'auto')
      module Mode
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Braintrust::FunctionInvokeParams::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO =
          T.let(:auto, Braintrust::FunctionInvokeParams::Mode::TaggedSymbol)
        PARALLEL =
          T.let(:parallel, Braintrust::FunctionInvokeParams::Mode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Braintrust::FunctionInvokeParams::Mode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Options for tracing the function call
      module Parent
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::FunctionInvokeParams::Parent::SpanParentStruct,
              String
            )
          end

        class SpanParentStruct < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::FunctionInvokeParams::Parent::SpanParentStruct,
                Braintrust::Internal::AnyHash
              )
            end

          # The id of the container object you are logging to
          sig { returns(String) }
          attr_accessor :object_id_

          sig do
            returns(
              Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::OrSymbol
            )
          end
          attr_accessor :object_type

          # Include these properties in every span created under this parent
          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
          attr_accessor :propagated_event

          # Identifiers for the row to to log a subspan under
          sig do
            returns(
              T.nilable(
                Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs
              )
            )
          end
          attr_reader :row_ids

          sig do
            params(
              row_ids:
                T.nilable(
                  Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs::OrHash
                )
            ).void
          end
          attr_writer :row_ids

          # Span parent properties
          sig do
            params(
              object_id_: String,
              object_type:
                Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::OrSymbol,
              propagated_event:
                T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              row_ids:
                T.nilable(
                  Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The id of the container object you are logging to
            object_id_:,
            object_type:,
            # Include these properties in every span created under this parent
            propagated_event: nil,
            # Identifiers for the row to to log a subspan under
            row_ids: nil
          )
          end

          sig do
            override.returns(
              {
                object_id_: String,
                object_type:
                  Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::OrSymbol,
                propagated_event:
                  T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
                row_ids:
                  T.nilable(
                    Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs
                  )
              }
            )
          end
          def to_hash
          end

          module ObjectType
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PROJECT_LOGS =
              T.let(
                :project_logs,
                Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )
            EXPERIMENT =
              T.let(
                :experiment,
                Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )
            PLAYGROUND_LOGS =
              T.let(
                :playground_logs,
                Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class RowIDs < Braintrust::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs,
                  Braintrust::Internal::AnyHash
                )
              end

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
            sig do
              params(id: String, root_span_id: String, span_id: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The id of the row
              id:,
              # The root_span_id of the row
              root_span_id:,
              # The span_id of the row
              span_id:
            )
            end

            sig do
              override.returns(
                { id: String, root_span_id: String, span_id: String }
              )
            end
            def to_hash
            end
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::FunctionInvokeParams::Parent::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
