# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::AISecrets#replace
    class AISecretReplaceParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the AI secret
      #
      #   @return [String]
      required :name, String

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the AI Secret belongs in.
      #
      #   @return [String, nil]
      optional :org_name, String, nil?: true

      # @!attribute secret
      #   Secret value. If omitted in a PUT request, the existing secret value will be
      #   left intact, not replaced with null.
      #
      #   @return [String, nil]
      optional :secret, String, nil?: true

      # @!attribute type
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!method initialize(name:, metadata: nil, org_name: nil, secret: nil, type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::AISecretReplaceParams} for more details.
      #
      #   @param name [String] Name of the AI secret
      #
      #   @param metadata [Hash{Symbol=>Object, nil}, nil]
      #
      #   @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
      #   ...
      #
      #   @param secret [String, nil] Secret value. If omitted in a PUT request, the existing secret value will be lef
      #   ...
      #
      #   @param type [String, nil]
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
