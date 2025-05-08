# typed: strong

module Braintrust
  module Models
    class DatasetCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the dataset. Within a project, dataset names are unique
        name:,
        # Unique identifier for the project that the dataset belongs under
        project_id:,
        # Textual description of the dataset
        description: nil,
        # User-controlled metadata about the dataset
        metadata: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
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
