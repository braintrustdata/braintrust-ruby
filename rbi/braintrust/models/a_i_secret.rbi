# typed: strong

module Braintrust
  module Models
    class AISecret < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Unique identifier for the AI secret
      sig { returns(String) }
      attr_accessor :id

      # Name of the AI secret
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the organization
      sig { returns(String) }
      attr_accessor :org_id

      # Date of AI secret creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      sig { returns(T.nilable(String)) }
      attr_accessor :preview_secret

      sig { returns(T.nilable(String)) }
      attr_accessor :type

      # Date of last AI secret update
      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      sig do
        params(
          id: String,
          name: String,
          org_id: String,
          created: T.nilable(Time),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          preview_secret: T.nilable(String),
          type: T.nilable(String),
          updated_at: T.nilable(Time)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the AI secret
        id:,
        # Name of the AI secret
        name:,
        # Unique identifier for the organization
        org_id:,
        # Date of AI secret creation
        created: nil,
        metadata: nil,
        preview_secret: nil,
        type: nil,
        # Date of last AI secret update
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            org_id: String,
            created: T.nilable(Time),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
            preview_secret: T.nilable(String),
            type: T.nilable(String),
            updated_at: T.nilable(Time)
          }
        )
      end
      def to_hash
      end
    end
  end
end
