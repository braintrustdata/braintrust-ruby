# typed: strong

module Braintrust
  module Models
    class PatchOrganizationMembersOutput < Braintrust::BaseModel
      # The id of the org that was modified.
      sig { returns(String) }
      def org_id
      end

      sig { params(_: String).returns(String) }
      def org_id=(_)
      end

      sig { returns(Braintrust::Models::PatchOrganizationMembersOutput::Status::TaggedSymbol) }
      def status
      end

      sig do
        params(_: Braintrust::Models::PatchOrganizationMembersOutput::Status::TaggedSymbol)
          .returns(Braintrust::Models::PatchOrganizationMembersOutput::Status::TaggedSymbol)
      end
      def status=(_)
      end

      # If invite emails failed to send for some reason, the patch operation will still
      #   complete, but we will return an error message here
      sig { returns(T.nilable(String)) }
      def send_email_error
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def send_email_error=(_)
      end

      sig do
        params(
          org_id: String,
          status: Braintrust::Models::PatchOrganizationMembersOutput::Status::TaggedSymbol,
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
