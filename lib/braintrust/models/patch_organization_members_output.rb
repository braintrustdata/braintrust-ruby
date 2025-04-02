# frozen_string_literal: true

module Braintrust
  module Models
    class PatchOrganizationMembersOutput < Braintrust::BaseModel
      # @!attribute org_id
      #   The id of the org that was modified.
      #
      #   @return [String]
      required :org_id, String

      # @!attribute status
      #
      #   @return [Symbol, Braintrust::Models::PatchOrganizationMembersOutput::Status]
      required :status, enum: -> { Braintrust::Models::PatchOrganizationMembersOutput::Status }

      # @!attribute send_email_error
      #   If invite emails failed to send for some reason, the patch operation will still
      #     complete, but we will return an error message here
      #
      #   @return [String, nil]
      optional :send_email_error, String, nil?: true

      # @!parse
      #   # @param org_id [String]
      #   # @param status [Symbol, Braintrust::Models::PatchOrganizationMembersOutput::Status]
      #   # @param send_email_error [String, nil]
      #   #
      #   def initialize(org_id:, status:, send_email_error: nil, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @see Braintrust::Models::PatchOrganizationMembersOutput#status
      module Status
        extend Braintrust::Enum

        SUCCESS = :success

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
