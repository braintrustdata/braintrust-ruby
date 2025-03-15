# typed: strong

module Braintrust
  module Models
    class ProjectTagUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Color of the tag for the UI
      sig { returns(T.nilable(String)) }
      def color
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def color=(_)
      end

      # Textual description of the project tag
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # Name of the project tag
      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      sig do
        params(
          color: T.nilable(String),
          description: T.nilable(String),
          name: T.nilable(String),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(color: nil, description: nil, name: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              color: T.nilable(String),
              description: T.nilable(String),
              name: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
