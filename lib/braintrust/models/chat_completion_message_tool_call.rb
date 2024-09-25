# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionMessageToolCall < BaseModel
      # @!attribute [rw] id
      #   @return [String]
      required :id, String

      # @!attribute [rw] function
      #   @return [Braintrust::Models::ChatCompletionMessageToolCall::Function]
      required :function, -> { Braintrust::Models::ChatCompletionMessageToolCall::Function }

      # @!attribute [rw] type
      #   One of the constants defined in {Braintrust::Models::ChatCompletionMessageToolCall::Type}
      #   @return [Symbol]
      required :type, enum: -> { Braintrust::Models::ChatCompletionMessageToolCall::Type }

      class Function < BaseModel
        # @!attribute [rw] arguments
        #   @return [String]
        required :arguments, String

        # @!attribute [rw] name_
        #   @return [String]
        required :name_, String
      end

      class Type < Braintrust::Enum
        FUNCTION = :function
      end
    end
  end
end
