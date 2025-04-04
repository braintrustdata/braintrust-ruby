# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Functions#invoke
    class FunctionInvokeParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute [r] expected
      #   The expected output of the function
      #
      #   @return [Object, nil]
      optional :expected, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :expected

      # @!attribute [r] input
      #   Argument to the function, which can be any JSON serializable value
      #
      #   @return [Object, nil]
      optional :input, Braintrust::Internal::Type::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :input

      # @!attribute [r] messages
      #   If the function is an LLM, additional messages to pass along to it
      #
      #   @return [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>, nil]
      optional :messages,
               -> { Braintrust::Internal::Type::ArrayOf[union: Braintrust::Models::FunctionInvokeParams::Message] }

      # @!parse
      #   # @return [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>]
      #   attr_writer :messages

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

      # @!attribute [r] parent
      #   Options for tracing the function call
      #
      #   @return [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String, nil]
      optional :parent, union: -> { Braintrust::Models::FunctionInvokeParams::Parent }

      # @!parse
      #   # @return [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String]
      #   attr_writer :parent

      # @!attribute stream
      #   Whether to stream the response. If true, results will be returned in the
      #     Braintrust SSE format.
      #
      #   @return [Boolean, nil]
      optional :stream, Braintrust::Internal::Type::BooleanModel, nil?: true

      # @!attribute [r] version
      #   The version of the function
      #
      #   @return [String, nil]
      optional :version, String

      # @!parse
      #   # @return [String]
      #   attr_writer :version

      # @!parse
      #   # @param expected [Object]
      #   # @param input [Object]
      #   # @param messages [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>]
      #   # @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   # @param mode [Symbol, Braintrust::Models::FunctionInvokeParams::Mode, nil]
      #   # @param parent [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String]
      #   # @param stream [Boolean, nil]
      #   # @param version [String]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     expected: nil,
      #     input: nil,
      #     messages: nil,
      #     metadata: nil,
      #     mode: nil,
      #     parent: nil,
      #     stream: nil,
      #     version: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

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

          # @!attribute [r] content
          #
          #   @return [String, nil]
          optional :content, String

          # @!parse
          #   # @return [String]
          #   attr_writer :content

          # @!attribute [r] name
          #
          #   @return [String, nil]
          optional :name, String

          # @!parse
          #   # @return [String]
          #   attr_writer :name

          # @!parse
          #   # @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::System::Role]
          #   # @param content [String]
          #   # @param name [String]
          #   #
          #   def initialize(role:, content: nil, name: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::FunctionInvokeParams::Message::System#role
          module Role
            extend Braintrust::Internal::Type::Enum

            SYSTEM = :system

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end

        class User < Braintrust::Internal::Type::BaseModel
          # @!attribute role
          #
          #   @return [Symbol, Braintrust::Models::FunctionInvokeParams::Message::User::Role]
          required :role, enum: -> { Braintrust::Models::FunctionInvokeParams::Message::User::Role }

          # @!attribute [r] content
          #
          #   @return [String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>, nil]
          optional :content, union: -> { Braintrust::Models::FunctionInvokeParams::Message::User::Content }

          # @!parse
          #   # @return [String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>]
          #   attr_writer :content

          # @!attribute [r] name
          #
          #   @return [String, nil]
          optional :name, String

          # @!parse
          #   # @return [String]
          #   attr_writer :name

          # @!parse
          #   # @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::User::Role]
          #   # @param content [String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>]
          #   # @param name [String]
          #   #
          #   def initialize(role:, content: nil, name: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::FunctionInvokeParams::Message::User#role
          module Role
            extend Braintrust::Internal::Type::Enum

            USER = :user

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
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

              # @!parse
              #   # @return [Array(Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage)]
              #   def self.variants; end
            end

            # @!parse
            #   # @return [Array(String, Array<Braintrust::Models::ChatCompletionContentPartText, Braintrust::Models::ChatCompletionContentPartImage>)]
            #   def self.variants; end

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

          # @!parse
          #   # @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role]
          #   # @param content [String, nil]
          #   # @param function_call [Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall, nil]
          #   # @param name [String, nil]
          #   # @param tool_calls [Array<Braintrust::Models::ChatCompletionMessageToolCall>, nil]
          #   #
          #   def initialize(role:, content: nil, function_call: nil, name: nil, tool_calls: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::FunctionInvokeParams::Message::Assistant#role
          module Role
            extend Braintrust::Internal::Type::Enum

            ASSISTANT = :assistant

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
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

            # @!parse
            #   # @param arguments [String]
            #   # @param name [String]
            #   #
            #   def initialize(arguments:, name:, **) = super

            # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
          end
        end

        class Tool < Braintrust::Internal::Type::BaseModel
          # @!attribute role
          #
          #   @return [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Tool::Role]
          required :role, enum: -> { Braintrust::Models::FunctionInvokeParams::Message::Tool::Role }

          # @!attribute [r] content
          #
          #   @return [String, nil]
          optional :content, String

          # @!parse
          #   # @return [String]
          #   attr_writer :content

          # @!attribute [r] tool_call_id
          #
          #   @return [String, nil]
          optional :tool_call_id, String

          # @!parse
          #   # @return [String]
          #   attr_writer :tool_call_id

          # @!parse
          #   # @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Tool::Role]
          #   # @param content [String]
          #   # @param tool_call_id [String]
          #   #
          #   def initialize(role:, content: nil, tool_call_id: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::FunctionInvokeParams::Message::Tool#role
          module Role
            extend Braintrust::Internal::Type::Enum

            TOOL = :tool

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
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

          # @!attribute [r] content
          #
          #   @return [String, nil]
          optional :content, String

          # @!parse
          #   # @return [String]
          #   attr_writer :content

          # @!parse
          #   # @param name [String]
          #   # @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Function::Role]
          #   # @param content [String]
          #   #
          #   def initialize(name:, role:, content: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::FunctionInvokeParams::Message::Function#role
          module Role
            extend Braintrust::Internal::Type::Enum

            FUNCTION = :function

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
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

          # @!parse
          #   # @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Fallback::Role]
          #   # @param content [String, nil]
          #   #
          #   def initialize(role:, content: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::FunctionInvokeParams::Message::Fallback#role
          module Role
            extend Braintrust::Internal::Type::Enum

            MODEL = :model

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end

        # @!parse
        #   # @return [Array(Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback)]
        #   def self.variants; end
      end

      # The mode format of the returned value (defaults to 'auto')
      module Mode
        extend Braintrust::Internal::Type::Enum

        AUTO = :auto
        PARALLEL = :parallel

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
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

          # @!parse
          #   # Span parent properties
          #   #
          #   # @param object_id_ [String]
          #   # @param object_type [Symbol, Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::ObjectType]
          #   # @param propagated_event [Hash{Symbol=>Object, nil}, nil]
          #   # @param row_ids [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct::RowIDs, nil]
          #   #
          #   def initialize(object_id_:, object_type:, propagated_event: nil, row_ids: nil, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct#object_type
          module ObjectType
            extend Braintrust::Internal::Type::Enum

            PROJECT_LOGS = :project_logs
            EXPERIMENT = :experiment
            PLAYGROUND_LOGS = :playground_logs

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
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

            # @!parse
            #   # Identifiers for the row to to log a subspan under
            #   #
            #   # @param id [String]
            #   # @param root_span_id [String]
            #   # @param span_id [String]
            #   #
            #   def initialize(id:, root_span_id:, span_id:, **) = super

            # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
          end
        end

        # @!parse
        #   # @return [Array(Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String)]
        #   def self.variants; end
      end
    end
  end
end
