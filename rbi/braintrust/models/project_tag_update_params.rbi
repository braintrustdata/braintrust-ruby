# typed: strong

module Braintrust
  module Models
    class ProjectTagUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Braintrust::ProjectTagUpdateParams,
            Braintrust::Internal::AnyHash
          )
        end

      # Color of the tag for the UI
      sig { returns(T.nilable(String)) }
      attr_accessor :color

      # Textual description of the project tag
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Name of the project tag
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      sig do
        params(
          color: T.nilable(String),
          description: T.nilable(String),
          name: T.nilable(String),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Color of the tag for the UI
        color: nil,
        # Textual description of the project tag
        description: nil,
        # Name of the project tag
        name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
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
