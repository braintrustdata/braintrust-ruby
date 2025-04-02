# typed: strong

module Braintrust
  module Models
    class ChatCompletionContentPartImage < Braintrust::BaseModel
      sig { returns(Braintrust::Models::ChatCompletionContentPartImage::ImageURL) }
      attr_reader :image_url

      sig do
        params(
          image_url: T.any(Braintrust::Models::ChatCompletionContentPartImage::ImageURL, Braintrust::Util::AnyHash)
        )
          .void
      end
      attr_writer :image_url

      sig { returns(Braintrust::Models::ChatCompletionContentPartImage::Type::OrSymbol) }
      attr_accessor :type

      sig do
        params(
          image_url: T.any(Braintrust::Models::ChatCompletionContentPartImage::ImageURL, Braintrust::Util::AnyHash),
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
        attr_accessor :url

        sig { returns(T.nilable(Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol)) }
        attr_reader :detail

        sig { params(detail: Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol).void }
        attr_writer :detail

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
            T.type_alias { T.any(Symbol, String, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::TaggedSymbol) }

          AUTO = T.let(:auto, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::TaggedSymbol)
          LOW = T.let(:low, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::TaggedSymbol)
          HIGH = T.let(:high, Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::TaggedSymbol)

          sig do
            override
              .returns(T::Array[Braintrust::Models::ChatCompletionContentPartImage::ImageURL::Detail::TaggedSymbol])
          end
          def self.values
          end
        end
      end

      module Type
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ChatCompletionContentPartImage::Type) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Braintrust::Models::ChatCompletionContentPartImage::Type::TaggedSymbol) }

        IMAGE_URL = T.let(:image_url, Braintrust::Models::ChatCompletionContentPartImage::Type::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::ChatCompletionContentPartImage::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
