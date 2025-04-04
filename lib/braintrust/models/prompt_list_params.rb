# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Prompts#list
    class PromptListParams < Braintrust::Internal::Type::BaseModel
      # @!parse
      #   extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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
      optional :ids, union: -> { Braintrust::Models::PromptListParams::IDs }

      # @!parse
      #   # @return [String, Array<String>]
      #   attr_writer :ids

      # @!attribute limit
      #   Limit the number of objects to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute [r] org_name
      #   Filter search results to within a particular organization
      #
      #   @return [String, nil]
      optional :org_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :org_name

      # @!attribute [r] project_id
      #   Project id
      #
      #   @return [String, nil]
      optional :project_id, String

      # @!parse
      #   # @return [String]
      #   attr_writer :project_id

      # @!attribute [r] project_name
      #   Name of the project to search for
      #
      #   @return [String, nil]
      optional :project_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :project_name

      # @!attribute [r] prompt_name
      #   Name of the prompt to search for
      #
      #   @return [String, nil]
      optional :prompt_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :prompt_name

      # @!attribute [r] slug
      #   Retrieve prompt with a specific slug
      #
      #   @return [String, nil]
      optional :slug, String

      # @!parse
      #   # @return [String]
      #   attr_writer :slug

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

      # @!attribute [r] version
      #   Retrieve prompt at a specific version.
      #
      #     The version id can either be a transaction id (e.g. '1000192656880881099') or a
      #     version identifier (e.g. '81cd05ee665fdfb3').
      #
      #   @return [String, nil]
      optional :version, String

      # @!parse
      #   # @return [String]
      #   attr_writer :version

      # @!parse
      #   # @param ending_before [String]
      #   # @param ids [String, Array<String>]
      #   # @param limit [Integer, nil]
      #   # @param org_name [String]
      #   # @param project_id [String]
      #   # @param project_name [String]
      #   # @param prompt_name [String]
      #   # @param slug [String]
      #   # @param starting_after [String]
      #   # @param version [String]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     ending_before: nil,
      #     ids: nil,
      #     limit: nil,
      #     org_name: nil,
      #     project_id: nil,
      #     project_name: nil,
      #     prompt_name: nil,
      #     slug: nil,
      #     starting_after: nil,
      #     version: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::Internal::Type::BaseModel) -> void

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        variant String

        variant -> { Braintrust::Models::PromptListParams::IDs::StringArray }

        # @!parse
        #   # @return [Array(String, Array<String>)]
        #   def self.variants; end

        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end
    end
  end
end
