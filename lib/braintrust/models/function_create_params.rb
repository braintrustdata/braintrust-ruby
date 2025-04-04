# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Functions#create
    class FunctionCreateParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute function_data
      #
      #   @return [Braintrust::Models::FunctionCreateParams::FunctionData::Prompt, Braintrust::Models::FunctionCreateParams::FunctionData::Code, Braintrust::Models::FunctionCreateParams::FunctionData::Global]
      required :function_data, union: -> { Braintrust::Models::FunctionCreateParams::FunctionData }

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
      #   @return [Braintrust::Models::FunctionCreateParams::FunctionSchema, nil]
      optional :function_schema, -> { Braintrust::Models::FunctionCreateParams::FunctionSchema }, nil?: true

      # @!attribute function_type
      #
      #   @return [Symbol, Braintrust::Models::FunctionCreateParams::FunctionType, nil]
      optional :function_type, enum: -> { Braintrust::Models::FunctionCreateParams::FunctionType }, nil?: true

      # @!attribute origin
      #
      #   @return [Braintrust::Models::FunctionCreateParams::Origin, nil]
      optional :origin, -> { Braintrust::Models::FunctionCreateParams::Origin }, nil?: true

      # @!attribute prompt_data
      #   The prompt, model, and its parameters
      #
      #   @return [Braintrust::Models::PromptData, nil]
      optional :prompt_data, -> { Braintrust::Models::PromptData }, nil?: true

      # @!attribute tags
      #   A list of tags for the prompt
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!parse
      #   # @param function_data [Braintrust::Models::FunctionCreateParams::FunctionData::Prompt, Braintrust::Models::FunctionCreateParams::FunctionData::Code, Braintrust::Models::FunctionCreateParams::FunctionData::Global]
      #   # @param name [String]
      #   # @param project_id [String]
      #   # @param slug [String]
      #   # @param description [String, nil]
      #   # @param function_schema [Braintrust::Models::FunctionCreateParams::FunctionSchema, nil]
      #   # @param function_type [Symbol, Braintrust::Models::FunctionCreateParams::FunctionType, nil]
      #   # @param origin [Braintrust::Models::FunctionCreateParams::Origin, nil]
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

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      module FunctionData
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::Models::FunctionCreateParams::FunctionData::Prompt }

        variant -> { Braintrust::Models::FunctionCreateParams::FunctionData::Code }

        variant -> { Braintrust::Models::FunctionCreateParams::FunctionData::Global }

        class Prompt < Braintrust::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type]
          required :type, enum: -> { Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type }

          # @!parse
          #   # @param type [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Prompt::Type]
          #   #
          #   def initialize(type:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::FunctionCreateParams::FunctionData::Prompt#type
          module Type
            extend Braintrust::Internal::Type::Enum

            PROMPT = :prompt

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end

        class Code < Braintrust::Internal::Type::BaseModel
          # @!attribute data
          #
          #   @return [Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline]
          required :data, union: -> { Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data }

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type]
          required :type, enum: -> { Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type }

          # @!parse
          #   # @param data [Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline]
          #   # @param type [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Type]
          #   #
          #   def initialize(data:, type:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::FunctionCreateParams::FunctionData::Code#data
          module Data
            extend Braintrust::Internal::Type::Union

            variant -> { Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle }

            variant -> { Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline }

            class Bundle < Braintrust::Models::CodeBundle
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type]
              required :type,
                       enum: -> { Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type }

              # @!parse
              #   # @param type [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle::Type]
              #   #
              #   def initialize(type:, **) = super

              # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

              module Type
                extend Braintrust::Internal::Type::Enum

                BUNDLE = :bundle

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
              end
            end

            class Inline < Braintrust::Internal::Type::BaseModel
              # @!attribute code
              #
              #   @return [String]
              required :code, String

              # @!attribute runtime_context
              #
              #   @return [Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext]
              required :runtime_context,
                       -> { Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext }

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type]
              required :type,
                       enum: -> { Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type }

              # @!parse
              #   # @param code [String]
              #   # @param runtime_context [Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext]
              #   # @param type [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::Type]
              #   #
              #   def initialize(code:, runtime_context:, type:, **) = super

              # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

              # @see Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline#runtime_context
              class RuntimeContext < Braintrust::Internal::Type::BaseModel
                # @!attribute runtime
                #
                #   @return [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                required :runtime,
                         enum: -> { Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime }

                # @!attribute version
                #
                #   @return [String]
                required :version, String

                # @!parse
                #   # @param runtime [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                #   # @param version [String]
                #   #
                #   def initialize(runtime:, version:, **) = super

                # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

                # @see Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline::RuntimeContext#runtime
                module Runtime
                  extend Braintrust::Internal::Type::Enum

                  NODE = :node
                  PYTHON = :python

                  finalize!

                  # @!parse
                  #   # @return [Array<Symbol>]
                  #   def self.values; end
                end
              end

              # @see Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline#type
              module Type
                extend Braintrust::Internal::Type::Enum

                INLINE = :inline

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
              end
            end

            # @!parse
            #   # @return [Array(Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionCreateParams::FunctionData::Code::Data::Inline)]
            #   def self.variants; end
          end

          # @see Braintrust::Models::FunctionCreateParams::FunctionData::Code#type
          module Type
            extend Braintrust::Internal::Type::Enum

            CODE = :code

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type]
          required :type, enum: -> { Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type }

          # @!parse
          #   # @param name [String]
          #   # @param type [Symbol, Braintrust::Models::FunctionCreateParams::FunctionData::Global::Type]
          #   #
          #   def initialize(name:, type:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::FunctionCreateParams::FunctionData::Global#type
          module Type
            extend Braintrust::Internal::Type::Enum

            GLOBAL = :global

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end

        # @!parse
        #   # @return [Array(Braintrust::Models::FunctionCreateParams::FunctionData::Prompt, Braintrust::Models::FunctionCreateParams::FunctionData::Code, Braintrust::Models::FunctionCreateParams::FunctionData::Global)]
        #   def self.variants; end
      end

      class FunctionSchema < Braintrust::Internal::Type::BaseModel
        # @!attribute [r] parameters
        #
        #   @return [Object, nil]
        optional :parameters, Braintrust::Internal::Type::Unknown

        # @!parse
        #   # @return [Object]
        #   attr_writer :parameters

        # @!attribute [r] returns
        #
        #   @return [Object, nil]
        optional :returns, Braintrust::Internal::Type::Unknown

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

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
      end

      module FunctionType
        extend Braintrust::Internal::Type::Enum

        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      class Origin < Braintrust::Internal::Type::BaseModel
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
        optional :internal, Braintrust::Internal::Type::BooleanModel, nil?: true

        # @!parse
        #   # @param object_id_ [String]
        #   # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
        #   # @param internal [Boolean, nil]
        #   #
        #   def initialize(object_id_:, object_type:, internal: nil, **) = super

        # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
      end
    end
  end
end
