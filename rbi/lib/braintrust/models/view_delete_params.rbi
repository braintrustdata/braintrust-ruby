# typed: strong

module Braintrust
  module Models
    class ViewDeleteParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # The id of the object the view applies to
      sig { returns(String) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      # The object type that the ACL applies to
      sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
      def object_type
      end

      sig do
        params(_: Braintrust::Models::ACLObjectType::OrSymbol).returns(Braintrust::Models::ACLObjectType::OrSymbol)
      end
      def object_type=(_)
      end

      sig do
        params(
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(object_id_:, object_type:, request_options: {})
      end

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
      def to_hash
      end
    end
  end
end
