# typed: strong

module Braintrust
  module Models
    module Organizations
      class MemberUpdateParams < Braintrust::BaseModel
        extend Braintrust::RequestParameters::Converter
        include Braintrust::RequestParameters

        # Users to invite to the organization
        sig { returns(T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers)) }
        def invite_users
        end

        sig do
          params(
            _: T.nilable(
              T.any(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers, Braintrust::Util::AnyHash)
            )
          )
            .returns(
              T.nilable(
                T.any(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers, Braintrust::Util::AnyHash)
              )
            )
        end
        def invite_users=(_)
        end

        # For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, or in case you want to
        #   explicitly assert the organization you are modifying, you may specify the id of
        #   the organization.
        sig { returns(T.nilable(String)) }
        def org_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def org_id=(_)
        end

        # For nearly all users, this parameter should be unnecessary. But in the rare case
        #   that your API key belongs to multiple organizations, or in case you want to
        #   explicitly assert the organization you are modifying, you may specify the name
        #   of the organization.
        sig { returns(T.nilable(String)) }
        def org_name
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def org_name=(_)
        end

        # Users to remove from the organization
        sig { returns(T.nilable(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers)) }
        def remove_users
        end

        sig do
          params(
            _: T.nilable(
              T.any(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers, Braintrust::Util::AnyHash)
            )
          )
            .returns(
              T.nilable(
                T.any(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers, Braintrust::Util::AnyHash)
              )
            )
        end
        def remove_users=(_)
        end

        sig do
          params(
            invite_users: T.nilable(
              T.any(Braintrust::Models::Organizations::MemberUpdateParams::InviteUsers, Braintrust::Util::AnyHash)
            ),
            org_id: T.nilable(String),
            org_name: T.nilable(String),
            remove_users: T.nilable(
              T.any(Braintrust::Models::Organizations::MemberUpdateParams::RemoveUsers, Braintrust::Util::AnyHash)
            ),
            request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(invite_users: nil, org_id: nil, org_name: nil, remove_users: nil, request_options: {})
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
          # Emails of users to invite
          sig { returns(T.nilable(T::Array[String])) }
          def emails
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def emails=(_)
          end

          # Singular form of group_ids
          sig { returns(T.nilable(String)) }
          def group_id
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def group_id=(_)
          end

          # Optional list of group ids to add newly-invited users to.
          sig { returns(T.nilable(T::Array[String])) }
          def group_ids
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def group_ids=(_)
          end

          # Singular form of group_names
          sig { returns(T.nilable(String)) }
          def group_name
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def group_name=(_)
          end

          # Optional list of group names to add newly-invited users to.
          sig { returns(T.nilable(T::Array[String])) }
          def group_names
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def group_names=(_)
          end

          # Ids of existing users to invite
          sig { returns(T.nilable(T::Array[String])) }
          def ids
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def ids=(_)
          end

          # If true, send invite emails to the users who wore actually added
          sig { returns(T.nilable(T::Boolean)) }
          def send_invite_emails
          end

          sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def send_invite_emails=(_)
          end

          # Users to invite to the organization
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
              .returns(T.attached_class)
          end
          def self.new(
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
          # Emails of users to remove
          sig { returns(T.nilable(T::Array[String])) }
          def emails
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def emails=(_)
          end

          # Ids of users to remove
          sig { returns(T.nilable(T::Array[String])) }
          def ids
          end

          sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
          def ids=(_)
          end

          # Users to remove from the organization
          sig do
            params(
              emails: T.nilable(T::Array[String]),
              ids: T.nilable(T::Array[String])
            ).returns(T.attached_class)
          end
          def self.new(emails: nil, ids: nil)
          end

          sig { override.returns({emails: T.nilable(T::Array[String]), ids: T.nilable(T::Array[String])}) }
          def to_hash
          end
        end
      end
    end
  end
end
