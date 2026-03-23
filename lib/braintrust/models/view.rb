# frozen_string_literal: true

module Braintrust
  module Models
    class View < Braintrust::Internal::Type::BaseModel
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
      #   @return [Symbol, Braintrust::Models::ACLObjectType]
      required :object_type, enum: -> { Braintrust::ACLObjectType }

      # @!attribute view_type
      #   Type of table that the view corresponds to.
      #
      #   @return [Symbol, Braintrust::Models::View::ViewType, nil]
      required :view_type, enum: -> { Braintrust::View::ViewType }, nil?: true

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
      optional :options, -> { Braintrust::ViewOptions }, nil?: true

      # @!attribute user_id
      #   Identifies the user who created the view
      #
      #   @return [String, nil]
      optional :user_id, String, nil?: true

      # @!attribute view_data
      #   The view definition
      #
      #   @return [Braintrust::Models::ViewData, nil]
      optional :view_data, -> { Braintrust::ViewData }, nil?: true

      # @!method initialize(id:, name:, object_id_:, object_type:, view_type:, created: nil, deleted_at: nil, options: nil, user_id: nil, view_data: nil)
      #   @param id [String] Unique identifier for the view
      #
      #   @param name [String] Name of the view
      #
      #   @param object_id_ [String] The id of the object the view applies to
      #
      #   @param object_type [Symbol, Braintrust::Models::ACLObjectType] The object type that the ACL applies to
      #
      #   @param view_type [Symbol, Braintrust::Models::View::ViewType, nil] Type of table that the view corresponds to.
      #
      #   @param created [Time, nil] Date of view creation
      #
      #   @param deleted_at [Time, nil] Date of role deletion, or null if the role is still active
      #
      #   @param options [Braintrust::Models::ViewOptions, nil] Options for the view in the app
      #
      #   @param user_id [String, nil] Identifies the user who created the view
      #
      #   @param view_data [Braintrust::Models::ViewData, nil] The view definition

      # Type of table that the view corresponds to.
      #
      # @see Braintrust::Models::View#view_type
      module ViewType
        extend Braintrust::Internal::Type::Enum

        PROJECTS = :projects
        EXPERIMENTS = :experiments
        EXPERIMENT = :experiment
        PLAYGROUNDS = :playgrounds
        PLAYGROUND = :playground
        DATASETS = :datasets
        DATASET = :dataset
        PROMPTS = :prompts
        TOOLS = :tools
        SCORERS = :scorers
        LOGS = :logs

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
