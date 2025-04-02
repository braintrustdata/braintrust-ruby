# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Groups#create
    class GroupCreateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

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
      #     An inheriting group has all the users contained in its member groups, as well as
      #     all of their inherited users
      #
      #   @return [Array<String>, nil]
      optional :member_groups, Braintrust::ArrayOf[String], nil?: true

      # @!attribute member_users
      #   Ids of users which belong to this group
      #
      #   @return [Array<String>, nil]
      optional :member_users, Braintrust::ArrayOf[String], nil?: true

      # @!attribute org_name
      #   For nearly all users, this parameter should be unnecessary. But in the rare case
      #     that your API key belongs to multiple organizations, you may specify the name of
      #     the organization the group belongs in.
      #
      #   @return [String, nil]
      optional :org_name, String, nil?: true

      # @!parse
      #   # @param name [String]
      #   # @param description [String, nil]
      #   # @param member_groups [Array<String>, nil]
      #   # @param member_users [Array<String>, nil]
      #   # @param org_name [String, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(name:, description: nil, member_groups: nil, member_users: nil, org_name: nil, request_options: {}, **) = super

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
