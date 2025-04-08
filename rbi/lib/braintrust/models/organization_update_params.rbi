# typed: strong

module Braintrust
  module Models
    class OrganizationUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      sig { returns(T.nilable(String)) }
      attr_accessor :api_url

      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :is_universal_api

      # Name of the organization
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      sig { returns(T.nilable(String)) }
      attr_accessor :proxy_url

      sig { returns(T.nilable(String)) }
      attr_accessor :realtime_url

      sig do
        params(
          api_url: T.nilable(String),
          is_universal_api: T.nilable(T::Boolean),
          name: T.nilable(String),
          proxy_url: T.nilable(String),
          realtime_url: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        api_url: nil,
        is_universal_api: nil,
        name: nil,
        proxy_url: nil,
        realtime_url: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              api_url: T.nilable(String),
              is_universal_api: T.nilable(T::Boolean),
              name: T.nilable(String),
              proxy_url: T.nilable(String),
              realtime_url: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash; end
    end
  end
end
