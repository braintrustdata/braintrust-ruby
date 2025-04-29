# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Experiments#list
    class ExperimentListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute ending_before
      #   Pagination cursor id.
      #
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :ending_before, String

      # @!attribute experiment_name
      #   Name of the experiment to search for
      #
      #   @return [String, nil]
      optional :experiment_name, String

      # @!attribute ids
      #   Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      #
      #   @return [String, Array<String>, nil]
      optional :ids, union: -> { Braintrust::Models::ExperimentListParams::IDs }

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

      # @!method initialize(ending_before: nil, experiment_name: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, starting_after: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::ExperimentListParams} for more details.
      #
      #   @param ending_before [String] Pagination cursor id. ...
      #
      #   @param experiment_name [String] Name of the experiment to search for
      #
      #   @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      #   ...
      #
      #   @param limit [Integer, nil] Limit the number of objects to return
      #
      #   @param org_name [String] Filter search results to within a particular organization
      #
      #   @param project_id [String] Project id
      #
      #   @param project_name [String] Name of the project to search for
      #
      #   @param starting_after [String] Pagination cursor id. ...
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        variant String

        variant -> { Braintrust::Models::ExperimentListParams::IDs::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        # @type [Braintrust::Internal::Type::Converter]
        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end
    end
  end
end
