# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::APIKeys#create
    class APIKeyCreateParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the api key. Does not have to be unique
      #
      #   @return [String]
      required :name, String

      # @!attribute org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the API key belongs in.
      #
      #   @return [String, nil]
      optional :org_name, String, nil?: true

      # @!method initialize(name:, org_name: nil, request_options: {})
      #   @param name [String]
      #   @param org_name [String, nil]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
