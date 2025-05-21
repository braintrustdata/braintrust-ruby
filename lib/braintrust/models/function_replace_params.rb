# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Functions#replace
    class FunctionReplaceParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute function_data
      #
      #   @return [Braintrust::FunctionReplaceParams::FunctionData::Prompt, Braintrust::FunctionReplaceParams::FunctionData::Code, Braintrust::FunctionReplaceParams::FunctionData::Global]
      required :function_data, union: -> { Braintrust::FunctionReplaceParams::FunctionData }

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
      #   @return [Braintrust::FunctionReplaceParams::FunctionSchema, nil]
      optional :function_schema, -> { Braintrust::FunctionReplaceParams::FunctionSchema }, nil?: true

      # @!attribute function_type
      #
      #   @return [Symbol, Braintrust::FunctionReplaceParams::FunctionType, nil]
      optional :function_type, enum: -> { Braintrust::FunctionReplaceParams::FunctionType }, nil?: true

      # @!attribute origin
      #
      #   @return [Braintrust::FunctionReplaceParams::Origin, nil]
      optional :origin, -> { Braintrust::FunctionReplaceParams::Origin }, nil?: true

      # @!attribute prompt_data
      #   The prompt, model, and its parameters
      #
      #   @return [Braintrust::PromptData, nil]
      optional :prompt_data, -> { Braintrust::PromptData }, nil?: true

      # @!attribute tags
      #   A list of tags for the prompt
      #
      #   @return [Array<String>, nil]
      optional :tags, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(function_data:, name:, project_id:, slug:, description: nil, function_schema: nil, function_type: nil, origin: nil, prompt_data: nil, tags: nil, request_options: {})
      #   @param function_data [Braintrust::FunctionReplaceParams::FunctionData::Prompt, Braintrust::FunctionReplaceParams::FunctionData::Code, Braintrust::FunctionReplaceParams::FunctionData::Global]
      #
      #   @param name [String] Name of the prompt
      #
      #   @param project_id [String] Unique identifier for the project that the prompt belongs under
      #
      #   @param slug [String] Unique identifier for the prompt
      #
      #   @param description [String, nil] Textual description of the prompt
      #
      #   @param function_schema [Braintrust::FunctionReplaceParams::FunctionSchema, nil] JSON schema for the function's parameters and return type
      #
      #   @param function_type [Symbol, Braintrust::FunctionReplaceParams::FunctionType, nil]
      #
      #   @param origin [Braintrust::FunctionReplaceParams::Origin, nil]
      #
      #   @param prompt_data [Braintrust::PromptData, nil] The prompt, model, and its parameters
      #
      #   @param tags [Array<String>, nil] A list of tags for the prompt
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      module FunctionData
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::FunctionReplaceParams::FunctionData::Prompt }

        variant -> { Braintrust::FunctionReplaceParams::FunctionData::Code }

        variant -> { Braintrust::FunctionReplaceParams::FunctionData::Global }

        class Prompt < Braintrust::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Prompt::Type]
          required :type, enum: -> { Braintrust::FunctionReplaceParams::FunctionData::Prompt::Type }

          # @!method initialize(type:)
          #   @param type [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Prompt::Type]

          # @see Braintrust::FunctionReplaceParams::FunctionData::Prompt#type
          module Type
            extend Braintrust::Internal::Type::Enum

            PROMPT = :prompt

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Code < Braintrust::Internal::Type::BaseModel
          # @!attribute data
          #
          #   @return [Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle, Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline]
          required :data, union: -> { Braintrust::FunctionReplaceParams::FunctionData::Code::Data }

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Code::Type]
          required :type, enum: -> { Braintrust::FunctionReplaceParams::FunctionData::Code::Type }

          # @!method initialize(data:, type:)
          #   @param data [Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle, Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline]
          #   @param type [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Code::Type]

          # @see Braintrust::FunctionReplaceParams::FunctionData::Code#data
          module Data
            extend Braintrust::Internal::Type::Union

            variant -> { Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle }

            variant -> { Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline }

            class Bundle < Braintrust::Models::CodeBundle
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type]
              required :type,
                       enum: -> {
                         Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type
                       }

              # @!method initialize(type:)
              #   @param type [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle::Type]

              module Type
                extend Braintrust::Internal::Type::Enum

                BUNDLE = :bundle

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class Inline < Braintrust::Internal::Type::BaseModel
              # @!attribute code
              #
              #   @return [String]
              required :code, String

              # @!attribute runtime_context
              #
              #   @return [Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext]
              required :runtime_context,
                       -> {
                         Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext
                       }

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type]
              required :type,
                       enum: -> {
                         Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type
                       }

              # @!method initialize(code:, runtime_context:, type:)
              #   @param code [String]
              #   @param runtime_context [Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext]
              #   @param type [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::Type]

              # @see Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline#runtime_context
              class RuntimeContext < Braintrust::Internal::Type::BaseModel
                # @!attribute runtime
                #
                #   @return [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                required :runtime,
                         enum: -> {
                           Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime
                         }

                # @!attribute version
                #
                #   @return [String]
                required :version, String

                # @!method initialize(runtime:, version:)
                #   @param runtime [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                #   @param version [String]

                # @see Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline::RuntimeContext#runtime
                module Runtime
                  extend Braintrust::Internal::Type::Enum

                  NODE = :node
                  PYTHON = :python

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @see Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline#type
              module Type
                extend Braintrust::Internal::Type::Enum

                INLINE = :inline

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Bundle, Braintrust::FunctionReplaceParams::FunctionData::Code::Data::Inline)]
          end

          # @see Braintrust::FunctionReplaceParams::FunctionData::Code#type
          module Type
            extend Braintrust::Internal::Type::Enum

            CODE = :code

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Global::Type]
          required :type, enum: -> { Braintrust::FunctionReplaceParams::FunctionData::Global::Type }

          # @!method initialize(name:, type:)
          #   @param name [String]
          #   @param type [Symbol, Braintrust::FunctionReplaceParams::FunctionData::Global::Type]

          # @see Braintrust::FunctionReplaceParams::FunctionData::Global#type
          module Type
            extend Braintrust::Internal::Type::Enum

            GLOBAL = :global

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::FunctionReplaceParams::FunctionData::Prompt, Braintrust::FunctionReplaceParams::FunctionData::Code, Braintrust::FunctionReplaceParams::FunctionData::Global)]
      end

      class FunctionSchema < Braintrust::Internal::Type::BaseModel
        # @!attribute parameters
        #
        #   @return [Object, nil]
        optional :parameters, Braintrust::Internal::Type::Unknown

        # @!attribute returns
        #
        #   @return [Object, nil]
        optional :returns, Braintrust::Internal::Type::Unknown

        # @!method initialize(parameters: nil, returns: nil)
        #   JSON schema for the function's parameters and return type
        #
        #   @param parameters [Object]
        #   @param returns [Object]
      end

      module FunctionType
        extend Braintrust::Internal::Type::Enum

        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool

        # @!method self.values
        #   @return [Array<Symbol>]
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
        #   @return [Symbol, Braintrust::ACLObjectType]
        required :object_type, enum: -> { Braintrust::ACLObjectType }

        # @!attribute internal
        #   The function exists for internal purposes and should not be displayed in the
        #   list of functions.
        #
        #   @return [Boolean, nil]
        optional :internal, Braintrust::Internal::Type::Boolean, nil?: true

        # @!method initialize(object_id_:, object_type:, internal: nil)
        #   Some parameter documentations has been truncated, see
        #   {Braintrust::FunctionReplaceParams::Origin} for more details.
        #
        #   @param object_id_ [String] Id of the object the function is originating from
        #
        #   @param object_type [Symbol, Braintrust::ACLObjectType] The object type that the ACL applies to
        #
        #   @param internal [Boolean, nil] The function exists for internal purposes and should not be displayed in the lis
      end
    end
  end
end
