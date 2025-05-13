# typed: strong

module Braintrust
  module Models
    class Dataset < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Braintrust::Dataset, Braintrust::Internal::AnyHash)
        end

      # Unique identifier for the dataset
      sig { returns(String) }
      attr_accessor :id

      # Name of the dataset. Within a project, dataset names are unique
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the dataset belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # Date of dataset creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Date of dataset deletion, or null if the dataset is still active
      sig { returns(T.nilable(Time)) }
      attr_accessor :deleted_at

      # Textual description of the dataset
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # User-controlled metadata about the dataset
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      # Identifies the user who created the dataset
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          id: String,
          name: String,
          project_id: String,
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          description: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          user_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the dataset
        id:,
        # Name of the dataset. Within a project, dataset names are unique
        name:,
        # Unique identifier for the project that the dataset belongs under
        project_id:,
        # Date of dataset creation
        created: nil,
        # Date of dataset deletion, or null if the dataset is still active
        deleted_at: nil,
        # Textual description of the dataset
        description: nil,
        # User-controlled metadata about the dataset
        metadata: nil,
        # Identifies the user who created the dataset
        user_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            project_id: String,
            created: T.nilable(Time),
            deleted_at: T.nilable(Time),
            description: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
            user_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
