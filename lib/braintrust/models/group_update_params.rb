# frozen_string_literal: true

module Braintrust
  module Models
    class GroupUpdateParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute add_member_groups
      #   A list of group IDs to add to the group's inheriting-from set
      #
      #   @return [Array<String>, nil]
      optional :add_member_groups, Braintrust::ArrayOf[String], nil?: true

      # @!attribute add_member_users
      #   A list of user IDs to add to the group
      #
      #   @return [Array<String>, nil]
      optional :add_member_users, Braintrust::ArrayOf[String], nil?: true

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
      optional :remove_member_groups, Braintrust::ArrayOf[String], nil?: true

      # @!attribute remove_member_users
      #   A list of user IDs to remove from the group
      #
      #   @return [Array<String>, nil]
      optional :remove_member_users, Braintrust::ArrayOf[String], nil?: true

      # @!parse
      #   # @param add_member_groups [Array<String>, nil]
      #   # @param add_member_users [Array<String>, nil]
      #   # @param description [String, nil]
      #   # @param name [String, nil]
      #   # @param remove_member_groups [Array<String>, nil]
      #   # @param remove_member_users [Array<String>, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     add_member_groups: nil,
      #     add_member_users: nil,
      #     description: nil,
      #     name: nil,
      #     remove_member_groups: nil,
      #     remove_member_users: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void
    end
  end
end
