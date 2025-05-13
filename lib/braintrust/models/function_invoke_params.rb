# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Functions#invoke
    class FunctionInvokeParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute expected
      #   The expected output of the function
      #
      #   @return [Object, nil]
      optional :expected, Braintrust::Internal::Type::Unknown

      # @!attribute input
      #   Argument to the function, which can be any JSON serializable value
      #
      #   @return [Object, nil]
      optional :input, Braintrust::Internal::Type::Unknown

      # @!attribute messages
      #   If the function is an LLM, additional messages to pass along to it
      #
      #   @return [Array<Braintrust::FunctionInvokeParams::Message::System, Braintrust::FunctionInvokeParams::Message::User, Braintrust::FunctionInvokeParams::Message::Assistant, Braintrust::FunctionInvokeParams::Message::Tool, Braintrust::FunctionInvokeParams::Message::Function, Braintrust::FunctionInvokeParams::Message::Fallback>, nil]
      optional :messages,
               -> { Braintrust::Internal::Type::ArrayOf[union: Braintrust::FunctionInvokeParams::Message] }

      # @!attribute metadata
      #   Any relevant metadata
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute mode
      #   The mode format of the returned value (defaults to 'auto')
      #
      #   @return [Symbol, Braintrust::FunctionInvokeParams::Mode, nil]
      optional :mode, enum: -> { Braintrust::FunctionInvokeParams::Mode }, nil?: true

      # @!attribute parent
      #   Options for tracing the function call
      #
      #   @return [Braintrust::FunctionInvokeParams::Parent::SpanParentStruct, String, nil]
      optional :parent, union: -> { Braintrust::FunctionInvokeParams::Parent }

      # @!attribute stream
      #   Whether to stream the response. If true, results will be returned in the
      #   Braintrust SSE format.
      #
      #   @return [Boolean, nil]
      optional :stream, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute version
      #   The version of the function
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(expected: nil, input: nil, messages: nil, metadata: nil, mode: nil, parent: nil, stream: nil, version: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::FunctionInvokeParams} for more details.
      #
      #   @param expected [Object] The expected output of the function
      #
      #   @param input [Object] Argument to the function, which can be any JSON serializable value
      #
      #   @param messages [Array<Braintrust::FunctionInvokeParams::Message::System, Braintrust::FunctionInvokeParams::Message::User, Braintrust::FunctionInvokeParams::Message::Assistant, Braintrust::FunctionInvokeParams::Message::Tool, Braintrust::FunctionInvokeParams::Message::Function, Braintrust::FunctionInvokeParams::Message::Fallback>] If the function is an LLM, additional messages to pass along to it
      #
      #   @param metadata [Hash{Symbol=>Object, nil}, nil] Any relevant metadata
      #
      #   @param mode [Symbol, Braintrust::FunctionInvokeParams::Mode, nil] The mode format of the returned value (defaults to 'auto')
      #
      #   @param parent [Braintrust::FunctionInvokeParams::Parent::SpanParentStruct, String] Options for tracing the function call
      #
      #   @param stream [Boolean, nil] Whether to stream the response. If true, results will be returned in the Braintr
      #
      #   @param version [String] The version of the function
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      module Message
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::FunctionInvokeParams::Message::System }

        variant -> { Braintrust::FunctionInvokeParams::Message::User }

        variant -> { Braintrust::FunctionInvokeParams::Message::Assistant }

        variant -> { Braintrust::FunctionInvokeParams::Message::Tool }

        variant -> { Braintrust::FunctionInvokeParams::Message::Function }

        variant -> { Braintrust::FunctionInvokeParams::Message::Fallback }

        class System < Braintrust::Internal::Type::BaseModel
          # @!attribute role
          #
          #   @return [Symbol, Braintrust::FunctionInvokeParams::Message::System::Role]
          required :role, enum: -> { Braintrust::FunctionInvokeParams::Message::System::Role }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(role:, content: nil, name: nil)
          #   @param role [Symbol, Braintrust::FunctionInvokeParams::Message::System::Role]
          #   @param content [String]
          #   @param name [String]

          # @see Braintrust::FunctionInvokeParams::Message::System#role
          module Role
            extend Braintrust::Internal::Type::Enum

            SYSTEM = :system

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class User < Braintrust::Internal::Type::BaseModel
          # @!attribute role
          #
          #   @return [Symbol, Braintrust::FunctionInvokeParams::Message::User::Role]
          required :role, enum: -> { Braintrust::FunctionInvokeParams::Message::User::Role }

          # @!attribute content
          #
          #   @return [String, Array<Braintrust::ChatCompletionContentPartText, Braintrust::ChatCompletionContentPartImage>, nil]
          optional :content, union: -> { Braintrust::FunctionInvokeParams::Message::User::Content }

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(role:, content: nil, name: nil)
          #   @param role [Symbol, Braintrust::FunctionInvokeParams::Message::User::Role]
          #   @param content [String, Array<Braintrust::ChatCompletionContentPartText, Braintrust::ChatCompletionContentPartImage>]
          #   @param name [String]

          # @see Braintrust::FunctionInvokeParams::Message::User#role
          module Role
            extend Braintrust::Internal::Type::Enum

            USER = :user

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Braintrust::FunctionInvokeParams::Message::User#content
          module Content
            extend Braintrust::Internal::Type::Union

            variant String

            variant -> { Braintrust::FunctionInvokeParams::Message::User::Content::Nested2DArray }

            module Array
              extend Braintrust::Internal::Type::Union

              variant -> { Braintrust::ChatCompletionContentPartText }

              variant -> { Braintrust::ChatCompletionContentPartImage }

              # @!method self.variants
              #   @return [Array(Braintrust::ChatCompletionContentPartText, Braintrust::ChatCompletionContentPartImage)]

              define_sorbet_constant!(:Variants) do
                T.type_alias do
                  T.any(Braintrust::ChatCompletionContentPartText, Braintrust::ChatCompletionContentPartImage)
                end
              end
            end

            # @!method self.variants
            #   @return [Array(String, Array<Braintrust::ChatCompletionContentPartText, Braintrust::ChatCompletionContentPartImage>)]

            define_sorbet_constant!(:Variants) do
              T.type_alias do
                T.any(
                  String,
                  T::Array[T.any(
                    Braintrust::ChatCompletionContentPartText,
                    Braintrust::ChatCompletionContentPartImage
                  )]
                )
              end
            end

            # @type [Braintrust::Internal::Type::Converter]
            Nested2DArray =
              Braintrust::Internal::Type::ArrayOf[union: -> {
                Braintrust::FunctionInvokeParams::Message::User::Content::Array
              }]
          end
        end

        class Assistant < Braintrust::Internal::Type::BaseModel
          # @!attribute role
          #
          #   @return [Symbol, Braintrust::FunctionInvokeParams::Message::Assistant::Role]
          required :role, enum: -> { Braintrust::FunctionInvokeParams::Message::Assistant::Role }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!attribute function_call
          #
          #   @return [Braintrust::FunctionInvokeParams::Message::Assistant::FunctionCall, nil]
          optional :function_call,
                   -> { Braintrust::FunctionInvokeParams::Message::Assistant::FunctionCall },
                   nil?: true

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!attribute tool_calls
          #
          #   @return [Array<Braintrust::ChatCompletionMessageToolCall>, nil]
          optional :tool_calls,
                   -> { Braintrust::Internal::Type::ArrayOf[Braintrust::ChatCompletionMessageToolCall] },
                   nil?: true

          # @!method initialize(role:, content: nil, function_call: nil, name: nil, tool_calls: nil)
          #   @param role [Symbol, Braintrust::FunctionInvokeParams::Message::Assistant::Role]
          #   @param content [String, nil]
          #   @param function_call [Braintrust::FunctionInvokeParams::Message::Assistant::FunctionCall, nil]
          #   @param name [String, nil]
          #   @param tool_calls [Array<Braintrust::ChatCompletionMessageToolCall>, nil]

          # @see Braintrust::FunctionInvokeParams::Message::Assistant#role
          module Role
            extend Braintrust::Internal::Type::Enum

            ASSISTANT = :assistant

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Braintrust::FunctionInvokeParams::Message::Assistant#function_call
          class FunctionCall < Braintrust::Internal::Type::BaseModel
            # @!attribute arguments
            #
            #   @return [String]
            required :arguments, String

            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!method initialize(arguments:, name:)
            #   @param arguments [String]
            #   @param name [String]
          end
        end

        class Tool < Braintrust::Internal::Type::BaseModel
          # @!attribute role
          #
          #   @return [Symbol, Braintrust::FunctionInvokeParams::Message::Tool::Role]
          required :role, enum: -> { Braintrust::FunctionInvokeParams::Message::Tool::Role }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String

          # @!attribute tool_call_id
          #
          #   @return [String, nil]
          optional :tool_call_id, String

          # @!method initialize(role:, content: nil, tool_call_id: nil)
          #   @param role [Symbol, Braintrust::FunctionInvokeParams::Message::Tool::Role]
          #   @param content [String]
          #   @param tool_call_id [String]

          # @see Braintrust::FunctionInvokeParams::Message::Tool#role
          module Role
            extend Braintrust::Internal::Type::Enum

            TOOL = :tool

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Function < Braintrust::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute role
          #
          #   @return [Symbol, Braintrust::FunctionInvokeParams::Message::Function::Role]
          required :role, enum: -> { Braintrust::FunctionInvokeParams::Message::Function::Role }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String

          # @!method initialize(name:, role:, content: nil)
          #   @param name [String]
          #   @param role [Symbol, Braintrust::FunctionInvokeParams::Message::Function::Role]
          #   @param content [String]

          # @see Braintrust::FunctionInvokeParams::Message::Function#role
          module Role
            extend Braintrust::Internal::Type::Enum

            FUNCTION = :function

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Fallback < Braintrust::Internal::Type::BaseModel
          # @!attribute role
          #
          #   @return [Symbol, Braintrust::FunctionInvokeParams::Message::Fallback::Role]
          required :role, enum: -> { Braintrust::FunctionInvokeParams::Message::Fallback::Role }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!method initialize(role:, content: nil)
          #   @param role [Symbol, Braintrust::FunctionInvokeParams::Message::Fallback::Role]
          #   @param content [String, nil]

          # @see Braintrust::FunctionInvokeParams::Message::Fallback#role
          module Role
            extend Braintrust::Internal::Type::Enum

            MODEL = :model

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::FunctionInvokeParams::Message::System, Braintrust::FunctionInvokeParams::Message::User, Braintrust::FunctionInvokeParams::Message::Assistant, Braintrust::FunctionInvokeParams::Message::Tool, Braintrust::FunctionInvokeParams::Message::Function, Braintrust::FunctionInvokeParams::Message::Fallback)]

        define_sorbet_constant!(:Variants) do
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
        end
      end

      # The mode format of the returned value (defaults to 'auto')
      module Mode
        extend Braintrust::Internal::Type::Enum

        AUTO = :auto
        PARALLEL = :parallel

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Options for tracing the function call
      module Parent
        extend Braintrust::Internal::Type::Union

        # Span parent properties
        variant -> { Braintrust::FunctionInvokeParams::Parent::SpanParentStruct }

        # The parent's span identifier, created by calling `.export()` on a span
        variant String

        class SpanParentStruct < Braintrust::Internal::Type::BaseModel
          # @!attribute object_id_
          #   The id of the container object you are logging to
          #
          #   @return [String]
          required :object_id_, String, api_name: :object_id

          # @!attribute object_type
          #
          #   @return [Symbol, Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType]
          required :object_type,
                   enum: -> {
                     Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType
                   }

          # @!attribute propagated_event
          #   Include these properties in every span created under this parent
          #
          #   @return [Hash{Symbol=>Object, nil}, nil]
          optional :propagated_event,
                   Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
                   nil?: true

          # @!attribute row_ids
          #   Identifiers for the row to to log a subspan under
          #
          #   @return [Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs, nil]
          optional :row_ids,
                   -> {
                     Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs
                   },
                   nil?: true

          # @!method initialize(object_id_:, object_type:, propagated_event: nil, row_ids: nil)
          #   Span parent properties
          #
          #   @param object_id_ [String] The id of the container object you are logging to
          #
          #   @param object_type [Symbol, Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType]
          #
          #   @param propagated_event [Hash{Symbol=>Object, nil}, nil] Include these properties in every span created under this parent
          #
          #   @param row_ids [Braintrust::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs, nil] Identifiers for the row to to log a subspan under

          # @see Braintrust::FunctionInvokeParams::Parent::SpanParentStruct#object_type
          module ObjectType
            extend Braintrust::Internal::Type::Enum

            PROJECT_LOGS = :project_logs
            EXPERIMENT = :experiment
            PLAYGROUND_LOGS = :playground_logs

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Braintrust::FunctionInvokeParams::Parent::SpanParentStruct#row_ids
          class RowIDs < Braintrust::Internal::Type::BaseModel
            # @!attribute id
            #   The id of the row
            #
            #   @return [String]
            required :id, String

            # @!attribute root_span_id
            #   The root_span_id of the row
            #
            #   @return [String]
            required :root_span_id, String

            # @!attribute span_id
            #   The span_id of the row
            #
            #   @return [String]
            required :span_id, String

            # @!method initialize(id:, root_span_id:, span_id:)
            #   Identifiers for the row to to log a subspan under
            #
            #   @param id [String] The id of the row
            #
            #   @param root_span_id [String] The root_span_id of the row
            #
            #   @param span_id [String] The span_id of the row
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::FunctionInvokeParams::Parent::SpanParentStruct, String)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Braintrust::FunctionInvokeParams::Parent::SpanParentStruct, String) }
        end
      end
    end
  end
end
