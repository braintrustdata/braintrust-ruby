# typed: strong

module Braintrust
  module Models
    class Project < Braintrust::BaseModel
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
        params(
          settings: T.nilable(T.any(Braintrust::Models::ProjectSettings, Braintrust::Internal::Util::AnyHash))
        )
          .void
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
          settings: T.nilable(T.any(Braintrust::Models::ProjectSettings, Braintrust::Internal::Util::AnyHash)),
          user_id: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(id:, name:, org_id:, created: nil, deleted_at: nil, settings: nil, user_id: nil)
      end

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
      def to_hash
      end
    end
  end
end
