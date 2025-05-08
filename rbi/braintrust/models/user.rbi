# typed: strong

module Braintrust
  module Models
    class User < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Unique identifier for the user
      sig { returns(String) }
      attr_accessor :id

      # URL of the user's Avatar image
      sig { returns(T.nilable(String)) }
      attr_accessor :avatar_url

      # Date of user creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # The user's email
      sig { returns(T.nilable(String)) }
      attr_accessor :email

      # Family name of the user
      sig { returns(T.nilable(String)) }
      attr_accessor :family_name

      # Given name of the user
      sig { returns(T.nilable(String)) }
      attr_accessor :given_name

      sig do
        params(
          id: String,
          avatar_url: T.nilable(String),
          created: T.nilable(Time),
          email: T.nilable(String),
          family_name: T.nilable(String),
          given_name: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the user
        id:,
        # URL of the user's Avatar image
        avatar_url: nil,
        # Date of user creation
        created: nil,
        # The user's email
        email: nil,
        # Family name of the user
        family_name: nil,
        # Given name of the user
        given_name: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            avatar_url: T.nilable(String),
            created: T.nilable(Time),
            email: T.nilable(String),
            family_name: T.nilable(String),
            given_name: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
