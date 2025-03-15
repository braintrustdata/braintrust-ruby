# frozen_string_literal: true

module Braintrust
  module Models
    class FunctionReplaceParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute function_data
      #
      #   @return [Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt, Braintrust::Models::FunctionReplaceParams::FunctionData::Code, Braintrust::Models::FunctionReplaceParams::FunctionData::Global]
      required :function_data, union: -> { Braintrust::Models::FunctionReplaceParams::FunctionData }

      # @!attribute name
      #   Name of the prompt
      #
      #   @return [String]
      required :name, String

      # @!attribute project_id
      #   Unique identifier for the project that the prompt belongs under
      #
      #   @return [String]
      required :project_id, String

      # @!attribute slug
      #   Unique identifier for the prompt
      #
      #   @return [String]
      required :slug, String

      # @!attribute description
      #   Textual description of the prompt
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute function_schema
      #   JSON schema for the function's parameters and return type
      #
      #   @return [Braintrust::Models::FunctionReplaceParams::FunctionSchema, nil]
      optional :function_schema, -> { Braintrust::Models::FunctionReplaceParams::FunctionSchema }, nil?: true

      # @!attribute function_type
      #
      #   @return [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionType, nil]
      optional :function_type, enum: -> { Braintrust::Models::FunctionReplaceParams::FunctionType }, nil?: true

      # @!attribute origin
      #
      #   @return [Braintrust::Models::FunctionReplaceParams::Origin, nil]
      optional :origin, -> { Braintrust::Models::FunctionReplaceParams::Origin }, nil?: true

      # @!attribute prompt_data
      #   The prompt, model, and its parameters
      #
      #   @return [Braintrust::Models::PromptData, nil]
      optional :prompt_data, -> { Braintrust::Models::PromptData }, nil?: true

      # @!attribute tags
      #   A list of tags for the prompt
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::ArrayOf[String], nil?: true

      # @!parse
      #   # @param function_data [Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt, Braintrust::Models::FunctionReplaceParams::FunctionData::Code, Braintrust::Models::FunctionReplaceParams::FunctionData::Global]
      #   # @param name [String]
      #   # @param project_id [String]
      #   # @param slug [String]
      #   # @param description [String, nil]
      #   # @param function_schema [Braintrust::Models::FunctionReplaceParams::FunctionSchema, nil]
      #   # @param function_type [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionType, nil]
      #   # @param origin [Braintrust::Models::FunctionReplaceParams::Origin, nil]
      #   # @param prompt_data [Braintrust::Models::PromptData, nil]
      #   # @param tags [Array<String>, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     function_data:,
      #     name:,
      #     project_id:,
      #     slug:,
      #     description: nil,
      #     function_schema: nil,
      #     function_type: nil,
      #     origin: nil,
      #     prompt_data: nil,
      #     tags: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      class FunctionData < Braintrust::Union
        variant -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt }

        variant -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Code }

        variant -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Global }

        class Prompt < Braintrust::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt::Type]
          required :type, enum: -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt::Type }

          # @!parse
          #   # @param type [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt::Type]
          #   #
          #   def initialize(type:, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          # @abstract
          class Type < Braintrust::Enum
            PROMPT = :prompt

            finalize!
          end
        end

        class Code < Braintrust::BaseModel
          # @!attribute data
          #
          #   @return [Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline]
          required :data, union: -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data }

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Type]
          required :type, enum: -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Type }

          # @!parse
          #   # @param data [Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline]
          #   # @param type [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Type]
          #   #
          #   def initialize(data:, type:, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          # @abstract
          class Data < Braintrust::Union
            variant -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle }

            variant -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline }

            class Bundle < Braintrust::Models::CodeBundle
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type]
              required :type,
                       enum: -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type }

              # @!parse
              #   # @param type [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type]
              #   #
              #   def initialize(type:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void

              # @abstract
              class Type < Braintrust::Enum
                BUNDLE = :bundle

                finalize!
              end
            end

            class Inline < Braintrust::BaseModel
              # @!attribute code
              #
              #   @return [String]
              required :code, String

              # @!attribute runtime_context
              #
              #   @return [Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext]
              required :runtime_context,
                       -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext }

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type]
              required :type,
                       enum: -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type }

              # @!parse
              #   # @param code [String]
              #   # @param runtime_context [Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext]
              #   # @param type [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type]
              #   #
              #   def initialize(code:, runtime_context:, type:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void

              class RuntimeContext < Braintrust::BaseModel
                # @!attribute runtime
                #
                #   @return [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                required :runtime,
                         enum: -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime }

                # @!attribute version
                #
                #   @return [String]
                required :version, String

                # @!parse
                #   # @param runtime [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                #   # @param version [String]
                #   #
                #   def initialize(runtime:, version:, **) = super

                # def initialize: (Hash | Braintrust::BaseModel) -> void

                # @abstract
                class Runtime < Braintrust::Enum
                  NODE = :node
                  PYTHON = :python

                  finalize!
                end
              end

              # @abstract
              class Type < Braintrust::Enum
                INLINE = :inline

                finalize!
              end
            end

            # @!parse
            #   class << self
            #     # @return [Array(Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionReplaceParams::FunctionData::Code::Data::Inline)]
            #     def variants; end
            #   end
          end

          # @abstract
          class Type < Braintrust::Enum
            CODE = :code

            finalize!
          end
        end

        class Global < Braintrust::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Global::Type]
          required :type, enum: -> { Braintrust::Models::FunctionReplaceParams::FunctionData::Global::Type }

          # @!parse
          #   # @param name [String]
          #   # @param type [Symbol, Braintrust::Models::FunctionReplaceParams::FunctionData::Global::Type]
          #   #
          #   def initialize(name:, type:, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          # @abstract
          class Type < Braintrust::Enum
            GLOBAL = :global

            finalize!
          end
        end

        # @!parse
        #   class << self
        #     # @return [Array(Braintrust::Models::FunctionReplaceParams::FunctionData::Prompt, Braintrust::Models::FunctionReplaceParams::FunctionData::Code, Braintrust::Models::FunctionReplaceParams::FunctionData::Global)]
        #     def variants; end
        #   end
      end

      class FunctionSchema < Braintrust::BaseModel
        # @!attribute [r] parameters
        #
        #   @return [Object, nil]
        optional :parameters, Braintrust::Unknown

        # @!parse
        #   # @return [Object]
        #   attr_writer :parameters

        # @!attribute [r] returns
        #
        #   @return [Object, nil]
        optional :returns, Braintrust::Unknown

        # @!parse
        #   # @return [Object]
        #   attr_writer :returns

        # @!parse
        #   # JSON schema for the function's parameters and return type
        #   #
        #   # @param parameters [Object]
        #   # @param returns [Object]
        #   #
        #   def initialize(parameters: nil, returns: nil, **) = super

        # def initialize: (Hash | Braintrust::BaseModel) -> void
      end

      # @abstract
      class FunctionType < Braintrust::Enum
        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool

        finalize!
      end

      class Origin < Braintrust::BaseModel
        # @!attribute object_id_
        #   Id of the object the function is originating from
        #
        #   @return [String]
        required :object_id_, String, api_name: :object_id

        # @!attribute object_type
        #   The object type that the ACL applies to
        #
        #   @return [Symbol, Braintrust::Models::ACLObjectType]
        required :object_type, enum: -> { Braintrust::Models::ACLObjectType }

        # @!attribute internal
        #   The function exists for internal purposes and should not be displayed in the
        #     list of functions.
        #
        #   @return [Boolean, nil]
        optional :internal, Braintrust::BooleanModel, nil?: true

        # @!parse
        #   # @param object_id_ [String]
        #   # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
        #   # @param internal [Boolean, nil]
        #   #
        #   def initialize(object_id_:, object_type:, internal: nil, **) = super

        # def initialize: (Hash | Braintrust::BaseModel) -> void
      end
    end
  end
end
