# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Groups#replace
    class GroupReplaceParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute name
      #   Name of the group
      #
      #   @return [String]
      required :name, String

      # @!attribute description
      #   Textual description of the group
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute member_groups
      #   Ids of the groups this group inherits from
      #
      #   An inheriting group has all the users contained in its member groups, as well as
      #   all of their inherited users
      #
      #   @return [Array<String>, nil]
      optional :member_groups, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute member_users
      #   Ids of users which belong to this group
      #
      #   @return [Array<String>, nil]
      optional :member_users, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case
      #   that your API key belongs to multiple organizations, you may specify the name of
      #   the organization the group belongs in.
      #
      #   @return [String, nil]
      optional :org_name, String, nil?: true

      # @!method initialize(name:, description: nil, member_groups: nil, member_users: nil, org_name: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::GroupReplaceParams} for more details.
      #
      #   @param name [String] Name of the group
      #
      #   @param description [String, nil] Textual description of the group
      #
      #   @param member_groups [Array<String>, nil] Ids of the groups this group inherits from
      #
      #   @param member_users [Array<String>, nil] Ids of users which belong to this group
      #
      #   @param org_name [String, nil] For nearly all users, this parameter should be unnecessary. But in the rare case
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
