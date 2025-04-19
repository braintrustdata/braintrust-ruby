# frozen_string_literal: true

module Braintrust
  module Models
    class Function < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the prompt
      #
      #   @return [String]
      required :id, String

      # @!attribute _xact_id
      #   The transaction id of an event is unique to the network operation that processed
      #   the event insertion. Transaction ids are monotonically increasing over time and
      #   can be used to retrieve a versioned snapshot of the prompt (see the `version`
      #   parameter)
      #
      #   @return [String]
      required :_xact_id, String

      # @!attribute function_data
      #
      #   @return [Braintrust::Models::Function::FunctionData::Prompt, Braintrust::Models::Function::FunctionData::Code, Braintrust::Models::Function::FunctionData::Global]
      required :function_data, union: -> { Braintrust::Models::Function::FunctionData }

      # @!attribute log_id
      #   A literal 'p' which identifies the object as a project prompt
      #
      #   @return [Symbol, Braintrust::Models::Function::LogID]
      required :log_id, enum: -> { Braintrust::Models::Function::LogID }

      # @!attribute name
      #   Name of the prompt
      #
      #   @return [String]
      required :name, String

      # @!attribute org_id
      #   Unique identifier for the organization
      #
      #   @return [String]
      required :org_id, String

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

      # @!attribute created
      #   Date of prompt creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute description
      #   Textual description of the prompt
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute function_schema
      #   JSON schema for the function's parameters and return type
      #
      #   @return [Braintrust::Models::Function::FunctionSchema, nil]
      optional :function_schema, -> { Braintrust::Models::Function::FunctionSchema }, nil?: true

      # @!attribute function_type
      #
      #   @return [Symbol, Braintrust::Models::Function::FunctionType, nil]
      optional :function_type, enum: -> { Braintrust::Models::Function::FunctionType }, nil?: true

      # @!attribute metadata
      #   User-controlled metadata about the prompt
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute origin
      #
      #   @return [Braintrust::Models::Function::Origin, nil]
      optional :origin, -> { Braintrust::Models::Function::Origin }, nil?: true

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

      # @!method initialize(id:, _xact_id:, function_data:, log_id:, name:, org_id:, project_id:, slug:, created: nil, description: nil, function_schema: nil, function_type: nil, metadata: nil, origin: nil, prompt_data: nil, tags: nil)
      #   @param id [String]
      #   @param _xact_id [String]
      #   @param function_data [Braintrust::Models::Function::FunctionData::Prompt, Braintrust::Models::Function::FunctionData::Code, Braintrust::Models::Function::FunctionData::Global]
      #   @param log_id [Symbol, Braintrust::Models::Function::LogID]
      #   @param name [String]
      #   @param org_id [String]
      #   @param project_id [String]
      #   @param slug [String]
      #   @param created [Time, nil]
      #   @param description [String, nil]
      #   @param function_schema [Braintrust::Models::Function::FunctionSchema, nil]
      #   @param function_type [Symbol, Braintrust::Models::Function::FunctionType, nil]
      #   @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   @param origin [Braintrust::Models::Function::Origin, nil]
      #   @param prompt_data [Braintrust::Models::PromptData, nil]
      #   @param tags [Array<String>, nil]

      # @see Braintrust::Models::Function#function_data
      module FunctionData
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::Models::Function::FunctionData::Prompt }

        variant -> { Braintrust::Models::Function::FunctionData::Code }

        variant -> { Braintrust::Models::Function::FunctionData::Global }

        class Prompt < Braintrust::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::Function::FunctionData::Prompt::Type]
          required :type, enum: -> { Braintrust::Models::Function::FunctionData::Prompt::Type }

          # @!method initialize(type:)
          #   @param type [Symbol, Braintrust::Models::Function::FunctionData::Prompt::Type]

          # @see Braintrust::Models::Function::FunctionData::Prompt#type
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
          #   @return [Braintrust::Models::Function::FunctionData::Code::Data::Bundle, Braintrust::Models::Function::FunctionData::Code::Data::Inline]
          required :data, union: -> { Braintrust::Models::Function::FunctionData::Code::Data }

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::Function::FunctionData::Code::Type]
          required :type, enum: -> { Braintrust::Models::Function::FunctionData::Code::Type }

          # @!method initialize(data:, type:)
          #   @param data [Braintrust::Models::Function::FunctionData::Code::Data::Bundle, Braintrust::Models::Function::FunctionData::Code::Data::Inline]
          #   @param type [Symbol, Braintrust::Models::Function::FunctionData::Code::Type]

          # @see Braintrust::Models::Function::FunctionData::Code#data
          module Data
            extend Braintrust::Internal::Type::Union

            variant -> { Braintrust::Models::Function::FunctionData::Code::Data::Bundle }

            variant -> { Braintrust::Models::Function::FunctionData::Code::Data::Inline }

            class Bundle < Braintrust::Models::CodeBundle
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type]
              required :type, enum: -> { Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type }

              # @!method initialize(type:)
              #   @param type [Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Bundle::Type]

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
              #   @return [Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext]
              required :runtime_context,
                       -> { Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext }

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type]
              required :type, enum: -> { Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type }

              # @!method initialize(code:, runtime_context:, type:)
              #   @param code [String]
              #   @param runtime_context [Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext]
              #   @param type [Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Inline::Type]

              # @see Braintrust::Models::Function::FunctionData::Code::Data::Inline#runtime_context
              class RuntimeContext < Braintrust::Internal::Type::BaseModel
                # @!attribute runtime
                #
                #   @return [Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                required :runtime,
                         enum: -> { Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime }

                # @!attribute version
                #
                #   @return [String]
                required :version, String

                # @!method initialize(runtime:, version:)
                #   @param runtime [Symbol, Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext::Runtime]
                #   @param version [String]

                # @see Braintrust::Models::Function::FunctionData::Code::Data::Inline::RuntimeContext#runtime
                module Runtime
                  extend Braintrust::Internal::Type::Enum

                  NODE = :node
                  PYTHON = :python

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end
              end

              # @see Braintrust::Models::Function::FunctionData::Code::Data::Inline#type
              module Type
                extend Braintrust::Internal::Type::Enum

                INLINE = :inline

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Braintrust::Models::Function::FunctionData::Code::Data::Bundle, Braintrust::Models::Function::FunctionData::Code::Data::Inline)]
          end

          # @see Braintrust::Models::Function::FunctionData::Code#type
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
          #   @return [Symbol, Braintrust::Models::Function::FunctionData::Global::Type]
          required :type, enum: -> { Braintrust::Models::Function::FunctionData::Global::Type }

          # @!method initialize(name:, type:)
          #   @param name [String]
          #   @param type [Symbol, Braintrust::Models::Function::FunctionData::Global::Type]

          # @see Braintrust::Models::Function::FunctionData::Global#type
          module Type
            extend Braintrust::Internal::Type::Enum

            GLOBAL = :global

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::Models::Function::FunctionData::Prompt, Braintrust::Models::Function::FunctionData::Code, Braintrust::Models::Function::FunctionData::Global)]
      end

      # A literal 'p' which identifies the object as a project prompt
      #
      # @see Braintrust::Models::Function#log_id
      module LogID
        extend Braintrust::Internal::Type::Enum

        P = :p

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Braintrust::Models::Function#function_schema
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

      # @see Braintrust::Models::Function#function_type
      module FunctionType
        extend Braintrust::Internal::Type::Enum

        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Braintrust::Models::Function#origin
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
        #   list of functions.
        #
        #   @return [Boolean, nil]
        optional :internal, Braintrust::Internal::Type::Boolean, nil?: true

        # @!method initialize(object_id_:, object_type:, internal: nil)
        #   @param object_id_ [String]
        #   @param object_type [Symbol, Braintrust::Models::ACLObjectType]
        #   @param internal [Boolean, nil]
      end
    end
  end
end
