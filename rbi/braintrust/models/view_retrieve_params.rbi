# typed: strong

module Braintrust
  module Models
    class ViewRetrieveParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Braintrust::ViewRetrieveParams, Braintrust::Internal::AnyHash)
        end

      # The id of the object the ACL applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::ACLObjectType::OrSymbol) }
      attr_accessor :object_type

      sig do
        params(
          object_id_: String,
          object_type: Braintrust::ACLObjectType::OrSymbol,
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The id of the object the ACL applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            object_id_: String,
            object_type: Braintrust::ACLObjectType::OrSymbol,
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
