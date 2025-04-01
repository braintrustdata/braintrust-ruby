# frozen_string_literal: true

module Braintrust
  module Models
    class ProjectTagUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

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

      # @!parse
      #   # @param color [String, nil]
      #   # @param description [String, nil]
      #   # @param name [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(color: nil, description: nil, name: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
