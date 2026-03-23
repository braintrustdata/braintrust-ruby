# typed: strong

module Braintrust
  module Models
    module Organizations
      class MemberUpdateParams < Braintrust::Internal::Type::BaseModel
        extend Braintrust::Internal::Type::RequestParameters::Converter
        include Braintrust::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Braintrust::Organizations::MemberUpdateParams,
              Braintrust::Internal::AnyHash
            )
          end

        # Users to invite to the organization
        sig do
          returns(
            T.nilable(
              Braintrust::Organizations::MemberUpdateParams::InviteUsers
            )
          )
        end
        attr_reader :invite_users

        sig do
          params(
            invite_users:
              T.nilable(
                Braintrust::Organizations::MemberUpdateParams::InviteUsers::OrHash
              )
          ).void
        end
        attr_writer :invite_users

        # For nearly all users, this parameter should be unnecessary. But in the rare case
        # that your API key belongs to multiple organizations, or in case you want to
        # explicitly assert the organization you are modifying, you may specify the id of
        # the organization.
        sig { returns(T.nilable(String)) }
        attr_accessor :org_id

        # For nearly all users, this parameter should be unnecessary. But in the rare case
        # that your API key belongs to multiple organizations, or in case you want to
        # explicitly assert the organization you are modifying, you may specify the name
        # of the organization.
        sig { returns(T.nilable(String)) }
        attr_accessor :org_name

        # Users to remove from the organization
        sig do
          returns(
            T.nilable(
              Braintrust::Organizations::MemberUpdateParams::RemoveUsers
            )
          )
        end
        attr_reader :remove_users

        sig do
          params(
            remove_users:
              T.nilable(
                Braintrust::Organizations::MemberUpdateParams::RemoveUsers::OrHash
              )
          ).void
        end
        attr_writer :remove_users

        sig do
          params(
            invite_users:
              T.nilable(
                Braintrust::Organizations::MemberUpdateParams::InviteUsers::OrHash
              ),
            org_id: T.nilable(String),
            org_name: T.nilable(String),
            remove_users:
              T.nilable(
                Braintrust::Organizations::MemberUpdateParams::RemoveUsers::OrHash
              ),
            request_options: Braintrust::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Users to invite to the organization
          invite_users: nil,
          # For nearly all users, this parameter should be unnecessary. But in the rare case
          # that your API key belongs to multiple organizations, or in case you want to
          # explicitly assert the organization you are modifying, you may specify the id of
          # the organization.
          org_id: nil,
          # For nearly all users, this parameter should be unnecessary. But in the rare case
          # that your API key belongs to multiple organizations, or in case you want to
          # explicitly assert the organization you are modifying, you may specify the name
          # of the organization.
          org_name: nil,
          # Users to remove from the organization
          remove_users: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              invite_users:
                T.nilable(
                  Braintrust::Organizations::MemberUpdateParams::InviteUsers
                ),
              org_id: T.nilable(String),
              org_name: T.nilable(String),
              remove_users:
                T.nilable(
                  Braintrust::Organizations::MemberUpdateParams::RemoveUsers
                ),
              request_options: Braintrust::RequestOptions
            }
          )
        end
        def to_hash
        end

        class InviteUsers < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::Organizations::MemberUpdateParams::InviteUsers,
                Braintrust::Internal::AnyHash
              )
            end

          # Emails of users to invite
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :emails

          # Singular form of group_ids
          sig { returns(T.nilable(String)) }
          attr_accessor :group_id

          # Optional list of group ids to add newly-invited users to.
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :group_ids

          # Singular form of group_names
          sig { returns(T.nilable(String)) }
          attr_accessor :group_name

          # Optional list of group names to add newly-invited users to.
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :group_names

          # Ids of existing users to invite
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :ids

          # If true, send invite emails to the users who wore actually added
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :send_invite_emails

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
            ).returns(T.attached_class)
          end
          def self.new(
            # Emails of users to invite
            emails: nil,
            # Singular form of group_ids
            group_id: nil,
            # Optional list of group ids to add newly-invited users to.
            group_ids: nil,
            # Singular form of group_names
            group_name: nil,
            # Optional list of group names to add newly-invited users to.
            group_names: nil,
            # Ids of existing users to invite
            ids: nil,
            # If true, send invite emails to the users who wore actually added
            send_invite_emails: nil
          )
          end

          sig do
            override.returns(
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

        class RemoveUsers < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Braintrust::Organizations::MemberUpdateParams::RemoveUsers,
                Braintrust::Internal::AnyHash
              )
            end

          # Emails of users to remove
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :emails

          # Ids of users to remove
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :ids

          # Users to remove from the organization
          sig do
            params(
              emails: T.nilable(T::Array[String]),
              ids: T.nilable(T::Array[String])
            ).returns(T.attached_class)
          end
          def self.new(
            # Emails of users to remove
            emails: nil,
            # Ids of users to remove
            ids: nil
          )
          end

          sig do
            override.returns(
              {
                emails: T.nilable(T::Array[String]),
                ids: T.nilable(T::Array[String])
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
