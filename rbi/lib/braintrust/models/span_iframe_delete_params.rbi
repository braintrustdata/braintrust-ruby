# typed: strong

module Braintrust
  module Models
    class SpanIframeDeleteParams < Braintrust::BaseModel
      extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig do
        params(request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash))
          .returns(T.attached_class)
      end
      def self.new(request_options: {})
      end

      sig { override.returns({request_options: Braintrust::RequestOptions}) }
      def to_hash
      end
    end
  end
end
