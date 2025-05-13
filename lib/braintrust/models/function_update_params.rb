# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Functions#update
    class FunctionUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute description
      #   Textual description of the prompt
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute function_data
      #
      #   @return [Braintrust::FunctionUpdateParams::FunctionData::Prompt, Braintrust::FunctionUpdateParams::FunctionData::Code, Braintrust::FunctionUpdateParams::FunctionData::Global, nil]
      optional :function_data, union: -> { Braintrust::FunctionUpdateParams::FunctionData }, nil?: true

      # @!attribute name
      #   Name of the prompt
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

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

      # @!method initialize(description: nil, function_data: nil, name: nil, prompt_data: nil, tags: nil, request_options: {})
      #   @param description [String, nil] Textual description of the prompt
      #
      #   @param function_data [Braintrust::FunctionUpdateParams::FunctionData::Prompt, Braintrust::FunctionUpdateParams::FunctionData::Code, Braintrust::FunctionUpdateParams::FunctionData::Global, nil]
      #
      #   @param name [String, nil] Name of the prompt
      #
      #   @param prompt_data [Braintrust::PromptData, nil] The prompt, model, and its parameters
      #
      #   @param tags [Array<String>, nil] A list of tags for the prompt
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      module FunctionData
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::FunctionUpdateParams::FunctionData::Prompt }

        variant -> { Braintrust::FunctionUpdateParams::FunctionData::Code }

        variant -> { Braintrust::FunctionUpdateParams::FunctionData::Global }

        class Prompt < Braintrust::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Prompt::Type]
          required :type, enum: -> { Braintrust::FunctionUpdateParams::FunctionData::Prompt::Type }

          # @!method initialize(type:)
          #   @param type [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Prompt::Type]

          # @see Braintrust::FunctionUpdateParams::FunctionData::Prompt#type
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
          #   @return [Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle, Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline]
          required :data, union: -> { Braintrust::FunctionUpdateParams::FunctionData::Code::Data }

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Code::Type]
          required :type, enum: -> { Braintrust::FunctionUpdateParams::FunctionData::Code::Type }

          # @!method initialize(data:, type:)
          #   @param data [Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle, Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline]
          #   @param type [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Code::Type]

          # @see Braintrust::FunctionUpdateParams::FunctionData::Code#data
          module Data
            extend Braintrust::Internal::Type::Union

            variant -> { Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle }

            variant -> { Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline }

            class Bundle < Braintrust::Models::CodeBundle
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type]
              required :type,
                       enum: -> {
                         Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type
                       }

              # @!method initialize(type:)
              #   @param type [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type]

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
              #   @return [Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext]
              required :runtime_context,
                       -> {
                         Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext
                       }

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type]
              required :type,
                       enum: -> {
                         Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type
                       }

              # @!method initialize(code:, runtime_context:, type:)
              #   @param code [String]
              #   @param runtime_context [Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext]
              #   @param type [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type]

              # @see Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline#runtime_context
              class RuntimeContext < Braintrust::Internal::Type::BaseModel
                # @!attribute runtime
                #
                #   @return [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                required :runtime,
                         enum: -> {
                           Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime
                         }

                # @!attribute version
                #
                #   @return [String]
                required :version, String

                # @!method initialize(runtime:, version:)
                #   @param runtime [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                #   @param version [String]

                # @see Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext#runtime
                module Runtime
                  extend Braintrust::Internal::Type::Enum

                  NODE = :node
                  PYTHON = :python

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @see Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline#type
              module Type
                extend Braintrust::Internal::Type::Enum

                INLINE = :inline

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle, Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline)]

            define_sorbet_constant!(:Variants) do
              T.type_alias do
                T.any(
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Bundle,
                  Braintrust::FunctionUpdateParams::FunctionData::Code::Data::Inline
                )
              end
            end
          end

          # @see Braintrust::FunctionUpdateParams::FunctionData::Code#type
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
          #   @return [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Global::Type]
          required :type, enum: -> { Braintrust::FunctionUpdateParams::FunctionData::Global::Type }

          # @!method initialize(name:, type:)
          #   @param name [String]
          #   @param type [Symbol, Braintrust::FunctionUpdateParams::FunctionData::Global::Type]

          # @see Braintrust::FunctionUpdateParams::FunctionData::Global#type
          module Type
            extend Braintrust::Internal::Type::Enum

            GLOBAL = :global

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::FunctionUpdateParams::FunctionData::Prompt, Braintrust::FunctionUpdateParams::FunctionData::Code, Braintrust::FunctionUpdateParams::FunctionData::Global)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              Braintrust::FunctionUpdateParams::FunctionData::Prompt,
              Braintrust::FunctionUpdateParams::FunctionData::Code,
              Braintrust::FunctionUpdateParams::FunctionData::Global
            )
          end
        end
      end
    end
  end
end
