# frozen_string_literal: true

module Braintrust
  module Models
    class PromptOptions < Braintrust::BaseModel
      # @!attribute [rw] model
      #   @return [String]
      optional :model, String

      # @!attribute [rw] params
      #   @return [Braintrust::Models::PromptOptions::Params::UnnamedTypeWithunionParent13, Braintrust::Models::PromptOptions::Params::UnnamedTypeWithunionParent14, Braintrust::Models::PromptOptions::Params::UnnamedTypeWithunionParent15, Braintrust::Models::PromptOptions::Params::UnnamedTypeWithunionParent16, Braintrust::Models::PromptOptions::Params::UnnamedTypeWithunionParent17]
      optional :params, Braintrust::Unknown

      # @!attribute [rw] position
      #   @return [String]
      optional :position, String

      # @!parse
      #   # Create a new instance of PromptOptions from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String, nil] :model
      #   #   @option data [Object, nil] :params
      #   #   @option data [String, nil] :position
      #   def initialize(data = {}) = super
    end
  end
end
