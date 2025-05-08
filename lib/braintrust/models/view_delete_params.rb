# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Views#delete
    class ViewDeleteParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute object_id_
      #   The id of the object the view applies to
      #
      #   @return [String]
      required :object_id_, String, api_name: :object_id

      # @!attribute object_type
      #   The object type that the ACL applies to
      #
      #   @return [Symbol, Braintrust::ACLObjectType]
      required :object_type, enum: -> { Braintrust::ACLObjectType }

      # @!method initialize(object_id_:, object_type:, request_options: {})
      #   @param object_id_ [String] The id of the object the view applies to
      #
      #   @param object_type [Symbol, Braintrust::ACLObjectType] The object type that the ACL applies to
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
