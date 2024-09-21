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
      required :name_, String

      # @!attribute [rw] object_id_
      #   The id of the object the view applies to
      #   @return [String]
      required :object_id_, String

      # @!attribute [rw] object_type
      #   The object type that the ACL applies to
      #   One of the constants defined in {Braintrust::Models::View::ObjectType}
      #   @return [Symbol]
      required :object_type, enum: -> { Braintrust::Models::View::ObjectType }

      # @!attribute [rw] view_type
      #   Type of table that the view corresponds to.
      #   One of the constants defined in {Braintrust::Models::View::ViewType}
      #   @return [Symbol]
      required :view_type, enum: -> { Braintrust::Models::View::ViewType }

      # @!attribute [rw] created
      #   Date of view creation
      #   @return [String]
      optional :created, String

      # @!attribute [rw] deleted_at
      #   Date of role deletion, or null if the role is still active
      #   @return [String]
      optional :deleted_at, String

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
    end
  end
end
