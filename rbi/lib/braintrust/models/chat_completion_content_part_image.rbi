# typed: strong

module Braintrust
  module Models
    class ChatCompletionContentPartImage < Braintrust::BaseModel
      sig { returns(Braintrust::Models::ChatCompletionContentPartImage::ImageURL) }
      def image_url
      end

      sig do
        params(_: T.any(Braintrust::Models::ChatCompletionContentPartImage::ImageURL, Braintrust::Util::AnyHash))
          .returns(T.any(Braintrust::Models::ChatCompletionContentPartImage::ImageURL, Braintrust::Util::AnyHash))
      end
      def image_url=(_)
      end

      sig { returns(Braintrust::Models::ChatCompletionContentPartImage::Type::OrSymbol) }
      def type
      end

      sig do
        params(_: Braintrust::Models::ChatCompletionContentPartImage::Type::OrSymbol)
          .returns(Braintrust::Models::ChatCompletionContentPartImage::Type::OrSymbol)
      end
      def type=(_)
      end

      sig do
        params(
          image_url: Braintrust::Models::ChatCompletionContentPartImage::ImageURL,
          type: Braintrust::Models::ChatCompletionContentPartImage::Type::OrSymbol
        )
          .returns(T.attached_class)
      end
      def self.new(image_url:, type:)
      end

      sig do
        override
          .returns(
            {
              image_url: Braintrust::Models::ChatCompletionContentPartImage::ImageURL,
              type: Braintrust::Models::ChatCompletionContentPartImage::Type::OrSymbol
            }
          )
      end
      def to_hash
      end

      class ImageURL < Braintrust::BaseModel
        sig { returns(String) }
        def url
        end

        sig { params(_: String).returns(String) }
        def url=(_)
        end

        sig { returns(T.nilable(Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol)) }
        def detail
        end

        sig do
          params(_: Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol)
            .returns(Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol)
        end
        def detail=(_)
        end

        sig do
          params(
            url: String,
            detail: Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol
          )
            .returns(T.attached_class)
        end
        def self.new(url:, detail: nil)
        end

        sig do
          override
            .returns(
              {url: String, detail: Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol}
            )
        end
        def to_hash
        end

        module Detail
          extend Braintrust::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail) }
          OrSymbol =
            T.type_alias { T.any(Symbol, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::TaggedSymbol) }

          AUTO = T.let(:auto, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol)
          LOW = T.let(:low, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol)
          HIGH = T.let(:high, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol)
        end
      end

      module Type
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ChatCompletionContentPartImage::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, Braintrust::Models::ChatCompletionContentPartImage::Type::TaggedSymbol) }

        IMAGE_URL = T.let(:image_url, Braintrust::Models::ChatCompletionContentPartImage::Type::OrSymbol)
      end
    end
  end
end
