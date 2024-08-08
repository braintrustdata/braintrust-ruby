# frozen_string_literal: true

module Braintrust
  module Models
    class PatchView < BaseModel
      # @!attribute [rw] object_id_
      #   The id of the object the view applies to
      #   @return [String]
      required :object_id_, String

      # @!attribute [rw] object_type
      #   The object type that the ACL applies to
      #   @return [Symbol]
      required :object_type,
               Braintrust::Enum.new(
                 :organization,
                 :project,
                 :experiment,
                 :dataset,
                 :prompt,
                 :prompt_session,
                 :group,
                 :role,
                 :org_member,
                 :project_log,
                 :org_project
               )

      # @!attribute [rw] name_
      #   Name of the view
      #   @return [String]
      optional :name_, String

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

      # @!attribute [rw] view_type
      #   Type of table that the view corresponds to.
      #   @return [Symbol]
      optional :view_type,
               Braintrust::Enum.new(
                 :projects,
                 :logs,
                 :experiments,
                 :datasets,
                 :prompts,
                 :playgrounds,
                 :experiment,
                 :dataset
               )
    end
  end
end
