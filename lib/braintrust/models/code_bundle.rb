# frozen_string_literal: true

module Braintrust
  module Models
    class CodeBundle < Braintrust::Internal::Type::BaseModel
      # @!attribute bundle_id
      #
      #   @return [String]
      required :bundle_id, String

      # @!attribute location
      #
      #   @return [Braintrust::Models::CodeBundle::Location::Experiment, Braintrust::Models::CodeBundle::Location::Function]
      required :location, union: -> { Braintrust::Models::CodeBundle::Location }

      # @!attribute runtime_context
      #
      #   @return [Braintrust::Models::CodeBundle::RuntimeContext]
      required :runtime_context, -> { Braintrust::Models::CodeBundle::RuntimeContext }

      # @!attribute preview
      #   A preview of the code
      #
      #   @return [String, nil]
      optional :preview, String, nil?: true

      # @!method initialize(bundle_id:, location:, runtime_context:, preview: nil)
      #   @param bundle_id [String]
      #
      #   @param location [Braintrust::Models::CodeBundle::Location::Experiment, Braintrust::Models::CodeBundle::Location::Function]
      #
      #   @param runtime_context [Braintrust::Models::CodeBundle::RuntimeContext]
      #
      #   @param preview [String, nil] A preview of the code

      # @see Braintrust::Models::CodeBundle#location
      module Location
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::Models::CodeBundle::Location::Experiment }

        variant -> { Braintrust::Models::CodeBundle::Location::Function }

        class Experiment < Braintrust::Internal::Type::BaseModel
          # @!attribute eval_name
          #
          #   @return [String]
          required :eval_name, String

          # @!attribute position
          #
          #   @return [Braintrust::Models::CodeBundle::Location::Experiment::Position::Type, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer]
          required :position, union: -> { Braintrust::Models::CodeBundle::Location::Experiment::Position }

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Type]
          required :type, enum: -> { Braintrust::Models::CodeBundle::Location::Experiment::Type }

          # @!method initialize(eval_name:, position:, type:)
          #   @param eval_name [String]
          #   @param position [Braintrust::Models::CodeBundle::Location::Experiment::Position::Type, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer]
          #   @param type [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Type]

          # @see Braintrust::Models::CodeBundle::Location::Experiment#position
          module Position
            extend Braintrust::Internal::Type::Union

            variant -> { Braintrust::Models::CodeBundle::Location::Experiment::Position::Type }

            variant -> { Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer }

            class Type < Braintrust::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type]
              required :type, enum: -> { Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type }

              # @!method initialize(type:)
              #   @param type [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type]

              # @see Braintrust::Models::CodeBundle::Location::Experiment::Position::Type#type
              module Type
                extend Braintrust::Internal::Type::Enum

                TASK = :task

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            class Scorer < Braintrust::Internal::Type::BaseModel
              # @!attribute index
              #
              #   @return [Integer]
              required :index, Integer

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type]
              required :type, enum: -> { Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type }

              # @!method initialize(index:, type:)
              #   @param index [Integer]
              #   @param type [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type]

              # @see Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer#type
              module Type
                extend Braintrust::Internal::Type::Enum

                SCORER = :scorer

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Braintrust::Models::CodeBundle::Location::Experiment::Position::Type, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer)]
          end

          # @see Braintrust::Models::CodeBundle::Location::Experiment#type
          module Type
            extend Braintrust::Internal::Type::Enum

            EXPERIMENT = :experiment

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Function < Braintrust::Internal::Type::BaseModel
          # @!attribute index
          #
          #   @return [Integer]
          required :index, Integer

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::CodeBundle::Location::Function::Type]
          required :type, enum: -> { Braintrust::Models::CodeBundle::Location::Function::Type }

          # @!method initialize(index:, type:)
          #   @param index [Integer]
          #   @param type [Symbol, Braintrust::Models::CodeBundle::Location::Function::Type]

          # @see Braintrust::Models::CodeBundle::Location::Function#type
          module Type
            extend Braintrust::Internal::Type::Enum

            FUNCTION = :function

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::Models::CodeBundle::Location::Experiment, Braintrust::Models::CodeBundle::Location::Function)]
      end

      # @see Braintrust::Models::CodeBundle#runtime_context
      class RuntimeContext < Braintrust::Internal::Type::BaseModel
        # @!attribute runtime
        #
        #   @return [Symbol, Braintrust::Models::CodeBundle::RuntimeContext::Runtime]
        required :runtime, enum: -> { Braintrust::Models::CodeBundle::RuntimeContext::Runtime }

        # @!attribute version
        #
        #   @return [String]
        required :version, String

        # @!method initialize(runtime:, version:)
        #   @param runtime [Symbol, Braintrust::Models::CodeBundle::RuntimeContext::Runtime]
        #   @param version [String]

        # @see Braintrust::Models::CodeBundle::RuntimeContext#runtime
        module Runtime
          extend Braintrust::Internal::Type::Enum

          NODE = :node
          PYTHON = :python

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
