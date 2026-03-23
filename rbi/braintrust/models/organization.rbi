# typed: strong

module Braintrust
  module Models
    class Organization < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Braintrust::Organization, Braintrust::Internal::AnyHash)
        end

      # Unique identifier for the organization
      sig { returns(String) }
      attr_accessor :id

      # Name of the organization
      sig { returns(String) }
      attr_accessor :name

      sig { returns(T.nilable(String)) }
      attr_accessor :api_url

      # Date of organization creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_universal_api

      sig { returns(T.nilable(String)) }
      attr_accessor :proxy_url

      sig { returns(T.nilable(String)) }
      attr_accessor :realtime_url

      sig do
        params(
          id: String,
          name: String,
          api_url: T.nilable(String),
          created: T.nilable(Time),
          is_universal_api: T.nilable(T::Boolean),
          proxy_url: T.nilable(String),
          realtime_url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the organization
        id:,
        # Name of the organization
        name:,
        api_url: nil,
        # Date of organization creation
        created: nil,
        is_universal_api: nil,
        proxy_url: nil,
        realtime_url: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            api_url: T.nilable(String),
            created: T.nilable(Time),
            is_universal_api: T.nilable(T::Boolean),
            proxy_url: T.nilable(String),
            realtime_url: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
