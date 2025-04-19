# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::ProjectTags#update
    class ProjectTagUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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

      # @!attribute name
      #   Name of the project tag
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!method initialize(color: nil, description: nil, name: nil, request_options: {})
      #   @param color [String, nil]
      #   @param description [String, nil]
      #   @param name [String, nil]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
