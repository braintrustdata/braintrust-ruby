# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::AISecrets#find_and_delete
    class AISecretFindAndDeleteParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the AI secret
      #
      #   @return [String]
      required :name, String

      # @!attribute org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the AI Secret belongs in.
      #
      #   @return [String, nil]
      optional :org_name, String, nil?: true

      # @!method initialize(name:, org_name: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::AISecretFindAndDeleteParams} for more details.
      #
      #   @param name [String] Name of the AI secret
      #
      #   @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
