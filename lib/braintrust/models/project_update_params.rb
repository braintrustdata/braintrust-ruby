# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Projects#update
    class ProjectUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the project
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute settings
      #   Project settings. Patch operations replace all settings, so make sure you
      #   include all settings you want to keep.
      #
      #   @return [Braintrust::Models::ProjectSettings, nil]
      optional :settings, -> { Braintrust::ProjectSettings }, nil?: true

      # @!method initialize(name: nil, settings: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::ProjectUpdateParams} for more details.
      #
      #   @param name [String, nil] Name of the project
      #
      #   @param settings [Braintrust::Models::ProjectSettings, nil] Project settings. Patch operations replace all settings, so make sure you includ
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
