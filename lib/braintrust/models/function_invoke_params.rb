# frozen_string_literal: true

module Braintrust
  module Models
    class FunctionInvokeParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute [r] input
      #   Argument to the function, which can be any JSON serializable value
      #
      #   @return [Object, nil]
      optional :input, Braintrust::Unknown

      # @!parse
      #   # @return [Object]
      #   attr_writer :input

      # @!attribute [r] messages
      #   If the function is an LLM, additional messages to pass along to it
      #
      #   @return [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>, nil]
      optional :messages, -> { Braintrust::ArrayOf[union: Braintrust::Models::FunctionInvokeParams::Message] }

      # @!parse
      #   # @return [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>]
      #   attr_writer :messages

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
      optional :stream, Braintrust::BooleanModel, nil?: true

      # @!attribute [r] version
      #   The version of the function
      #
      #   @return [String, nil]
      optional :version, String

      # @!parse
      #   # @return [String]
      #   attr_writer :version

      # @!parse
      #   # @param input [Object]
      #   # @param messages [Array<Braintrust::Models::FunctionInvokeParams::Message::System, Braintrust::Models::FunctionInvokeParams::Message::User, Braintrust::Models::FunctionInvokeParams::Message::Assistant, Braintrust::Models::FunctionInvokeParams::Message::Tool, Braintrust::Models::FunctionInvokeParams::Message::Function, Braintrust::Models::FunctionInvokeParams::Message::Fallback>]
      #   # @param mode [Symbol, Braintrust::Models::FunctionInvokeParams::Mode, nil]
      #   # @param parent [Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct, String]
      #   # @param stream [Boolean, nil]
      #   # @param version [String]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(input: nil, messages: nil, mode: nil, parent: nil, stream: nil, version: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # @example
      # ```ruby
      # case message
      # in Braintrust::Models::FunctionInvokeParams::Message::System
      #   # ...
      # in Braintrust::Models::FunctionInvokeParams::Message::User
      #   # ...
      # in Braintrust::Models::FunctionInvokeParams::Message::Assistant
      #   # ...
      # in Braintrust::Models::FunctionInvokeParams::Message::Tool
      #   # ...
      # in Braintrust::Models::FunctionInvokeParams::Message::Function
      #   # ...
      # in Braintrust::Models::FunctionInvokeParams::Message::Fallback
      #   # ...
      # end
      # ```
      class Message < Braintrust::Union
        variant -> { Braintrust::Models::FunctionInvokeParams::Message::System }

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::User }

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::Assistant }

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::Tool }

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::Function }

        variant -> { Braintrust::Models::FunctionInvokeParams::Message::Fallback }

        class System < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          # @abstract
          #
          # @example
          # ```ruby
          # case role
          # in :system
          #   # ...
          # end
          # ```
          class Role < Braintrust::Enum
            SYSTEM = :system

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   #
            #   def self.values; end
          end
        end

        class User < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          # @abstract
          #
          # @example
          # ```ruby
          # case role
          # in :user
          #   # ...
          # end
          # ```
          class Role < Braintrust::Enum
            USER = :user

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   #
            #   def self.values; end
          end

          # @abstract
          #
          # @example
          # ```ruby
          # case content
          # in String
          #   # ...
          # in Braintrust::Models::FunctionInvokeParams::Message::User::Content::Nested2DArray
          #   # ...
          # end
          # ```
          class Content < Braintrust::Union
            Nested2DArray = Braintrust::ArrayOf[union: -> { Braintrust::Models::FunctionInvokeParams::Message::User::Content::Array }]

            variant String

            variant Braintrust::Models::FunctionInvokeParams::Message::User::Content::Nested2DArray

            # @abstract
            #
            # @example
            # ```ruby
            # case array
            # in Braintrust::Models::ChatCompletionContentPartText
            #   # ...
            # in Braintrust::Models::ChatCompletionContentPartImage
            #   # ...
            # end
            # ```
            class Array < Braintrust::Union
              variant -> { Braintrust::Models::ChatCompletionContentPartText }

              variant -> { Braintrust::Models::ChatCompletionContentPartImage }
            end
          end
        end

        class Assistant < Braintrust::BaseModel
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
                   -> { Braintrust::ArrayOf[Braintrust::Models::ChatCompletionMessageToolCall] },
                   nil?: true

          # @!parse
          #   # @param role [Symbol, Braintrust::Models::FunctionInvokeParams::Message::Assistant::Role]
          #   # @param content [String, nil]
          #   # @param function_call [Braintrust::Models::FunctionInvokeParams::Message::Assistant::FunctionCall, nil]
          #   # @param name [String, nil]
          #   # @param tool_calls [Array<Braintrust::Models::ChatCompletionMessageToolCall>, nil]
          #   #
          #   def initialize(role:, content: nil, function_call: nil, name: nil, tool_calls: nil, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          # @abstract
          #
          # @example
          # ```ruby
          # case role
          # in :assistant
          #   # ...
          # end
          # ```
          class Role < Braintrust::Enum
            ASSISTANT = :assistant

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   #
            #   def self.values; end
          end

          class FunctionCall < Braintrust::BaseModel
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

            # def initialize: (Hash | Braintrust::BaseModel) -> void
          end
        end

        class Tool < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          # @abstract
          #
          # @example
          # ```ruby
          # case role
          # in :tool
          #   # ...
          # end
          # ```
          class Role < Braintrust::Enum
            TOOL = :tool

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   #
            #   def self.values; end
          end
        end

        class Function < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          # @abstract
          #
          # @example
          # ```ruby
          # case role
          # in :function
          #   # ...
          # end
          # ```
          class Role < Braintrust::Enum
            FUNCTION = :function

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   #
            #   def self.values; end
          end
        end

        class Fallback < Braintrust::BaseModel
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

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          # @abstract
          #
          # @example
          # ```ruby
          # case role
          # in :model
          #   # ...
          # end
          # ```
          class Role < Braintrust::Enum
            MODEL = :model

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   #
            #   def self.values; end
          end
        end
      end

      # @abstract
      #
      # The mode format of the returned value (defaults to 'auto')
      #
      # @example
      # ```ruby
      # case mode
      # in :auto
      #   # ...
      # in :parallel
      #   # ...
      # end
      # ```
      class Mode < Braintrust::Enum
        AUTO = :auto
        PARALLEL = :parallel

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end

      # @abstract
      #
      # Options for tracing the function call
      #
      # @example
      # ```ruby
      # case parent
      # in Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct
      #   # ...
      # in String
      #   # ...
      # end
      # ```
      class Parent < Braintrust::Union
        # Span parent properties
        variant -> { Braintrust::Models::FunctionInvokeParams::Parent::SpanParentStruct }

        # The parent's span identifier, created by calling `.export()` on a span
        variant String

        class SpanParentStruct < Braintrust::BaseModel
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
          optional :propagated_event, Braintrust::HashOf[Braintrust::Unknown, nil?: true], nil?: true

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

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          # @abstract
          #
          # @example
          # ```ruby
          # case object_type
          # in :project_logs
          #   # ...
          # in :experiment
          #   # ...
          # end
          # ```
          class ObjectType < Braintrust::Enum
            PROJECT_LOGS = :project_logs
            EXPERIMENT = :experiment

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   #
            #   def self.values; end
          end

          class RowIDs < Braintrust::BaseModel
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

            # def initialize: (Hash | Braintrust::BaseModel) -> void
          end
        end
      end
    end
  end
end
