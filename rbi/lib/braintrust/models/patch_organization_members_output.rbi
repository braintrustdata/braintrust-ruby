# typed: strong

module Braintrust
  module Models
    class PatchOrganizationMembersOutput < Braintrust::BaseModel
      # The id of the org that was modified.
      sig { returns(String) }
      attr_accessor :org_id

      sig { returns(Braintrust::Models::PatchOrganizationMembersOutput::Status::TaggedSymbol) }
      attr_accessor :status

      # If invite emails failed to send for some reason, the patch operation will still
      #   complete, but we will return an error message here
      sig { returns(T.nilable(String)) }
      attr_accessor :send_email_error

      sig do
        params(
          org_id: String,
          status: Braintrust::Models::PatchOrganizationMembersOutput::Status::OrSymbol,
          send_email_error: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(org_id:, status:, send_email_error: nil)
      end

      sig do
        override
          .returns(
            {
              org_id: String,
              status: Braintrust::Models::PatchOrganizationMembersOutput::Status::TaggedSymbol,
              send_email_error: T.nilable(String)
            }
          )
      end
      def to_hash
      end

      module Status
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PatchOrganizationMembersOutput::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, Braintrust::Models::PatchOrganizationMembersOutput::Status::TaggedSymbol) }

        SUCCESS = T.let(:success, Braintrust::Models::PatchOrganizationMembersOutput::Status::TaggedSymbol)

        class << self
          sig { override.returns(T::Array[Braintrust::Models::PatchOrganizationMembersOutput::Status::TaggedSymbol]) }
          def values
          end
        end
      end
    end
  end
end
