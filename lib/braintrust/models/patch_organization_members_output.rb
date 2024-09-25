# frozen_string_literal: true

module Braintrust
  module Models
    class PatchOrganizationMembersOutput < BaseModel
      # @!attribute [rw] status
      #   One of the constants defined in {Braintrust::Models::PatchOrganizationMembersOutput::Status}
      #   @return [Symbol]
      required :status, enum: -> { Braintrust::Models::PatchOrganizationMembersOutput::Status }

      # @!attribute [rw] send_email_error
      #   If invite emails failed to send for some reason, the patch operation will still complete, but we will return an error message here
      #   @return [String]
      optional :send_email_error, String

      class Status < Braintrust::Enum
        SUCCESS = :success
      end
    end
  end
end
