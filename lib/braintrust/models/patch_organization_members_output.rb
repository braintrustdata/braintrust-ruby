# frozen_string_literal: true

module Braintrust
  module Models
    class PatchOrganizationMembersOutput < Braintrust::Internal::Type::BaseModel
      # @!attribute org_id
      #   The id of the org that was modified.
      #
      #   @return [String]
      required :org_id, String

      # @!attribute status
      #
      #   @return [Symbol, Braintrust::PatchOrganizationMembersOutput::Status]
      required :status, enum: -> { Braintrust::PatchOrganizationMembersOutput::Status }

      # @!attribute send_email_error
      #   If invite emails failed to send for some reason, the patch operation will still
      #   complete, but we will return an error message here
      #
      #   @return [String, nil]
      optional :send_email_error, String, nil?: true

      # @!method initialize(org_id:, status:, send_email_error: nil)
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::PatchOrganizationMembersOutput} for more details.
      #
      #   @param org_id [String] The id of the org that was modified.
      #
      #   @param status [Symbol, Braintrust::PatchOrganizationMembersOutput::Status]
      #
      #   @param send_email_error [String, nil] If invite emails failed to send for some reason, the patch operation will still

      # @see Braintrust::PatchOrganizationMembersOutput#status
      module Status
        extend Braintrust::Internal::Type::Enum

        SUCCESS = :success

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
