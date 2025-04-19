# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Prompts#list
    class PromptListParams < Braintrust::Internal::Type::BaseModel
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

      # @!attribute ids
      #   Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      #
      #   @return [String, Array<String>, nil]
      optional :ids, union: -> { Braintrust::Models::PromptListParams::IDs }

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

      # @!attribute prompt_name
      #   Name of the prompt to search for
      #
      #   @return [String, nil]
      optional :prompt_name, String

      # @!attribute slug
      #   Retrieve prompt with a specific slug
      #
      #   @return [String, nil]
      optional :slug, String

      # @!attribute starting_after
      #   Pagination cursor id.
      #
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :starting_after, String

      # @!attribute version
      #   Retrieve prompt at a specific version.
      #
      #   The version id can either be a transaction id (e.g. '1000192656880881099') or a
      #   version identifier (e.g. '81cd05ee665fdfb3').
      #
      #   @return [String, nil]
      optional :version, String

      # @!method initialize(ending_before: nil, ids: nil, limit: nil, org_name: nil, project_id: nil, project_name: nil, prompt_name: nil, slug: nil, starting_after: nil, version: nil, request_options: {})
      #   @param ending_before [String]
      #   @param ids [String, Array<String>]
      #   @param limit [Integer, nil]
      #   @param org_name [String]
      #   @param project_id [String]
      #   @param project_name [String]
      #   @param prompt_name [String]
      #   @param slug [String]
      #   @param starting_after [String]
      #   @param version [String]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        variant String

        variant -> { Braintrust::Models::PromptListParams::IDs::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end
    end
  end
end
