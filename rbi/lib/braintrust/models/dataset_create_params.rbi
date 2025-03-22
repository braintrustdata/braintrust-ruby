# typed: strong

module Braintrust
  module Models
    class DatasetCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the dataset. Within a project, dataset names are unique
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the dataset belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # Textual description of the dataset
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # User-controlled metadata about the dataset
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

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
