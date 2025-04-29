# typed: strong

module Braintrust
  module Models
    class CreateAPIKeyOutput < Braintrust::Internal::Type::BaseModel
      # Unique identifier for the api key
      sig { returns(String) }
      attr_accessor :id

      # The raw API key. It will only be exposed this one time
      sig { returns(String) }
      attr_accessor :key

      # Name of the api key
      sig { returns(String) }
      attr_accessor :name

      sig { returns(String) }
      attr_accessor :preview_name

      # Date of api key creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Unique identifier for the organization
      sig { returns(T.nilable(String)) }
      attr_accessor :org_id

      # Unique identifier for the user
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      sig do
        params(
          id: String,
          key: String,
          name: String,
          preview_name: String,
          created: T.nilable(Time),
          org_id: T.nilable(String),
          user_id: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the api key
        id:,
        # The raw API key. It will only be exposed this one time
        key:,
        # Name of the api key
        name:,
        preview_name:,
        # Date of api key creation
        created: nil,
        # Unique identifier for the organization
        org_id: nil,
        # Unique identifier for the user
        user_id: nil
      ); end
      sig do
        override
          .returns(
            {
              id: String,
              key: String,
              name: String,
              preview_name: String,
              created: T.nilable(Time),
              org_id: T.nilable(String),
              user_id: T.nilable(String)
            }
          )
      end
      def to_hash; end
    end
  end
end
