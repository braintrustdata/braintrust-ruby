# frozen_string_literal: true

module Braintrust
  module Models
    class APIKey < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the api key
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the api key
      #
      #   @return [String]
      required :name, String

      # @!attribute preview_name
      #
      #   @return [String]
      required :preview_name, String

      # @!attribute created
      #   Date of api key creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute org_id
      #   Unique identifier for the organization
      #
      #   @return [String, nil]
      optional :org_id, String, nil?: true

      # @!attribute user_id
      #   Unique identifier for the user
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!parse
      #   # @param id [String]
      #   # @param name [String]
      #   # @param preview_name [String]
      #   # @param created [Time, nil]
      #   # @param org_id [String, nil]
      #   # @param user_id [String, nil]
      #   #
      #   def initialize(id:, name:, preview_name:, created: nil, org_id: nil, user_id: nil, **) = super

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void
    end
  end
end
