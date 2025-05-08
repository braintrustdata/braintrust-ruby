# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionContentPartImage < Braintrust::Internal::Type::BaseModel
      # @!attribute image_url
      #
      #   @return [Braintrust::ChatCompletionContentPartImage::ImageURL]
      required :image_url, -> { Braintrust::ChatCompletionContentPartImage::ImageURL }

      # @!attribute type
      #
      #   @return [Symbol, Braintrust::ChatCompletionContentPartImage::Type]
      required :type, enum: -> { Braintrust::ChatCompletionContentPartImage::Type }

      # @!method initialize(image_url:, type:)
      #   @param image_url [Braintrust::ChatCompletionContentPartImage::ImageURL]
      #   @param type [Symbol, Braintrust::ChatCompletionContentPartImage::Type]

      # @see Braintrust::ChatCompletionContentPartImage#image_url
      class ImageURL < Braintrust::Internal::Type::BaseModel
        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!attribute detail
        #
        #   @return [Symbol, Braintrust::ChatCompletionContentPartImage::ImageURL::Detail, nil]
        optional :detail, enum: -> { Braintrust::ChatCompletionContentPartImage::ImageURL::Detail }

        # @!method initialize(url:, detail: nil)
        #   @param url [String]
        #   @param detail [Symbol, Braintrust::ChatCompletionContentPartImage::ImageURL::Detail]

        # @see Braintrust::ChatCompletionContentPartImage::ImageURL#detail
        module Detail
          extend Braintrust::Internal::Type::Enum

          AUTO = :auto
          LOW = :low
          HIGH = :high

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Braintrust::ChatCompletionContentPartImage#type
      module Type
        extend Braintrust::Internal::Type::Enum

        IMAGE_URL = :image_url

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
