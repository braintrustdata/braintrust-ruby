# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Projects#create
    class ProjectCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the project
      #
      #   @return [String]
      required :name, String

      # @!attribute org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the project belongs in.
      #
      #   @return [String, nil]
      optional :org_name, String, nil?: true

      # @!method initialize(name:, org_name: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::ProjectCreateParams} for more details.
      #
      #   @param name [String] Name of the project
      #
      #   @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
