# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::AISecrets#update
    class AISecretUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata,
               Braintrust::Internal::Type::HashOf[Braintrust::Internal::Type::Unknown, nil?: true],
               nil?: true

      # @!attribute name
      #   Name of the AI secret
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute secret
      #
      #   @return [String, nil]
      optional :secret, String, nil?: true

      # @!attribute type
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!method initialize(metadata: nil, name: nil, secret: nil, type: nil, request_options: {})
      #   @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   @param name [String, nil]
      #   @param secret [String, nil]
      #   @param type [String, nil]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
