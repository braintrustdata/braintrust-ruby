# typed: strong

module Braintrust
  module Models
    class ProjectUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::ProjectSettings)) }
      def settings
      end

      sig do
        params(_: T.nilable(Braintrust::Models::ProjectSettings))
          .returns(T.nilable(Braintrust::Models::ProjectSettings))
      end
      def settings=(_)
      end

      sig do
        params(
          name: T.nilable(String),
          settings: T.nilable(Braintrust::Models::ProjectSettings),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(name: nil, settings: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              name: T.nilable(String),
              settings: T.nilable(Braintrust::Models::ProjectSettings),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
