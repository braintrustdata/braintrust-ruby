# typed: strong

module Braintrust
  module Models
    class OrganizationRetrieveParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { params(request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])).void }
      def initialize(request_options: {})
      end

      sig { override.returns({request_options: Braintrust::RequestOptions}) }
      def to_hash
      end
    end
  end
end
