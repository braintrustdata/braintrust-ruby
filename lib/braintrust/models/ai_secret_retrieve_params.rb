# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::AISecrets#retrieve
    class AISecretRetrieveParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!parse
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
