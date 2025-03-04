# frozen_string_literal: true

module Braintrust
  module Models
    class AISecretReplaceParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute name
      #   Name of the AI secret
      #
      #   @return [String]
      required :name, String

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata, Braintrust::HashOf[Braintrust::Unknown, nil?: true], nil?: true

      # @!attribute org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the AI Secret belongs in.
      #
      #   @return [String, nil]
      optional :org_name, String, nil?: true

      # @!attribute secret
      #   Secret value. If omitted in a PUT request, the existing secret value will be
      #     left intact, not replaced with null.
      #
      #   @return [String, nil]
      optional :secret, String, nil?: true

      # @!attribute type
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!parse
      #   # @param name [String]
      #   # @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   # @param org_name [String, nil]
      #   # @param secret [String, nil]
      #   # @param type [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(name:, metadata: nil, org_name: nil, secret: nil, type: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
