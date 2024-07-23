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

      # @!attribute [rw] view_type
      #   Type of table that the view corresponds to.
      #   @return [Symbol]
      required :view_type,
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
      #   @return [Braintrust::Models::View::Options]
      optional :options, -> { Braintrust::Models::View::Options }

      # @!attribute [rw] user_id
      #   Identifies the user who created the view
      #   @return [String]
      optional :user_id, String

      # @!attribute [rw] view_data
      #   The view definition
      #   @return [Braintrust::Models::View::ViewData]
      optional :view_data, -> { Braintrust::Models::View::ViewData }

      class Options < BaseModel
        # @!attribute [rw] column_order
        #   @return [Array<String>]
        optional :column_order, Braintrust::ArrayOf.new(String)

        # @!attribute [rw] column_sizing
        #   @return [Hash]
        optional :column_sizing, Hash

        # @!attribute [rw] column_visibility
        #   @return [Hash]
        optional :column_visibility, Hash
      end

      class ViewData < BaseModel
        # @!attribute [rw] search
        #   @return [Braintrust::Models::View::ViewData::Search]
        optional :search, -> { Braintrust::Models::View::ViewData::Search }

        class Search < BaseModel
          # @!attribute [rw] filter
          #   @return [Array<Object>]
          optional :filter, Braintrust::ArrayOf.new(Braintrust::Unknown)

          # @!attribute [rw] match
          #   @return [Array<Object>]
          optional :match, Braintrust::ArrayOf.new(Braintrust::Unknown)

          # @!attribute [rw] sort
          #   @return [Array<Object>]
          optional :sort, Braintrust::ArrayOf.new(Braintrust::Unknown)

          # @!attribute [rw] tag
          #   @return [Array<Object>]
          optional :tag, Braintrust::ArrayOf.new(Braintrust::Unknown)
        end
      end
    end
  end
end
