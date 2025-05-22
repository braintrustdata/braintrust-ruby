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
               -> { Braintrust::Internal::Type::ArrayOf[union: Braintrust::OnlineScoreConfig::Scorer] }

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

      # @!method initialize(sampling_rate:, scorers:, apply_to_root_span: nil, apply_to_span_names: nil)
      #   @param sampling_rate [Float] The sampling rate for online scoring
      #
      #   @param scorers [Array<Braintrust::Models::OnlineScoreConfig::Scorer::Function, Braintrust::Models::OnlineScoreConfig::Scorer::Global>] The list of scorers to use for online scoring
      #
      #   @param apply_to_root_span [Boolean, nil] Whether to trigger online scoring on the root span of each trace
      #
      #   @param apply_to_span_names [Array<String>, nil] Trigger online scoring on any spans with a name in this list

      module Scorer
        extend Braintrust::Internal::Type::Union

        variant -> { Braintrust::OnlineScoreConfig::Scorer::Function }

        variant -> { Braintrust::OnlineScoreConfig::Scorer::Global }

        class Function < Braintrust::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type]
          required :type, enum: -> { Braintrust::OnlineScoreConfig::Scorer::Function::Type }

          # @!method initialize(id:, type:)
          #   @param id [String]
          #   @param type [Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type]

          # @see Braintrust::Models::OnlineScoreConfig::Scorer::Function#type
          module Type
            extend Braintrust::Internal::Type::Enum

            FUNCTION = :function

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
          #   @return [Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type]
          required :type, enum: -> { Braintrust::OnlineScoreConfig::Scorer::Global::Type }

          # @!method initialize(name:, type:)
          #   @param name [String]
          #   @param type [Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type]

          # @see Braintrust::Models::OnlineScoreConfig::Scorer::Global#type
          module Type
            extend Braintrust::Internal::Type::Enum

            GLOBAL = :global

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Braintrust::Models::OnlineScoreConfig::Scorer::Function, Braintrust::Models::OnlineScoreConfig::Scorer::Global)]
      end
    end
  end
end
