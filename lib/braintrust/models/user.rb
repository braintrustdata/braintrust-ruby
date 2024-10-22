# frozen_string_literal: true

module Braintrust
  module Models
    class User < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the user
      #   @return [String]
      required :id, String

      # @!attribute [rw] avatar_url
      #   URL of the user's Avatar image
      #   @return [String]
      optional :avatar_url, String

      # @!attribute [rw] created
      #   Date of user creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] email
      #   The user's email
      #   @return [String]
      optional :email, String

      # @!attribute [rw] family_name
      #   Family name of the user
      #   @return [String]
      optional :family_name, String

      # @!attribute [rw] given_name
      #   Given name of the user
      #   @return [String]
      optional :given_name, String

      # @!parse
      #   # Create a new instance of User from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the user
      #   #   @option data [String, nil] :avatar_url URL of the user's Avatar image
      #   #   @option data [String, nil] :created Date of user creation
      #   #   @option data [String, nil] :email The user's email
      #   #   @option data [String, nil] :family_name Family name of the user
      #   #   @option data [String, nil] :given_name Given name of the user
      #   def initialize(data = {}) = super
    end
  end
end
