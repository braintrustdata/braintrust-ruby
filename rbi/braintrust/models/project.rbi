# typed: strong

module Braintrust
  module Models
    class Project < Braintrust::Internal::Type::BaseModel
      # Unique identifier for the project
      sig { returns(String) }
      attr_accessor :id

      # Name of the project
      sig { returns(String) }
      attr_accessor :name

      # Unique id for the organization that the project belongs under
      sig { returns(String) }
      attr_accessor :org_id

      # Date of project creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Date of project deletion, or null if the project is still active
      sig { returns(T.nilable(Time)) }
      attr_accessor :deleted_at

      sig { returns(T.nilable(Braintrust::Models::ProjectSettings)) }
      attr_reader :settings

      sig do
        params(settings: T.nilable(T.any(Braintrust::Models::ProjectSettings, Braintrust::Internal::AnyHash))).void
      end
      attr_writer :settings

      # Identifies the user who created the project
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          id: String,
          name: String,
          org_id: String,
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          settings: T.nilable(T.any(Braintrust::Models::ProjectSettings, Braintrust::Internal::AnyHash)),
          user_id: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the project
        id:,
        # Name of the project
        name:,
        # Unique id for the organization that the project belongs under
        org_id:,
        # Date of project creation
        created: nil,
        # Date of project deletion, or null if the project is still active
        deleted_at: nil,
        settings: nil,
        # Identifies the user who created the project
        user_id: nil
      ); end
      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              org_id: String,
              created: T.nilable(Time),
              deleted_at: T.nilable(Time),
              settings: T.nilable(Braintrust::Models::ProjectSettings),
              user_id: T.nilable(String)
            }
          )
      end
      def to_hash; end
    end
  end
end
