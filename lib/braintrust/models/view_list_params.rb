# frozen_string_literal: true

module Braintrust
  module Models
    class ViewListParams < Braintrust::BaseModel
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
      #   @return [Symbol, Braintrust::Models::ViewListParams::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::ViewListParams::ObjectType }

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
      optional :ids, union: -> { Braintrust::Models::ViewListParams::IDs }

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

      # @!attribute [r] view_name
      #   Name of the view to search for
      #
      #   @return [String, nil]
      optional :view_name, String

      # @!parse
      #   # @return [String]
      #   attr_writer :view_name

      # @!attribute view_type
      #   Type of table that the view corresponds to.
      #
      #   @return [Symbol, Braintrust::Models::ViewListParams::ViewType, nil]
      optional :view_type, enum: -> { Braintrust::Models::ViewListParams::ViewType }, nil?: true

      # @!parse
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::ViewListParams::ObjectType]
      #   # @param ending_before [String]
      #   # @param ids [String, Array<String>]
      #   # @param limit [Integer, nil]
      #   # @param starting_after [String]
      #   # @param view_name [String]
      #   # @param view_type [Symbol, Braintrust::Models::ViewListParams::ViewType, nil]
      #   # @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(
      #     object_id_:,
      #     object_type:,
      #     ending_before: nil,
      #     ids: nil,
      #     limit: nil,
      #     starting_after: nil,
      #     view_name: nil,
      #     view_type: nil,
      #     request_options: {},
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Braintrust::BaseModel) -> void

      # @abstract
      #
      # The object type that the ACL applies to
      #
      # @example
      # ```ruby
      # case object_type
      # in :organization
      #   # ...
      # in :project
      #   # ...
      # in :experiment
      #   # ...
      # in :dataset
      #   # ...
      # in :prompt
      #   # ...
      # in ...
      #   #...
      # end
      # ```
      class ObjectType < Braintrust::Enum
        ORGANIZATION = :organization
        PROJECT = :project
        EXPERIMENT = :experiment
        DATASET = :dataset
        PROMPT = :prompt
        PROMPT_SESSION = :prompt_session
        GROUP = :group
        ROLE = :role
        ORG_MEMBER = :org_member
        PROJECT_LOG = :project_log
        ORG_PROJECT = :org_project

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end

      # @abstract
      #
      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      #
      # @example
      # ```ruby
      # case ids
      # in String
      #   # ...
      # in Braintrust::Models::ViewListParams::IDs::StringArray
      #   # ...
      # end
      # ```
      class IDs < Braintrust::Union
        StringArray = Braintrust::ArrayOf[String]

        variant String

        variant Braintrust::Models::ViewListParams::IDs::StringArray
      end

      # @abstract
      #
      # Type of table that the view corresponds to.
      #
      # @example
      # ```ruby
      # case view_type
      # in :projects
      #   # ...
      # in :logs
      #   # ...
      # in :experiments
      #   # ...
      # in :datasets
      #   # ...
      # in :prompts
      #   # ...
      # in ...
      #   #...
      # end
      # ```
      class ViewType < Braintrust::Enum
        PROJECTS = :projects
        LOGS = :logs
        EXPERIMENTS = :experiments
        DATASETS = :datasets
        PROMPTS = :prompts
        PLAYGROUNDS = :playgrounds
        EXPERIMENT = :experiment
        DATASET = :dataset

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   #
        #   def self.values; end
      end
    end
  end
end
