# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::ProjectTags#create
    class ProjectTagCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the project tag
      #
      #   @return [String]
      required :name, String

      # @!attribute project_id
      #   Unique identifier for the project that the project tag belongs under
      #
      #   @return [String]
      required :project_id, String

      # @!attribute color
      #   Color of the tag for the UI
      #
      #   @return [String, nil]
      optional :color, String, nil?: true

      # @!attribute description
      #   Textual description of the project tag
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!method initialize(name:, project_id:, color: nil, description: nil, request_options: {})
      #   @param name [String]
      #   @param project_id [String]
      #   @param color [String, nil]
      #   @param description [String, nil]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
