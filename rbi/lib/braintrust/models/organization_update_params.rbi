# typed: strong

module Braintrust
  module Models
    class OrganizationUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(String)) }
      def api_url
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def api_url=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def is_universal_api
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def is_universal_api=(_)
      end

      # Name of the organization
      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      sig { returns(T.nilable(String)) }
      def proxy_url
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def proxy_url=(_)
      end

      sig { returns(T.nilable(String)) }
      def realtime_url
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def realtime_url=(_)
      end

      sig do
        params(
          api_url: T.nilable(String),
          is_universal_api: T.nilable(T::Boolean),
          name: T.nilable(String),
          proxy_url: T.nilable(String),
          realtime_url: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(api_url: nil, is_universal_api: nil, name: nil, proxy_url: nil, realtime_url: nil, request_options: {})
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
      def to_hash
      end
    end
  end
end
