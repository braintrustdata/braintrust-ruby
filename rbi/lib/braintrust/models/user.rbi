# typed: strong

module Braintrust
  module Models
    class User < Braintrust::BaseModel
      # Unique identifier for the user
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # URL of the user's Avatar image
      sig { returns(T.nilable(String)) }
      def avatar_url
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def avatar_url=(_)
      end

      # Date of user creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      # The user's email
      sig { returns(T.nilable(String)) }
      def email
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def email=(_)
      end

      # Family name of the user
      sig { returns(T.nilable(String)) }
      def family_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def family_name=(_)
      end

      # Given name of the user
      sig { returns(T.nilable(String)) }
      def given_name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def given_name=(_)
      end

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
      def self.new(id:, avatar_url: nil, created: nil, email: nil, family_name: nil, given_name: nil)
      end

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
      def to_hash
      end
    end
  end
end
