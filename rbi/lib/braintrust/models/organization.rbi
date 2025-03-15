# typed: strong

module Braintrust
  module Models
    class Organization < Braintrust::BaseModel
      # Unique identifier for the organization
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # Name of the organization
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(T.nilable(String)) }
      def api_url
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def api_url=(_)
      end

      # Date of organization creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def is_universal_api
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def is_universal_api=(_)
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
          id: String,
          name: String,
          api_url: T.nilable(String),
          created: T.nilable(Time),
          is_universal_api: T.nilable(T::Boolean),
          proxy_url: T.nilable(String),
          realtime_url: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(id:, name:, api_url: nil, created: nil, is_universal_api: nil, proxy_url: nil, realtime_url: nil)
      end

      sig do
        override
          .returns(
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
