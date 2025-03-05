# frozen_string_literal: true

module Braintrust
  module Models
    class User < Braintrust::BaseModel
      # @!attribute id
      #   Unique identifier for the user
      #
      #   @return [String]
      required :id, String

      # @!attribute avatar_url
      #   URL of the user's Avatar image
      #
      #   @return [String, nil]
      optional :avatar_url, String, nil?: true

      # @!attribute created
      #   Date of user creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute email
      #   The user's email
      #
      #   @return [String, nil]
      optional :email, String, nil?: true

      # @!attribute family_name
      #   Family name of the user
      #
      #   @return [String, nil]
      optional :family_name, String, nil?: true

      # @!attribute given_name
      #   Given name of the user
      #
      #   @return [String, nil]
      optional :given_name, String, nil?: true

      # @!parse
      #   # @param id [String]
      #   # @param avatar_url [String, nil]
      #   # @param created [Time, nil]
      #   # @param email [String, nil]
      #   # @param family_name [String, nil]
      #   # @param given_name [String, nil]
      #   #
      #   def initialize(id:, avatar_url: nil, created: nil, email: nil, family_name: nil, given_name: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
