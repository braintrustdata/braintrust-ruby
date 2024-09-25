# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionContentPartText < BaseModel
      # @!attribute [rw] type
      #   One of the constants defined in {Braintrust::Models::ChatCompletionContentPartText::Type}
      #   @return [Symbol]
      required :type, enum: -> { Braintrust::Models::ChatCompletionContentPartText::Type }

      # @!attribute [rw] text
      #   @return [String]
      optional :text, String

      class Type < Braintrust::Enum
        TEXT = :text
      end
    end
  end
end
