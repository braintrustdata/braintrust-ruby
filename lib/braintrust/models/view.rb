# frozen_string_literal: true

module Braintrust
  module Models
    class View < BaseModel
      # @!attribute [rw] id
      #   Unique identifier for the view
      #   @return [String]
      required :id, String

      # @!attribute [rw] name_
      #   Name of the view
      #   @return [String]
      required :name_, String, api_name: :name

      # @!attribute [rw] object_id_
      #   The id of the object the view applies to
      #   @return [String]
      required :object_id_, String, api_name: :object_id

      # @!attribute [rw] object_type
      #   The object type that the ACL applies to
      #   @return [Symbol, Braintrust::Models::View::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::View::ObjectType }

      # @!attribute [rw] view_type
      #   Type of table that the view corresponds to.
      #   @return [Symbol, Braintrust::Models::View::ViewType]
      required :view_type, enum: -> { Braintrust::Models::View::ViewType }

      # @!attribute [rw] created
      #   Date of view creation
      #   @return [Time]
      optional :created, Time

      # @!attribute [rw] deleted_at
      #   Date of role deletion, or null if the role is still active
      #   @return [Time]
      optional :deleted_at, Time

      # @!attribute [rw] options
      #   Options for the view in the app
      #   @return [Braintrust::Models::ViewOptions]
      optional :options, -> { Braintrust::Models::ViewOptions }

      # @!attribute [rw] user_id
      #   Identifies the user who created the view
      #   @return [String]
      optional :user_id, String

      # @!attribute [rw] view_data
      #   The view definition
      #   @return [Braintrust::Models::ViewData]
      optional :view_data, -> { Braintrust::Models::ViewData }

      # The object type that the ACL applies to
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
      end

      # Type of table that the view corresponds to.
      class ViewType < Braintrust::Enum
        PROJECTS = :projects
        LOGS = :logs
        EXPERIMENTS = :experiments
        DATASETS = :datasets
        PROMPTS = :prompts
        PLAYGROUNDS = :playgrounds
        EXPERIMENT = :experiment
        DATASET = :dataset
      end

      # @!parse
      #   # Create a new instance of View from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique identifier for the view
      #   #   @option data [String] :name Name of the view
      #   #   @option data [String] :object_id The id of the object the view applies to
      #   #   @option data [String] :object_type The object type that the ACL applies to
      #   #   @option data [String] :view_type Type of table that the view corresponds to.
      #   #   @option data [String, nil] :created Date of view creation
      #   #   @option data [String, nil] :deleted_at Date of role deletion, or null if the role is still active
      #   #   @option data [Object, nil] :options Options for the view in the app
      #   #   @option data [String, nil] :user_id Identifies the user who created the view
      #   #   @option data [Object, nil] :view_data The view definition
      #   def initialize(data = {}) = super
    end
  end
end
