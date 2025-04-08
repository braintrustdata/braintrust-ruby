# typed: strong

module Braintrust
  module Models
    class DatasetDeleteParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      sig do
        params(request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash))
          .returns(T.attached_class)
      end
      def self.new(request_options: {}); end

      sig { override.returns({request_options: Braintrust::RequestOptions}) }
      def to_hash; end
    end
  end
end
