# typed: strong

module Braintrust
  module Models
    class DatasetCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the dataset. Within a project, dataset names are unique
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Unique identifier for the project that the dataset belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # Textual description of the dataset
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # User-controlled metadata about the dataset
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      sig do
        params(
          name: String,
          project_id: String,
          description: T.nilable(String),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(name:, project_id:, description: nil, metadata: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              name: String,
              project_id: String,
              description: T.nilable(String),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
