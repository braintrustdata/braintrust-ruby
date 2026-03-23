# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionMessageToolCall < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute function
      #
      #   @return [Braintrust::Models::ChatCompletionMessageToolCall::Function]
      required :function, -> { Braintrust::ChatCompletionMessageToolCall::Function }

      # @!attribute type
      #
      #   @return [Symbol, Braintrust::Models::ChatCompletionMessageToolCall::Type]
      required :type, enum: -> { Braintrust::ChatCompletionMessageToolCall::Type }

      # @!method initialize(id:, function:, type:)
      #   @param id [String]
      #   @param function [Braintrust::Models::ChatCompletionMessageToolCall::Function]
      #   @param type [Symbol, Braintrust::Models::ChatCompletionMessageToolCall::Type]

      # @see Braintrust::Models::ChatCompletionMessageToolCall#function
      class Function < Braintrust::Internal::Type::BaseModel
        # @!attribute arguments
        #
        #   @return [String]
        required :arguments, String

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!method initialize(arguments:, name:)
        #   @param arguments [String]
        #   @param name [String]
      end

      # @see Braintrust::Models::ChatCompletionMessageToolCall#type
      module Type
        extend Braintrust::Internal::Type::Enum

        FUNCTION = :function

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
