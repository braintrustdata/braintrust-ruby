# typed: strong

module Braintrust
  module Models
    class ProjectTagCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

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
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(name:, project_id:, color: nil, description: nil, request_options: {}); end

      sig do
        override
          .returns(
            {
              name: String,
              project_id: String,
              color: T.nilable(String),
              description: T.nilable(String),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash; end
    end
  end
end
