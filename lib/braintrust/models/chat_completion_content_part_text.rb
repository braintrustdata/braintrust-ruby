# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionContentPartText < Braintrust::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Braintrust::Models::ChatCompletionContentPartText::Type]
      required :type, enum: -> { Braintrust::Models::ChatCompletionContentPartText::Type }

      # @!attribute [r] text
      #
      #   @return [String, nil]
      optional :text, String

      # @!parse
      #   # @return [String]
      #   attr_writer :text

      # @!parse
      #   # @param type [Symbol, Braintrust::Models::ChatCompletionContentPartText::Type]
      #   # @param text [String]
      #   #
      #   def initialize(type:, text: nil, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      # @see Braintrust::Models::ChatCompletionContentPartText#type
      module Type
        extend Braintrust::Internal::Type::Enum

        TEXT = :text

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
