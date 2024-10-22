# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionContentPartText < BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Braintrust::Models::ChatCompletionContentPartText::Type]
      required :type, enum: -> { Braintrust::Models::ChatCompletionContentPartText::Type }

      # @!attribute [rw] text
      #   @return [String]
      optional :text, String

      class Type < Braintrust::Enum
        TEXT = :text
      end

      # @!parse
      #   # Create a new instance of ChatCompletionContentPartText from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :type
      #   #   @option data [String, nil] :text
      #   def initialize(data = {}) = super
    end
  end
end
