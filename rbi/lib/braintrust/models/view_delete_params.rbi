# typed: strong

module Braintrust
  module Models
    class ViewDeleteParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # The id of the object the view applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
      attr_accessor :object_type

      sig do
        params(
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        # The id of the object the view applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        request_options: {}
      ); end
      sig do
        override
          .returns(
            {
              object_id_: String,
              object_type: Braintrust::Models::ACLObjectType::OrSymbol,
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash; end
    end
  end
end
