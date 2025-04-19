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
      #   @return [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>, nil]
      optional :messages,
               -> { Braintrust::Internal::Type::ArrayOf[union: Braintrust::Models::FunctionInvokeParams::Message] }

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
      #   @return [Symbol, Braintrust::Models::FunctionInvokeParams::Mode, nil]
      optional :mode, enum: -> { Braintrust::Models::FunctionInvokeParams::Mode }, nil?: true

      # @!attribute parent
      #   Options for tracing the function call
      #
      #   @return [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String, nil]
      optional :parent, union: -> { Braintrust::Models::FunctionInvokeParams::Parent }

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
      #   @param expected [Object]
      #   @param input [Object]
      #   @param messages [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>]
      #   @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   @param mode [Symbol, Braintrust::Models::FunctionInvokeParams::Mode, nil]
      #   @param parent [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String]
      #   @param stream [Boolean, nil]
      #   @param version [String]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      module Message
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::System }

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::User }

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::Assistant }

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::Tool }

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::Function }

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::Fallback }

        class System < Braintrust::Internal::Type::BaseModel
          # @!attribute role
          #
          #   @return [Symbol, Braintrust::Models::FunctionInvokeParams::Message::System::Role]
          required :role, enum: -> { Braintrust::Models::FunctionInvokeParams::Message::System::Role }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(role:, content: nil, name: nil)
          #   @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::System::Role]
          #   @param content [String]
          #   @param name [String]

          # @see Braintrust::Models::FunctionInvokeParams::Message::System#role
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
          #   @return [Symbol, Braintrust::Models::FunctionInvokeParams::Message::User::Role]
          required :role, enum: -> { Braintrust::Models::FunctionInvokeParams::Message::User::Role }

          # @!attribute content
          #
          #   @return [String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>, nil]
          optional :content, union: -> { Braintrust::Models::FunctionInvokeParams::Message::User::Content }

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(role:, content: nil, name: nil)
          #   @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::User::Role]
          #   @param content [String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>]
          #   @param name [String]

          # @see Braintrust::Models::FunctionInvokeParams::Message::User#role
          module Role
            extend Braintrust::Internal::Type::Enum

            USER = :user

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Braintrust::Models::FunctionInvokeParams::Message::User#content
          module Content
            extend Braintrust::Internal::Type::Union

            variant String

            variant -> { Braintrust::Models::FunctionInvokeParams::Message::User::Content::Nested2DArray }

            module Array
              extend Braintrust::Internal::Type::Union

              variant -> { Braintrust::Models::ChatCompletionContentPartText }

              variant -> { Braintrust::Models::ChatCompletionContentPartImage }

              # @!method self.variants
              #   @return [Array(Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage)]
            end

            # @!method self.variants
            #   @return [Array(String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>)]

            Nested2DArray =
              Braintrust::Internal::Type::ArrayOf[union: -> { Braintrust::Models::FunctionInvokeParams::Message::User::Content::Array }]
          end
        end

        class Assistant < Braintrust::Internal::Type::BaseModel
          # @!attribute role
          #
          #   @return [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role]
          required :role, enum: -> { Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!attribute function_call
          #
          #   @return [Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall, nil]
          optional :function_call,
                   -> { Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall },
                   nil?: true

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!attribute tool_calls
          #
          #   @return [Array<Braintrust::Models::ChatCompletionMessageToolCall>, nil]
          optional :tool_calls,
                   -> { Braintrust::Internal::Type::ArrayOf[Braintrust::Models::ChatCompletionMessageToolCall] },
                   nil?: true

          # @!method initialize(role:, content: nil, function_call: nil, name: nil, tool_calls: nil)
          #   @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role]
          #   @param content [String, nil]
          #   @param function_call [Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall, nil]
          #   @param name [String, nil]
          #   @param tool_calls [Array<Braintrust::Models::ChatCompletionMessageToolCall>, nil]

          # @see Braintrust::Models::FunctionInvokeParams::Message::Assistant#role
          module Role
            extend Braintrust::Internal::Type::Enum

            ASSISTANT = :assistant

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Braintrust::Models::FunctionInvokeParams::Message::Assistant#function_call
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
          #   @return [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Tool::Role]
          required :role, enum: -> { Braintrust::Models::FunctionInvokeParams::Message::Tool::Role }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String

          # @!attribute tool_call_id
          #
          #   @return [String, nil]
          optional :tool_call_id, String

          # @!method initialize(role:, content: nil, tool_call_id: nil)
          #   @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Tool::Role]
          #   @param content [String]
          #   @param tool_call_id [String]

          # @see Braintrust::Models::FunctionInvokeParams::Message::Tool#role
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
          #   @return [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Function::Role]
          required :role, enum: -> { Braintrust::Models::FunctionInvokeParams::Message::Function::Role }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String

          # @!method initialize(name:, role:, content: nil)
          #   @param name [String]
          #   @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Function::Role]
          #   @param content [String]

          # @see Braintrust::Models::FunctionInvokeParams::Message::Function#role
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
          #   @return [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role]
          required :role, enum: -> { Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role }

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!method initialize(role:, content: nil)
          #   @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role]
          #   @param content [String, nil]

          # @see Braintrust::Models::FunctionInvokeParams::Message::Fallback#role
          module Role
            extend Braintrust::Internal::Type::Enum

            MODEL = :model

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback)]
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
        variant -> { Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct }

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
          #   @return [Symbol, Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType]
          required :object_type,
                   enum: -> { Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType }

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
          #   @return [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs, nil]
          optional :row_ids,
                   -> { Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs },
                   nil?: true

          # @!method initialize(object_id_:, object_type:, propagated_event: nil, row_ids: nil)
          #   Span parent properties
          #
          #   @param object_id_ [String]
          #   @param object_type [Symbol, Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType]
          #   @param propagated_event [Hash{Symbol=>Object, nil}, nil]
          #   @param row_ids [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs, nil]

          # @see Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct#object_type
          module ObjectType
            extend Braintrust::Internal::Type::Enum

            PROJECT_LOGS = :project_logs
            EXPERIMENT = :experiment
            PLAYGROUND_LOGS = :playground_logs

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct#row_ids
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
            #   @param id [String]
            #   @param root_span_id [String]
            #   @param span_id [String]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String)]
      end
    end
  end
end
