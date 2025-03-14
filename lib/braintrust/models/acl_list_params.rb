# frozen_string_literal: true

module Braintrust
  module Models
    class ACLListParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # @!attribute object_id_
      #   The id of the object the ACL applies to
      #
      #   @return [String]
      required :object_id_, String, api_name: :object_id

      # @!attribute object_type
      #   The object type that the ACL applies to
      #
      #   @return [Symbol, Braintrust::Models::ACLObjectType]
      required :object_type, enum: -> { Braintrust::Models::ACLObjectType }

      # @!attribute [r] ending_before
      #   Pagination cursor id.
      #
      #     For example, if the initial item in the last page you fetched had an id of
      #     `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #     pass one of `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :ending_before, String

      # @!parse
      #   # @return [String]
      #   attr_writer :ending_before

      # @!attribute [r] ids
      #   Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @return [String, Array<String>, nil]
      optional :ids, union: -> { Braintrust::Models::ACLListParams::IDs }

      # @!parse
      #   # @return [String, Array<String>]
      #   attr_writer :ids

      # @!attribute limit
      #   Limit the number of objects to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute [r] starting_after
      #   Pagination cursor id.
      #
      #     For example, if the final item in the last page you fetched had an id of `foo`,
      #     pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #     `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :starting_after, String

      # @!parse
      #   # @return [String]
      #   attr_writer :starting_after

      # @!parse
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      #   # @param ending_before [String]
      #   # @param ids [String, Array<String>]
      #   # @param limit [Integer, nil]
      #   # @param starting_after [String]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     object_id_:,
      #     object_type:,
      #     ending_before: nil,
      #     ids: nil,
      #     limit: nil,
      #     starting_after: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      class IDs < Braintrust::Union
        StringArray = Braintrust::ArrayOf[String]

        variant String

        variant Braintrust::Models::ACLListParams::IDs::StringArray
      end
    end
  end
end
