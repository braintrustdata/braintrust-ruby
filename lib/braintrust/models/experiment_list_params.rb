# frozen_string_literal: true

module Braintrust
  module Models
    class ExperimentListParams < Braintrust::BaseModel
      # @!parse
      #   extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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

      # @!attribute [r] experiment_name
      #   Name of the experiment to search for
      #
      #   @return [String, nil]
      optional :experiment_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :experiment_name

      # @!attribute [r] ids
      #   Filter search results to a particular set of object IDs. To specify a list of
      #     IDs, include the query param multiple times
      #
      #   @return [String, Array<String>, nil]
      optional :ids, union: -> { Braintrust::Models::ExperimentListParams::IDs }

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
      #   # @param ending_before [String]
      #   # @param experiment_name [String]
      #   # @param ids [String, Array<String>]
      #   # @param limit [Integer, nil]
      #   # @param org_name [String]
      #   # @param project_id [String]
      #   # @param project_name [String]
      #   # @param starting_after [String]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     ending_before: nil,
      #     experiment_name: nil,
      #     ids: nil,
      #     limit: nil,
      #     org_name: nil,
      #     project_id: nil,
      #     project_name: nil,
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

        variant Braintrust::Models::ExperimentListParams::IDs::StringArray

        # @!parse
        #   class << self
        #     # @return [Array(String, Array<String>)]
        #     def variants; end
        #   end
      end
    end
  end
end
