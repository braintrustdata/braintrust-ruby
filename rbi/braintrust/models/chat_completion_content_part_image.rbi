# typed: strong

module Braintrust
  module Models
    class ChatCompletionContentPartImage < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Braintrust::ChatCompletionContentPartImage,
            Braintrust::Internal::AnyHash
          )
        end

      sig { returns(Braintrust::ChatCompletionContentPartImage::ImageURL) }
      attr_reader :image_url

      sig do
        params(
          image_url:
            Braintrust::ChatCompletionContentPartImage::ImageURL::OrHash
        ).void
      end
      attr_writer :image_url

      sig do
        returns(Braintrust::ChatCompletionContentPartImage::Type::OrSymbol)
      end
      attr_accessor :type

      sig do
        params(
          image_url:
            Braintrust::ChatCompletionContentPartImage::ImageURL::OrHash,
          type: Braintrust::ChatCompletionContentPartImage::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(image_url:, type:)
      end

      sig do
        override.returns(
          {
            image_url: Braintrust::ChatCompletionContentPartImage::ImageURL,
            type: Braintrust::ChatCompletionContentPartImage::Type::OrSymbol
          }
        )
      end
      def to_hash
      end

      class ImageURL < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Braintrust::ChatCompletionContentPartImage::ImageURL,
              Braintrust::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :url

        sig do
          returns(
            T.nilable(
              Braintrust::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol
            )
          )
        end
        attr_reader :detail

        sig do
          params(
            detail:
              Braintrust::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol
          ).void
        end
        attr_writer :detail

        sig do
          params(
            url: String,
            detail:
              Braintrust::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(url:, detail: nil)
        end

        sig do
          override.returns(
            {
              url: String,
              detail:
                Braintrust::ChatCompletionContentPartImage::ImageURL::Detail::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Detail
          extend Braintrust::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Braintrust::ChatCompletionContentPartImage::ImageURL::Detail
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AUTO =
            T.let(
              :auto,
              Braintrust::ChatCompletionContentPartImage::ImageURL::Detail::TaggedSymbol
            )
          LOW =
            T.let(
              :low,
              Braintrust::ChatCompletionContentPartImage::ImageURL::Detail::TaggedSymbol
            )
          HIGH =
            T.let(
              :high,
              Braintrust::ChatCompletionContentPartImage::ImageURL::Detail::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Braintrust::ChatCompletionContentPartImage::ImageURL::Detail::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module Type
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Braintrust::ChatCompletionContentPartImage::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        IMAGE_URL =
          T.let(
            :image_url,
            Braintrust::ChatCompletionContentPartImage::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Braintrust::ChatCompletionContentPartImage::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
