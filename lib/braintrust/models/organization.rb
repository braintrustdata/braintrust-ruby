# frozen_string_literal: true

module Braintrust
  module Models
    class Organization < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the organization
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the organization
      #   @return [String]
      required :name_, String

      # @!attribute [rw] api_url
      #   @return [String]
      optional :api_url, String

      # @!attribute [rw] created
      #   Date of organization creation
      #   @return [String]
      optional :created, String

      # @!attribute [rw] is_universal_api
      #   @return [Boolean]
      optional :is_universal_api, Braintrust::BooleanModel

      # @!attribute [rw] proxy_url
      #   @return [String]
      optional :proxy_url, String

      # @!attribute [rw] realtime_url
      #   @return [String]
      optional :realtime_url, String
    end
  end
end
