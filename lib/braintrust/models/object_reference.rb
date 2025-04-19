# frozen_string_literal: true

module Braintrust
  module Models
    class ObjectReference < Braintrust::Internal::Type::BaseModel
      # @!attribute id
      #   ID of the original event.
      #
      #   @return [String]
      required :id, String

      # @!attribute _xact_id
      #   Transaction ID of the original event.
      #
      #   @return [String]
      required :_xact_id, String

      # @!attribute object_id_
      #   ID of the object the event is originating from.
      #
      #   @return [String]
      required :object_id_, String, api_name: :object_id

      # @!attribute object_type
      #   Type of the object the event is originating from.
      #
      #   @return [Symbol, Braintrust::Models::ObjectReference::ObjectType]
      required :object_type, enum: -> { Braintrust::Models::ObjectReference::ObjectType }

      # @!attribute created
      #   Created timestamp of the original event. Used to help sort in the UI
      #
      #   @return [String, nil]
      optional :created, String, nil?: true

      # @!method initialize(id:, _xact_id:, object_id_:, object_type:, created: nil)
      #   Indicates the event was copied from another object.
      #
      #   @param id [String]
      #   @param _xact_id [String]
      #   @param object_id_ [String]
      #   @param object_type [Symbol, Braintrust::Models::ObjectReference::ObjectType]
      #   @param created [String, nil]

      # Type of the object the event is originating from.
      #
      # @see Braintrust::Models::ObjectReference#object_type
      module ObjectType
        extend Braintrust::Internal::Type::Enum

        EXPERIMENT = :experiment
        DATASET = :dataset
        PROMPT = :prompt
        FUNCTION = :function
        PROMPT_SESSION = :prompt_session
        PROJECT_LOGS = :project_logs

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
