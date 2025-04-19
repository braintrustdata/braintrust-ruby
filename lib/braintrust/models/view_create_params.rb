# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Views#create
    class ViewCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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
      required :object_type, enum: -> { Braintrust::Models::ACLObjectType }

      # @!attribute view_type
      #   Type of table that the view corresponds to.
      #
      #   @return [Symbol, Braintrust::Models::ViewCreateParams::ViewType, nil]
      required :view_type, enum: -> { Braintrust::Models::ViewCreateParams::ViewType }, nil?: true

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

      # @!method initialize(name:, object_id_:, object_type:, view_type:, deleted_at: nil, options: nil, user_id: nil, view_data: nil, request_options: {})
      #   @param name [String]
      #   @param object_id_ [String]
      #   @param object_type [Symbol, Braintrust::Models::ACLObjectType]
      #   @param view_type [Symbol, Braintrust::Models::ViewCreateParams::ViewType, nil]
      #   @param deleted_at [Time, nil]
      #   @param options [Braintrust::Models::ViewOptions, nil]
      #   @param user_id [String, nil]
      #   @param view_data [Braintrust::Models::ViewData, nil]
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      # Type of table that the view corresponds to.
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
