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
      required :name_, String, api_name: :name

      # @!attribute [rw] api_url
      #   @return [String]
      optional :api_url, String

      # @!attribute [rw] created
      #   Date of organization creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] is_universal_api
      #   @return [Boolean]
      optional :is_universal_api, Braintrust::BooleanModel

      # @!attribute [rw] proxy_url
      #   @return [String]
      optional :proxy_url, String

      # @!attribute [rw] realtime_url
      #   @return [String]
      optional :realtime_url, String

      # @!parse
      #   # Create a new instance of Organization from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the organization
      #   #   @option data [String] :name Name of the organization
      #   #   @option data [String, nil] :api_url
      #   #   @option data [String, nil] :created Date of organization creation
      #   #   @option data [Hash, nil] :is_universal_api
      #   #   @option data [String, nil] :proxy_url
      #   #   @option data [String, nil] :realtime_url
      #   def initialize(data = {}) = super
    end
  end
end
