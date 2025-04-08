# typed: strong

module Braintrust
  module Models
    class User < Braintrust::Internal::Type::BaseModel
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
        )
          .returns(T.attached_class)
      end
      def self.new(id:, avatar_url: nil, created: nil, email: nil, family_name: nil, given_name: nil); end

      sig do
        override
          .returns(
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
      def to_hash; end
    end
  end
end
