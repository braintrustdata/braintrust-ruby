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
      #   @return [Braintrust::CodeBundle::Location::Experiment, Braintrust::CodeBundle::Location::Function]
      required :location, union: -> { Braintrust::CodeBundle::Location }

      # @!attribute runtime_context
      #
      #   @return [Braintrust::CodeBundle::RuntimeContext]
      required :runtime_context, -> { Braintrust::CodeBundle::RuntimeContext }

      # @!attribute preview
      #   A preview of the code
      #
      #   @return [String, nil]
      optional :preview, String, nil?: true

      # @!method initialize(bundle_id:, location:, runtime_context:, preview: nil)
      #   @param bundle_id [String]
      #
      #   @param location [Braintrust::CodeBundle::Location::Experiment, Braintrust::CodeBundle::Location::Function]
      #
      #   @param runtime_context [Braintrust::CodeBundle::RuntimeContext]
      #
      #   @param preview [String, nil] A preview of the code

      # @see Braintrust::CodeBundle#location
      module Location
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::CodeBundle::Location::Experiment }

        variant -> { Braintrust::CodeBundle::Location::Function }

        class Experiment < Braintrust::Internal::Type::BaseModel
          # @!attribute eval_name
          #
          #   @return [String]
          required :eval_name, String

          # @!attribute position
          #
          #   @return [Braintrust::CodeBundle::Location::Experiment::Position::Type, Braintrust::CodeBundle::Location::Experiment::Position::Scorer]
          required :position, union: -> { Braintrust::CodeBundle::Location::Experiment::Position }

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::CodeBundle::Location::Experiment::Type]
          required :type, enum: -> { Braintrust::CodeBundle::Location::Experiment::Type }

          # @!method initialize(eval_name:, position:, type:)
          #   @param eval_name [String]
          #   @param position [Braintrust::CodeBundle::Location::Experiment::Position::Type, Braintrust::CodeBundle::Location::Experiment::Position::Scorer]
          #   @param type [Symbol, Braintrust::CodeBundle::Location::Experiment::Type]

          # @see Braintrust::CodeBundle::Location::Experiment#position
          module Position
            extend Braintrust::Internal::Type::Union

            variant -> { Braintrust::CodeBundle::Location::Experiment::Position::Type }

            variant -> { Braintrust::CodeBundle::Location::Experiment::Position::Scorer }

            class Type < Braintrust::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::CodeBundle::Location::Experiment::Position::Type::Type]
              required :type, enum: -> { Braintrust::CodeBundle::Location::Experiment::Position::Type::Type }

              # @!method initialize(type:)
              #   @param type [Symbol, Braintrust::CodeBundle::Location::Experiment::Position::Type::Type]

              # @see Braintrust::CodeBundle::Location::Experiment::Position::Type#type
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
              #   @return [Symbol, Braintrust::CodeBundle::Location::Experiment::Position::Scorer::Type]
              required :type,
                       enum: -> {
                         Braintrust::CodeBundle::Location::Experiment::Position::Scorer::Type
                       }

              # @!method initialize(index:, type:)
              #   @param index [Integer]
              #   @param type [Symbol, Braintrust::CodeBundle::Location::Experiment::Position::Scorer::Type]

              # @see Braintrust::CodeBundle::Location::Experiment::Position::Scorer#type
              module Type
                extend Braintrust::Internal::Type::Enum

                SCORER = :scorer

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @!method self.variants
            #   @return [Array(Braintrust::CodeBundle::Location::Experiment::Position::Type, Braintrust::CodeBundle::Location::Experiment::Position::Scorer)]

            define_sorbet_constant!(:Variants) do
              T.type_alias do
                T.any(
                  Braintrust::CodeBundle::Location::Experiment::Position::Type,
                  Braintrust::CodeBundle::Location::Experiment::Position::Scorer
                )
              end
            end
          end

          # @see Braintrust::CodeBundle::Location::Experiment#type
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
          #   @return [Symbol, Braintrust::CodeBundle::Location::Function::Type]
          required :type, enum: -> { Braintrust::CodeBundle::Location::Function::Type }

          # @!method initialize(index:, type:)
          #   @param index [Integer]
          #   @param type [Symbol, Braintrust::CodeBundle::Location::Function::Type]

          # @see Braintrust::CodeBundle::Location::Function#type
          module Type
            extend Braintrust::Internal::Type::Enum

            FUNCTION = :function

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::CodeBundle::Location::Experiment, Braintrust::CodeBundle::Location::Function)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(Braintrust::CodeBundle::Location::Experiment, Braintrust::CodeBundle::Location::Function)
          end
        end
      end

      # @see Braintrust::CodeBundle#runtime_context
      class RuntimeContext < Braintrust::Internal::Type::BaseModel
        # @!attribute runtime
        #
        #   @return [Symbol, Braintrust::CodeBundle::RuntimeContext::Runtime]
        required :runtime, enum: -> { Braintrust::CodeBundle::RuntimeContext::Runtime }

        # @!attribute version
        #
        #   @return [String]
        required :version, String

        # @!method initialize(runtime:, version:)
        #   @param runtime [Symbol, Braintrust::CodeBundle::RuntimeContext::Runtime]
        #   @param version [String]

        # @see Braintrust::CodeBundle::RuntimeContext#runtime
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
