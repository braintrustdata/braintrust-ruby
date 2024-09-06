# frozen_string_literal: true

module Braintrust
  module Models
    class MemberUpdateResponse < BaseModel
      # @!attribute [rw] status
      #   @return [Symbol]
      required :status, Braintrust::Enum.new(:success)

      # @!attribute [rw] send_email_error
      #   If invite emails failed to send for some reason, the patch operation will still complete, but we will return an error message here
      #   @return [String]
      optional :send_email_error, String
    end
  end
end
