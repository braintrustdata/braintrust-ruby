# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::AISecrets#update
    class AISecretUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute metadata
      #
      #   @return [Hash{Symbol=>Object, nil}, nil]
      optional :metadata, Braintrust::HashOf[Braintrust::Unknown, nil?: true], nil?: true

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

      # @!parse
      #   # @param metadata [Hash{Symbol=>Object, nil}, nil]
      #   # @param name [String, nil]
      #   # @param secret [String, nil]
      #   # @param type [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(metadata: nil, name: nil, secret: nil, type: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
