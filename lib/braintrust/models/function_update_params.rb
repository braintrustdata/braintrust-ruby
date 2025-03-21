# frozen_string_literal: true

module Braintrust
  module Models
    class FunctionUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute description
      #   Textual description of the prompt
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute function_data
      #
      #   @return [Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt, Braintrust::Models::FunctionUpdateParams::FunctionData::Code, Braintrust::Models::FunctionUpdateParams::FunctionData::Global, nil]
      optional :function_data, union: -> { Braintrust::Models::FunctionUpdateParams::FunctionData }, nil?: true

      # @!attribute name
      #   Name of the prompt
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

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
      #   # @param description [String, nil]
      #   # @param function_data [Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt, Braintrust::Models::FunctionUpdateParams::FunctionData::Code, Braintrust::Models::FunctionUpdateParams::FunctionData::Global, nil]
      #   # @param name [String, nil]
      #   # @param prompt_data [Braintrust::Models::PromptData, nil]
      #   # @param tags [Array<String>, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(description: nil, function_data: nil, name: nil, prompt_data: nil, tags: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      module FunctionData
        extend Braintrust::Union

        variant -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt }

        variant -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Code }

        variant -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Global }

        class Prompt < Braintrust::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type]
          required :type, enum: -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type }

          # @!parse
          #   # @param type [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt::Type]
          #   #
          #   def initialize(type:, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          module Type
            extend Braintrust::Enum

            PROMPT = :prompt

            finalize!
          end
        end

        class Code < Braintrust::BaseModel
          # @!attribute data
          #
          #   @return [Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline]
          required :data, union: -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data }

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type]
          required :type, enum: -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type }

          # @!parse
          #   # @param data [Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline]
          #   # @param type [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Type]
          #   #
          #   def initialize(data:, type:, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          module Data
            extend Braintrust::Union

            variant -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle }

            variant -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline }

            class Bundle < Braintrust::Models::CodeBundle
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type]
              required :type,
                       enum: -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type }

              # @!parse
              #   # @param type [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle::Type]
              #   #
              #   def initialize(type:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void

              module Type
                extend Braintrust::Enum

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
              #   @return [Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext]
              required :runtime_context,
                       -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext }

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type]
              required :type,
                       enum: -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type }

              # @!parse
              #   # @param code [String]
              #   # @param runtime_context [Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext]
              #   # @param type [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::Type]
              #   #
              #   def initialize(code:, runtime_context:, type:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void

              class RuntimeContext < Braintrust::BaseModel
                # @!attribute runtime
                #
                #   @return [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                required :runtime,
                         enum: -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime }

                # @!attribute version
                #
                #   @return [String]
                required :version, String

                # @!parse
                #   # @param runtime [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                #   # @param version [String]
                #   #
                #   def initialize(runtime:, version:, **) = super

                # def initialize: (Hash | Braintrust::BaseModel) -> void

                module Runtime
                  extend Braintrust::Enum

                  NODE = :node
                  PYTHON = :python

                  finalize!
                end
              end

              module Type
                extend Braintrust::Enum

                INLINE = :inline

                finalize!
              end
            end

            # @!parse
            #   class << self
            #     # @return [Array(Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Bundle, Braintrust::Models::FunctionUpdateParams::FunctionData::Code::Data::Inline)]
            #     def variants; end
            #   end
          end

          module Type
            extend Braintrust::Enum

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
          #   @return [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type]
          required :type, enum: -> { Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type }

          # @!parse
          #   # @param name [String]
          #   # @param type [Symbol, Braintrust::Models::FunctionUpdateParams::FunctionData::Global::Type]
          #   #
          #   def initialize(name:, type:, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          module Type
            extend Braintrust::Enum

            GLOBAL = :global

            finalize!
          end
        end

        # @!parse
        #   class << self
        #     # @return [Array(Braintrust::Models::FunctionUpdateParams::FunctionData::Prompt, Braintrust::Models::FunctionUpdateParams::FunctionData::Code, Braintrust::Models::FunctionUpdateParams::FunctionData::Global)]
        #     def variants; end
        #   end
      end
    end
  end
end
