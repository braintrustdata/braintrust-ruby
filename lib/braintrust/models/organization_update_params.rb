# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Organizations#update
    class OrganizationUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute api_url
      #
      #   @return [String, nil]
      optional :api_url, String, nil?: true

      # @!attribute is_universal_api
      #
      #   @return [Boolean, nil]
      optional :is_universal_api, Braintrust::BooleanModel, nil?: true

      # @!attribute name
      #   Name of the organization
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute proxy_url
      #
      #   @return [String, nil]
      optional :proxy_url, String, nil?: true

      # @!attribute realtime_url
      #
      #   @return [String, nil]
      optional :realtime_url, String, nil?: true

      # @!parse
      #   # @param api_url [String, nil]
      #   # @param is_universal_api [Boolean, nil]
      #   # @param name [String, nil]
      #   # @param proxy_url [String, nil]
      #   # @param realtime_url [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(api_url: nil, is_universal_api: nil, name: nil, proxy_url: nil, realtime_url: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
