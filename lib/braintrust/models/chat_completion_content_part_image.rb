# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionContentPartImage < Braintrust::BaseModel
      # @!attribute image_url
      #
      #   @return [Braintrust::Models::ChatCompletionContentPartImage::ImageURL]
      required :image_url, -> { Braintrust::Models::ChatCompletionContentPartImage::ImageURL }

      # @!attribute type
      #
      #   @return [Symbol, Braintrust::Models::ChatCompletionContentPartImage::Type]
      required :type, enum: -> { Braintrust::Models::ChatCompletionContentPartImage::Type }

      # @!parse
      #   # @param image_url [Braintrust::Models::ChatCompletionContentPartImage::ImageURL]
      #   # @param type [Symbol, Braintrust::Models::ChatCompletionContentPartImage::Type]
      #   #
      #   def initialize(image_url:, type:, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      class ImageURL < Braintrust::BaseModel
        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!attribute [r] detail
        #
        #   @return [Symbol, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail, nil]
        optional :detail, enum: -> { Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail }

        # @!parse
        #   # @return [Symbol, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail]
        #   attr_writer :detail

        # @!parse
        #   # @param url [String]
        #   # @param detail [Symbol, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail]
        #   #
        #   def initialize(url:, detail: nil, **) = super

        # def initialize: (Hash | Braintrust::BaseModel) -> void

        module Detail
          extend Braintrust::Enum

          AUTO = :auto
          LOW = :low
          HIGH = :high

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      module Type
        extend Braintrust::Enum

        IMAGE_URL = :image_url

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
