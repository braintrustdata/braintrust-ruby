# frozen_string_literal: true

module Braintrust
  module Models
    class EnvVarListResponse < BaseModel
      # @!attribute [rw] objects
      #   A list of env_var objects
      #   @return [Array<Braintrust::Models::EnvVar>]
      required :objects, Braintrust::ArrayOf.new(-> { Braintrust::Models::EnvVar })
    end
  end
end
