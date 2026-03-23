# typed: strong

module Braintrust
  module Models
    class SpanIframeDeleteParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Braintrust::SpanIframeDeleteParams,
            Braintrust::Internal::AnyHash
          )
        end

      sig do
        params(request_options: Braintrust::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Braintrust::RequestOptions }) }
      def to_hash
      end
    end
  end
end
