# frozen_string_literal: true

module Braintrust
  module Models
    class EnvVarListResponse < BaseModel
      # @!attribute [rw] objects
      #   A list of env_var objects
      #   @return [Array<Braintrust::Models::EnvVar>]
      required :objects, Braintrust::ArrayOf.new(-> { Braintrust::Models::EnvVar })

      # @!parse
      #   # Create a new instance of EnvVarListResponse from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Array<Object>] :objects A list of env_var objects
      #   def initialize(data = {}) = super
    end
  end
end
