# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionContentPartText < Braintrust::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Braintrust::Models::ChatCompletionContentPartText::Type]
      required :type, enum: -> { Braintrust::ChatCompletionContentPartText::Type }

      # @!attribute text
      #
      #   @return [String, nil]
      optional :text, String

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
