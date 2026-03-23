# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::ProjectTags#delete
    class ProjectTagDeleteParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
