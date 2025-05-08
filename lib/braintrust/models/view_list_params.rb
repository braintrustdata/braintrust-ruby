# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Views#list
    class ViewListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute object_id_
      #   The id of the object the ACL applies to
      #
      #   @return [String]
      required :object_id_, String

      # @!attribute object_type
      #   The object type that the ACL applies to
      #
      #   @return [Symbol, Braintrust::ACLObjectType]
      required :object_type, enum: -> { Braintrust::ACLObjectType }

      # @!attribute ending_before
      #   Pagination cursor id.
      #
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :ending_before, String

      # @!attribute ids
      #   Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      #
      #   @return [String, Array<String>, nil]
      optional :ids, union: -> { Braintrust::ViewListParams::IDs }

      # @!attribute limit
      #   Limit the number of objects to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute starting_after
      #   Pagination cursor id.
      #
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :starting_after, String

      # @!attribute view_name
      #   Name of the view to search for
      #
      #   @return [String, nil]
      optional :view_name, String

      # @!attribute view_type
      #   Type of table that the view corresponds to.
      #
      #   @return [Symbol, Braintrust::ViewType, nil]
      optional :view_type, enum: -> { Braintrust::ViewType }, nil?: true

      # @!method initialize(object_id_:, object_type:, ending_before: nil, ids: nil, limit: nil, starting_after: nil, view_name: nil, view_type: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::ViewListParams} for more details.
      #
      #   @param object_id_ [String] The id of the object the ACL applies to
      #
      #   @param object_type [Symbol, Braintrust::ACLObjectType] The object type that the ACL applies to
      #
      #   @param ending_before [String] Pagination cursor id.
      #
      #   @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      #
      #   @param limit [Integer, nil] Limit the number of objects to return
      #
      #   @param starting_after [String] Pagination cursor id.
      #
      #   @param view_name [String] Name of the view to search for
      #
      #   @param view_type [Symbol, Braintrust::ViewType, nil] Type of table that the view corresponds to.
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        variant String

        variant -> { Braintrust::ViewListParams::IDs::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        # @type [Braintrust::Internal::Type::Converter]
        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end
    end
  end
end
