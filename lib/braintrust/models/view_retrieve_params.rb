# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Views#retrieve
    class ViewRetrieveParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute object_id_
      #   The id of the object the ACL applies to
      #
      #   @return [String]
      required :object_id_, String, api_name: :object_id

      # @!attribute object_type
      #   The object type that the ACL applies to
      #
      #   @return [Symbol, Braintrust::Models::ACLObjectType]
      required :object_type, enum: -> { Braintrust::Models::ACLObjectType }

      # @!parse
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(object_id_:, object_type:, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
