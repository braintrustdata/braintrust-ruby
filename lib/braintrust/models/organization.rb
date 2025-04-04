# frozen_string_literal: true

module Braintrust
  module Models
    class Organization < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the organization
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the organization
      #
      #   @return [String]
      required :name, String

      # @!attribute api_url
      #
      #   @return [String, nil]
      optional :api_url, String, nil?: true

      # @!attribute created
      #   Date of organization creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute is_universal_api
      #
      #   @return [Boolean, nil]
      optional :is_universal_api, Braintrust::Internal::Type::BooleanModel, nil?: true

      # @!attribute proxy_url
      #
      #   @return [String, nil]
      optional :proxy_url, String, nil?: true

      # @!attribute realtime_url
      #
      #   @return [String, nil]
      optional :realtime_url, String, nil?: true

      # @!parse
      #   # @param id [String]
      #   # @param name [String]
      #   # @param api_url [String, nil]
      #   # @param created [Time, nil]
      #   # @param is_universal_api [Boolean, nil]
      #   # @param proxy_url [String, nil]
      #   # @param realtime_url [String, nil]
      #   #
      #   def initialize(id:, name:, api_url: nil, created: nil, is_universal_api: nil, proxy_url: nil, realtime_url: nil, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
