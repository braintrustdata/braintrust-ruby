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

      # @!method initialize(type:, text: nil)
      #   @param type [Symbol, Braintrust::Models::ChatCompletionContentPartText::Type]
      #   @param text [String]

      # @see Braintrust::Models::ChatCompletionContentPartText#type
      module Type
        extend Braintrust::Internal::Type::Enum

        TEXT = :text

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
