# typed: strong

module Braintrust
  module Models
    class PatchOrganizationMembersOutput < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Braintrust::PatchOrganizationMembersOutput,
            Braintrust::Internal::AnyHash
          )
        end

      # The id of the org that was modified.
      sig { returns(String) }
      attr_accessor :org_id

      sig do
        returns(
          Braintrust::PatchOrganizationMembersOutput::Status::TaggedSymbol
        )
      end
      attr_accessor :status

      # If invite emails failed to send for some reason, the patch operation will still
      # complete, but we will return an error message here
      sig { returns(T.nilable(String)) }
      attr_accessor :send_email_error

      sig do
        params(
          org_id: String,
          status: Braintrust::PatchOrganizationMembersOutput::Status::OrSymbol,
          send_email_error: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The id of the org that was modified.
        org_id:,
        status:,
        # If invite emails failed to send for some reason, the patch operation will still
        # complete, but we will return an error message here
        send_email_error: nil
      )
      end

      sig do
        override.returns(
          {
            org_id: String,
            status:
              Braintrust::PatchOrganizationMembersOutput::Status::TaggedSymbol,
            send_email_error: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      module Status
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Braintrust::PatchOrganizationMembersOutput::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SUCCESS =
          T.let(
            :success,
            Braintrust::PatchOrganizationMembersOutput::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Braintrust::PatchOrganizationMembersOutput::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
