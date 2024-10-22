# frozen_string_literal: true

module Braintrust
  module Models
    class Scorer < BaseModel
      # @!attribute [rw] index
      #   @return [Integer]
      required :index, Integer

      # @!attribute [rw] type
      #   @return [Symbol, Braintrust::Models::Scorer::Type]
      required :type, enum: -> { Braintrust::Models::Scorer::Type }

      class Type < Braintrust::Enum
        SCORER = :scorer
      end

      # @!parse
      #   # Create a new instance of Scorer from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :index
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
