# frozen_string_literal: true

module Braintrust
  module Models
    class View < Braintrust::BaseModel
      # @!attribute id
      #   Unique identifier for the view
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the view
      #
      #   @return [String]
      required :name, String

      # @!attribute object_id_
      #   The id of the object the view applies to
      #
      #   @return [String]
      required :object_id_, String, api_name: :object_id

      # @!attribute object_type
      #   The object type that the ACL applies to
      #
      #   @return [Symbol, Braintrust::Models::View::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::View::ObjectType }

      # @!attribute view_type
      #   Type of table that the view corresponds to.
      #
      #   @return [Symbol, Braintrust::Models::View::ViewType, nil]
      required :view_type, enum: -> { Braintrust::Models::View::ViewType }, nil?: true

      # @!attribute created
      #   Date of view creation
      #
      #   @return [Time, nil]
      optional :created, Time, nil?: true

      # @!attribute deleted_at
      #   Date of role deletion, or null if the role is still active
      #
      #   @return [Time, nil]
      optional :deleted_at, Time, nil?: true

      # @!attribute options
      #   Options for the view in the app
      #
      #   @return [Braintrust::Models::ViewOptions, nil]
      optional :options, -> { Braintrust::Models::ViewOptions }, nil?: true

      # @!attribute user_id
      #   Identifies the user who created the view
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!attribute view_data
      #   The view definition
      #
      #   @return [Braintrust::Models::ViewData, nil]
      optional :view_data, -> { Braintrust::Models::ViewData }, nil?: true

      # @!parse
      #   # @param id [String]
      #   # @param name [String]
      #   # @param object_id_ [String]
      #   # @param object_type [Symbol, Braintrust::Models::View::ObjectType]
      #   # @param view_type [Symbol, Braintrust::Models::View::ViewType, nil]
      #   # @param created [Time, nil]
      #   # @param deleted_at [Time, nil]
      #   # @param options [Braintrust::Models::ViewOptions, nil]
      #   # @param user_id [String, nil]
      #   # @param view_data [Braintrust::Models::ViewData, nil]
      #   #
      #   def initialize(
      #     id:,
      #     name:,
      #     object_id_:,
      #     object_type:,
      #     view_type:,
      #     created: nil,
      #     deleted_at: nil,
      #     options: nil,
      #     user_id: nil,
      #     view_data: nil,
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
