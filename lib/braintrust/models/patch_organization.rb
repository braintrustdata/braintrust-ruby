# frozen_string_literal: true

module Braintrust
  module Models
    class PatchOrganization < BaseModel
      # @!attribute [rw] api_url
      #   @return [String]
      optional :api_url, String

      # @!attribute [rw] is_universal_api
      #   @return [Boolean]
      optional :is_universal_api, Braintrust::BooleanModel

      # @!attribute [rw] name_
      #   Name of the organization
      #   @return [String]
      optional :name_, String

      # @!attribute [rw] proxy_url
      #   @return [String]
      optional :proxy_url, String

      # @!attribute [rw] realtime_url
      #   @return [String]
      optional :realtime_url, String
    end
  end
end
