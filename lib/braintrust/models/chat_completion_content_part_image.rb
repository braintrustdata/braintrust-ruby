# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionContentPartImage < BaseModel
      # @!attribute [rw] image_url
      #   @return [Braintrust::Models::ChatCompletionContentPartImage::ImageURL]
      required :image_url, -> { Braintrust::Models::ChatCompletionContentPartImage::ImageURL }

      # @!attribute [rw] type
      #   One of the constants defined in {Braintrust::Models::ChatCompletionContentPartImage::Type}
      #   @return [Symbol]
      required :type, enum: -> { Braintrust::Models::ChatCompletionContentPartImage::Type }

      class ImageURL < BaseModel
        # @!attribute [rw] url
        #   @return [String]
        required :url, String

        # @!attribute [rw] detail
        #   One of the constants defined in {Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail}
        #   @return [Symbol]
        optional :detail, enum: -> { Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail }

        class Detail < Braintrust::Enum
          AUTO = :auto
          LOW = :low
          HIGH = :high
        end
      end

      class Type < Braintrust::Enum
        IMAGE_URL = :image_url
      end
    end
  end
end
