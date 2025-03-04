# typed: strong

module Braintrust
  module Models
    module Organizations
      class MemberUpdateParams < Braintrust::BaseModel
        extend Braintrust::RequestParameters::Converter
        include Braintrust::RequestParameters

        sig { returns(T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers)) }
        def invite_users
        end

        sig do
          params(_: T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers))
            .returns(T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers))
        end
        def invite_users=(_)
        end

        sig { returns(T.nilable(String)) }
        def org_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def org_id=(_)
        end

        sig { returns(T.nilable(String)) }
        def org_name
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def org_name=(_)
        end

        sig { returns(T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers)) }
        def remove_users
        end

        sig do
          params(_: T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers))
            .returns(T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers))
        end
        def remove_users=(_)
        end

        sig do
          params(
            invite_users: T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers),
            org_id: T.nilable(String),
            org_name: T.nilable(String),
            remove_users: T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers),
            request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
          )
            .void
        end
        def initialize(invite_users: nil, org_id: nil, org_name: nil, remove_users: nil, request_options: {})
        end

        sig do
          override
            .returns(
              {
                invite_users: T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers),
                org_id: T.nilable(String),
                org_name: T.nilable(String),
                remove_users: T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers),
                request_options: Braintrust::RequestOptions
              }
            )
        end
        def to_hash
        end

        class InviteUsers < Braintrust::BaseModel
          sig { returns(T.nilable(T::Array[String])) }
          def emails
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def emails=(_)
          end

          sig { returns(T.nilable(String)) }
          def group_id
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def group_id=(_)
          end

          sig { returns(T.nilable(T::Array[String])) }
          def group_ids
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def group_ids=(_)
          end

          sig { returns(T.nilable(String)) }
          def group_name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def group_name=(_)
          end

          sig { returns(T.nilable(T::Array[String])) }
          def group_names
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def group_names=(_)
          end

          sig { returns(T.nilable(T::Array[String])) }
          def ids
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def ids=(_)
          end

          sig { returns(T.nilable(T::Boolean)) }
          def send_invite_emails
          end

          sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def send_invite_emails=(_)
          end

          sig do
            params(
              emails: T.nilable(T::Array[String]),
              group_id: T.nilable(String),
              group_ids: T.nilable(T::Array[String]),
              group_name: T.nilable(String),
              group_names: T.nilable(T::Array[String]),
              ids: T.nilable(T::Array[String]),
              send_invite_emails: T.nilable(T::Boolean)
            )
              .void
          end
          def initialize(
            emails: nil,
            group_id: nil,
            group_ids: nil,
            group_name: nil,
            group_names: nil,
            ids: nil,
            send_invite_emails: nil
          )
          end

          sig do
            override
              .returns(
                {
                  emails: T.nilable(T::Array[String]),
                  group_id: T.nilable(String),
                  group_ids: T.nilable(T::Array[String]),
                  group_name: T.nilable(String),
                  group_names: T.nilable(T::Array[String]),
                  ids: T.nilable(T::Array[String]),
                  send_invite_emails: T.nilable(T::Boolean)
                }
              )
          end
          def to_hash
          end
        end

        class RemoveUsers < Braintrust::BaseModel
          sig { returns(T.nilable(T::Array[String])) }
          def emails
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def emails=(_)
          end

          sig { returns(T.nilable(T::Array[String])) }
          def ids
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def ids=(_)
          end

          sig { params(emails: T.nilable(T::Array[String]), ids: T.nilable(T::Array[String])).void }
          def initialize(emails: nil, ids: nil)
          end

          sig { override.returns({emails: T.nilable(T::Array[String]), ids: T.nilable(T::Array[String])}) }
          def to_hash
          end
        end
      end
    end
  end
end
