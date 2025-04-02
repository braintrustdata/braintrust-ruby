# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionMessageToolCall < Braintrust::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute function
      #
      #   @return [Braintrust::Models::ChatCompletionMessageToolCall::Function]
      required :function, -> { Braintrust::Models::ChatCompletionMessageToolCall::Function }

      # @!attribute type
      #
      #   @return [Symbol, Braintrust::Models::ChatCompletionMessageToolCall::Type]
      required :type, enum: -> { Braintrust::Models::ChatCompletionMessageToolCall::Type }

      # @!parse
      #   # @param id [String]
      #   # @param function [Braintrust::Models::ChatCompletionMessageToolCall::Function]
      #   # @param type [Symbol, Braintrust::Models::ChatCompletionMessageToolCall::Type]
      #   #
      #   def initialize(id:, function:, type:, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @see Braintrust::Models::ChatCompletionMessageToolCall#function
      class Function < Braintrust::BaseModel
        # @!attribute arguments
        #
        #   @return [String]
        required :arguments, String

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!parse
        #   # @param arguments [String]
        #   # @param name [String]
        #   #
        #   def initialize(arguments:, name:, **) = super

        # def initialize: (Hash | Braintrust::BaseModel) -> void
      end

      # @see Braintrust::Models::ChatCompletionMessageToolCall#type
      module Type
        extend Braintrust::Enum

        FUNCTION = :function

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
