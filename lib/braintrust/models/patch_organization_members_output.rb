# frozen_string_literal: true

module Braintrust
  module Models
    class PatchOrganizationMembersOutput < BaseModel
      # @!attribute [rw] status
      #   @return [Symbol, Braintrust::Models::PatchOrganizationMembersOutput::Status]
      required :status, enum: -> { Braintrust::Models::PatchOrganizationMembersOutput::Status }

      # @!attribute [rw] send_email_error
      #   If invite emails failed to send for some reason, the patch operation will still complete, but we will return an error message here
      #   @return [String]
      optional :send_email_error, String

      class Status < Braintrust::Enum
        SUCCESS = :success
      end

      # @!parse
      #   # Create a new instance of PatchOrganizationMembersOutput from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :status
      #   #   @option data [String, nil] :send_email_error If invite emails failed to send for some reason, the patch operation will still
      #   #     complete, but we will return an error message here
      #   def initialize(data = {}) = super
    end
  end
end
