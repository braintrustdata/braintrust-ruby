# typed: strong

module Braintrust
  module Models
    class ProjectTagCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Name of the project tag
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the project tag belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # Color of the tag for the UI
      sig { returns(T.nilable(String)) }
      attr_accessor :color

      # Textual description of the project tag
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig do
        params(
          name: String,
          project_id: String,
          color: T.nilable(String),
          description: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the project tag
        name:,
        # Unique identifier for the project that the project tag belongs under
        project_id:,
        # Color of the tag for the UI
        color: nil,
        # Textual description of the project tag
        description: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            project_id: String,
            color: T.nilable(String),
            description: T.nilable(String),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
