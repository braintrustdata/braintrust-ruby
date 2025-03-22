# typed: strong

module Braintrust
  module Models
    class ProjectTag < Braintrust::BaseModel
      # Unique identifier for the project tag
      sig { returns(String) }
      attr_accessor :id

      # Name of the project tag
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the project tag belongs under
      sig { returns(String) }
      attr_accessor :project_id

      sig { returns(String) }
      attr_accessor :user_id

      # Color of the tag for the UI
      sig { returns(T.nilable(String)) }
      attr_accessor :color

      # Date of project tag creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Textual description of the project tag
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # A project tag is a user-configured tag for tracking and filtering your
      #   experiments, logs, and other data
      sig do
        params(
          id: String,
          name: String,
          project_id: String,
          user_id: String,
          color: T.nilable(String),
          created: T.nilable(Time),
          description: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(id:, name:, project_id:, user_id:, color: nil, created: nil, description: nil)
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              project_id: String,
              user_id: String,
              color: T.nilable(String),
              created: T.nilable(Time),
              description: T.nilable(String)
            }
          )
      end
      def to_hash
      end
    end
  end
end
