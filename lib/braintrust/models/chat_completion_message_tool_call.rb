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
      #   @return [Symbol, Braintrust::Models::ChatCompletionMessageToolCall::Type]
      required :type, enum: -> { Braintrust::Models::ChatCompletionMessageToolCall::Type }

      class Function < BaseModel
        # @!attribute [rw] arguments
        #   @return [String]
        required :arguments, String

        # @!attribute [rw] name_
        #   @return [String]
        required :name_, String, api_name: :name

        # @!parse
        #   # Create a new instance of Function from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :arguments
        #   #   @option data [String] :name
        #   def initialize(data = {}) = super
      end

      class Type < Braintrust::Enum
        FUNCTION = :function
      end

      # @!parse
      #   # Create a new instance of ChatCompletionMessageToolCall from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id
      #   #   @option data [Object] :function
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
