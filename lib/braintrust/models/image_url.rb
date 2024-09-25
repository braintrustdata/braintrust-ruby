# frozen_string_literal: true

module Braintrust
  module Models
    class ImageURL < BaseModel
      # @!attribute [rw] url
      #   @return [String]
      required :url, String

      # @!attribute [rw] detail
      #   One of the constants defined in {Braintrust::Models::ImageURL::Detail}
      #   @return [Symbol]
      optional :detail, enum: -> { Braintrust::Models::ImageURL::Detail }

      class Detail < Braintrust::Enum
        AUTO = :auto
        LOW = :low
        HIGH = :high
      end
    end
  end
end
