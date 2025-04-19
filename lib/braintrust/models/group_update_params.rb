# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Groups#update
    class GroupUpdateParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute add_member_groups
      #   A list of group IDs to add to the group's inheriting-from set
      #
      #   @return [Array<String>, nil]
      optional :add_member_groups, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute add_member_users
      #   A list of user IDs to add to the group
      #
      #   @return [Array<String>, nil]
      optional :add_member_users, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute description
      #   Textual description of the group
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute name
      #   Name of the group
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute remove_member_groups
      #   A list of group IDs to remove from the group's inheriting-from set
      #
      #   @return [Array<String>, nil]
      optional :remove_member_groups, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute remove_member_users
      #   A list of user IDs to remove from the group
      #
      #   @return [Array<String>, nil]
      optional :remove_member_users, Braintrust::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(add_member_groups: nil, add_member_users: nil, description: nil, name: nil, remove_member_groups: nil, remove_member_users: nil, request_options: {})
      #   @param add_member_groups [Array<String>, nil]
      #   @param add_member_users [Array<String>, nil]
      #   @param description [String, nil]
      #   @param name [String, nil]
      #   @param remove_member_groups [Array<String>, nil]
      #   @param remove_member_users [Array<String>, nil]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
