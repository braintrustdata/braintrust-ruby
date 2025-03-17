# typed: strong

module Braintrust
  module Models
    class ChatCompletionContentPartImage < Braintrust::BaseModel
      sig { returns(Braintrust::Models::ChatCompletionContentPartImage::ImageURL) }
      def image_url
      end

      sig do
        params(_: Braintrust::Models::ChatCompletionContentPartImage::ImageURL)
          .returns(Braintrust::Models::ChatCompletionContentPartImage::ImageURL)
      end
      def image_url=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig do
        params(image_url: Braintrust::Models::ChatCompletionContentPartImage::ImageURL, type: Symbol)
          .returns(T.attached_class)
      end
      def self.new(image_url:, type:)
      end

      sig { override.returns({image_url: Braintrust::Models::ChatCompletionContentPartImage::ImageURL, type: Symbol}) }
      def to_hash
      end

      class ImageURL < Braintrust::BaseModel
        sig { returns(String) }
        def url
        end

        sig { params(_: String).returns(String) }
        def url=(_)
        end

        sig { returns(T.nilable(Symbol)) }
        def detail
        end

        sig { params(_: Symbol).returns(Symbol) }
        def detail=(_)
        end

        sig { params(url: String, detail: Symbol).returns(T.attached_class) }
        def self.new(url:, detail: nil)
        end

        sig { override.returns({url: String, detail: Symbol}) }
        def to_hash
        end

        class Detail < Braintrust::Enum
          abstract!

          Value = type_template(:out) { {fixed: Symbol} }

          AUTO = :auto
          LOW = :low
          HIGH = :high
        end
      end

      class Type < Braintrust::Enum
        abstract!

        Value = type_template(:out) { {fixed: Symbol} }

        IMAGE_URL = :image_url
      end
    end
  end
end
