# frozen_string_literal: true

module Braintrust
  module Models
    class OnlineScoreConfig < BaseModel
      # @!attribute [rw] sampling_rate
      #   The sampling rate for online scoring
      #   @return [Float]
      required :sampling_rate, Float

      # @!attribute [rw] scorers
      #   The list of scorers to use for online scoring
      #   @return [Array<Braintrust::Models::OnlineScoreConfig::Scorer::UnnamedTypeWithunionParent5, Braintrust::Models::OnlineScoreConfig::Scorer::UnnamedTypeWithunionParent6>]
      required :scorers, Braintrust::ArrayOf.new(Braintrust::Unknown)

      # @!attribute [rw] apply_to_root_span
      #   Whether to trigger online scoring on the root span of each trace
      #   @return [Boolean]
      optional :apply_to_root_span, Braintrust::BooleanModel

      # @!attribute [rw] apply_to_span_names
      #   Trigger online scoring on any spans with a name in this list
      #   @return [Array<String>]
      optional :apply_to_span_names, Braintrust::ArrayOf.new(String)

      # @!parse
      #   # Create a new instance of OnlineScoreConfig from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Float] :sampling_rate The sampling rate for online scoring
      #   #   @option data [Array<Object>] :scorers The list of scorers to use for online scoring
      #   #   @option data [Hash, nil] :apply_to_root_span Whether to trigger online scoring on the root span of each trace
      #   #   @option data [Array<String>, nil] :apply_to_span_names Trigger online scoring on any spans with a name in this list
      #   def initialize(data = {}) = super
    end
  end
end
