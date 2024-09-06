# frozen_string_literal: true

module Braintrust
  module Models
    class APIKey < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the api key
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the api key
      #   @return [String]
      required :name_, String

      # @!attribute [rw] preview_name
      #   @return [String]
      required :preview_name, String

      # @!attribute [rw] created
      #   Date of api key creation
      #   @return [String]
      optional :created, String

      # @!attribute [rw] org_id
      #   Unique identifier for the organization
      #   @return [String]
      optional :org_id, String

      # @!attribute [rw] user_id
      #   Unique identifier for the user
      #   @return [String]
      optional :user_id, String
    end
  end
end
