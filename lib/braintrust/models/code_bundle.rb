# frozen_string_literal: true

module Braintrust
  module Models
    class CodeBundle < Braintrust::BaseModel
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

      # @!parse
      #   # @param bundle_id [String]
      #   # @param location [Braintrust::Models::CodeBundle::Location::Experiment, Braintrust::Models::CodeBundle::Location::Function]
      #   # @param runtime_context [Braintrust::Models::CodeBundle::RuntimeContext]
      #   # @param preview [String, nil]
      #   #
      #   def initialize(bundle_id:, location:, runtime_context:, preview: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      module Location
        extend Braintrust::Union

        variant -> { Braintrust::Models::CodeBundle::Location::Experiment }

        variant -> { Braintrust::Models::CodeBundle::Location::Function }

        class Experiment < Braintrust::BaseModel
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

          # @!parse
          #   # @param eval_name [String]
          #   # @param position [Braintrust::Models::CodeBundle::Location::Experiment::Position::Type, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer]
          #   # @param type [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Type]
          #   #
          #   def initialize(eval_name:, position:, type:, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          module Position
            extend Braintrust::Union

            variant -> { Braintrust::Models::CodeBundle::Location::Experiment::Position::Type }

            variant -> { Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer }

            class Type < Braintrust::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type]
              required :type, enum: -> { Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type }

              # @!parse
              #   # @param type [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type]
              #   #
              #   def initialize(type:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void

              module Type
                extend Braintrust::Enum

                TASK = :task

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
              end
            end

            class Scorer < Braintrust::BaseModel
              # @!attribute index
              #
              #   @return [Integer]
              required :index, Integer

              # @!attribute type
              #
              #   @return [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type]
              required :type, enum: -> { Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type }

              # @!parse
              #   # @param index [Integer]
              #   # @param type [Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type]
              #   #
              #   def initialize(index:, type:, **) = super

              # def initialize: (Hash | Braintrust::BaseModel) -> void

              module Type
                extend Braintrust::Enum

                SCORER = :scorer

                finalize!

                # @!parse
                #   # @return [Array<Symbol>]
                #   def self.values; end
              end
            end

            # @!parse
            #   # @return [Array(Braintrust::Models::CodeBundle::Location::Experiment::Position::Type, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer)]
            #   def self.variants; end
          end

          module Type
            extend Braintrust::Enum

            EXPERIMENT = :experiment

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end

        class Function < Braintrust::BaseModel
          # @!attribute index
          #
          #   @return [Integer]
          required :index, Integer

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::CodeBundle::Location::Function::Type]
          required :type, enum: -> { Braintrust::Models::CodeBundle::Location::Function::Type }

          # @!parse
          #   # @param index [Integer]
          #   # @param type [Symbol, Braintrust::Models::CodeBundle::Location::Function::Type]
          #   #
          #   def initialize(index:, type:, **) = super

          # def initialize: (Hash | Braintrust::BaseModel) -> void

          module Type
            extend Braintrust::Enum

            FUNCTION = :function

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end

        # @!parse
        #   # @return [Array(Braintrust::Models::CodeBundle::Location::Experiment, Braintrust::Models::CodeBundle::Location::Function)]
        #   def self.variants; end
      end

      class RuntimeContext < Braintrust::BaseModel
        # @!attribute runtime
        #
        #   @return [Symbol, Braintrust::Models::CodeBundle::RuntimeContext::Runtime]
        required :runtime, enum: -> { Braintrust::Models::CodeBundle::RuntimeContext::Runtime }

        # @!attribute version
        #
        #   @return [String]
        required :version, String

        # @!parse
        #   # @param runtime [Symbol, Braintrust::Models::CodeBundle::RuntimeContext::Runtime]
        #   # @param version [String]
        #   #
        #   def initialize(runtime:, version:, **) = super

        # def initialize: (Hash | Braintrust::BaseModel) -> void

        module Runtime
          extend Braintrust::Enum

          NODE = :node
          PYTHON = :python

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end
    end
  end
end
