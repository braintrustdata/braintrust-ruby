# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Projects#update
    class ProjectUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute name
      #   Name of the project
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute settings
      #   Project settings. Patch operations replace all settings, so make sure you
      #     include all settings you want to keep.
      #
      #   @return [Braintrust::Models::ProjectSettings, nil]
      optional :settings, -> { Braintrust::Models::ProjectSettings }, nil?: true

      # @!parse
      #   # @param name [String, nil]
      #   # @param settings [Braintrust::Models::ProjectSettings, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(name: nil, settings: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
