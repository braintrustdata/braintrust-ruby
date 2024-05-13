# frozen_string_literal: true

module Ruby
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
      #   @return [String]
      optional :created, String

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
    end
  end
end
