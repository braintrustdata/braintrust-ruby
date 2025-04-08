# frozen_string_literal: true

module Braintrust
  module Models
    class OnlineScoreConfig < Braintrust::Internal::Type::BaseModel
      # @!attribute sampling_rate
      #   The sampling rate for online scoring
      #
      #   @return [Float]
      required :sampling_rate, Float

      # @!attribute scorers
      #   The list of scorers to use for online scoring
      #
      #   @return [Array<Braintrust::Models::OnlineScoreConfig::Scorer::Function, Braintrust::Models::OnlineScoreConfig::Scorer::Global>]
      required :scorers,
               -> { Braintrust::Internal::Type::ArrayOf[union: Braintrust::Models::OnlineScoreConfig::Scorer] }

      # @!attribute apply_to_root_span
      #   Whether to trigger online scoring on the root span of each trace
      #
      #   @return [Boolean, nil]
      optional :apply_to_root_span, Braintrust::Internal::Type::Boolean, nil?: true

      # @!attribute apply_to_span_names
      #   Trigger online scoring on any spans with a name in this list
      #
      #   @return [Array<String>, nil]
      optional :apply_to_span_names, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!parse
      #   # @param sampling_rate [Float]
      #   # @param scorers [Array<Braintrust::Models::OnlineScoreConfig::Scorer::Function, Braintrust::Models::OnlineScoreConfig::Scorer::Global>]
      #   # @param apply_to_root_span [Boolean, nil]
      #   # @param apply_to_span_names [Array<String>, nil]
      #   #
      #   def initialize(sampling_rate:, scorers:, apply_to_root_span: nil, apply_to_span_names: nil, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      module Scorer
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::Models::OnlineScoreConfig::Scorer::Function }

        variant -> { Braintrust::Models::OnlineScoreConfig::Scorer::Global }

        class Function < Braintrust::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type]
          required :type, enum: -> { Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type }

          # @!parse
          #   # @param id [String]
          #   # @param type [Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type]
          #   #
          #   def initialize(id:, type:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::OnlineScoreConfig::Scorer::Function#type
          module Type
            extend Braintrust::Internal::Type::Enum

            FUNCTION = :function

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
          #   @return [Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type]
          required :type, enum: -> { Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type }

          # @!parse
          #   # @param name [String]
          #   # @param type [Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type]
          #   #
          #   def initialize(name:, type:, **) = super

          # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

          # @see Braintrust::Models::OnlineScoreConfig::Scorer::Global#type
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
        #   # @return [Array(Braintrust::Models::OnlineScoreConfig::Scorer::Function, Braintrust::Models::OnlineScoreConfig::Scorer::Global)]
        #   def self.variants; end
      end
    end
  end
end
