# frozen_string_literal: true

module Braintrust
  module Models
    class CreateProject < BaseModel
      # @!attribute [rw] name_
      #   Name of the project
      #   @return [String]
      required :name_, String

      # @!attribute [rw] org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case that your API key belongs to multiple organizations, you may specify the name of the organization the project belongs in.
      #   @return [String]
      optional :org_name, String
    end
  end
end
