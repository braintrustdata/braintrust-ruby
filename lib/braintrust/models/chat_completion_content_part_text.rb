# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionContentPartText < Braintrust::BaseModel
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

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # @example
      # ```ruby
      # case type
      # in :text
      #   # ...
      # end
      # ```
      class Type < Braintrust::Enum
        TEXT = :text

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end
    end
  end
end
