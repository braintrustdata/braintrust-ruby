# frozen_string_literal: true

module Braintrust
  module Models
    class ChatCompletionContentPartImage < BaseModel
      # @!attribute [rw] image_url
      #   @return [Braintrust::Models::ChatCompletionContentPartImage::ImageURL]
      required :image_url, -> { Braintrust::Models::ChatCompletionContentPartImage::ImageURL }

      # @!attribute [rw] type
      #   @return [Symbol, Braintrust::Models::ChatCompletionContentPartImage::Type]
      required :type, enum: -> { Braintrust::Models::ChatCompletionContentPartImage::Type }

      class ImageURL < BaseModel
        # @!attribute [rw] url
        #   @return [String]
        required :url, String

        # @!attribute [rw] detail
        #   @return [Symbol, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail]
        optional :detail, enum: -> { Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail }

        class Detail < Braintrust::Enum
          AUTO = :auto
          LOW = :low
          HIGH = :high
        end

        # @!parse
        #   # Create a new instance of ImageURL from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :url
        #   #   @option data [String, nil] :detail
        #   def initialize(data = {}) = super
      end

      class Type < Braintrust::Enum
        IMAGE_URL = :image_url
      end

      # @!parse
      #   # Create a new instance of ChatCompletionContentPartImage from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Object] :image_url
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
