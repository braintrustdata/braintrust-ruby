# typed: strong

module Braintrust
  module Models
    class APIKey < Braintrust::BaseModel
      # Unique identifier for the api key
      sig { returns(String) }
      attr_accessor :id

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
          name: String,
          preview_name: String,
          created: T.nilable(Time),
          org_id: T.nilable(String),
          user_id: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(id:, name:, preview_name:, created: nil, org_id: nil, user_id: nil)
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              preview_name: String,
              created: T.nilable(Time),
              org_id: T.nilable(String),
              user_id: T.nilable(String)
            }
          )
      end
      def to_hash
      end
    end
  end
end
