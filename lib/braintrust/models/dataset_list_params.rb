# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Datasets#list
    class DatasetListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute dataset_name
      #   Name of the dataset to search for
      #
      #   @return [String, nil]
      optional :dataset_name, String

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
      optional :ids, union: -> { Braintrust::Models::DatasetListParams::IDs }

      # @!attribute limit
      #   Limit the number of objects to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute org_name
      #   Filter search results to within a particular organization
      #
      #   @return [String, nil]
      optional :org_name, String

      # @!attribute project_id
      #   Project id
      #
      #   @return [String, nil]
      optional :project_id, String

      # @!attribute project_name
      #   Name of the project to search for
      #
      #   @return [String, nil]
      optional :project_name, String

      # @!attribute starting_after
      #   Pagination cursor id.
      #
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :starting_after, String

      # @!method initialize(dataset_name: nil, ending_before: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, starting_after: nil, request_options: {})
      #   @param dataset_name [String]
      #   @param ending_before [String]
      #   @param ids [String, Array<String>]
      #   @param limit [Integer, nil]
      #   @param org_name [String]
      #   @param project_id [String]
      #   @param project_name [String]
      #   @param starting_after [String]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        variant String

        variant -> { Braintrust::Models::DatasetListParams::IDs::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end
    end
  end
end
