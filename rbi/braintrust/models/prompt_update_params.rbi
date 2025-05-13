# typed: strong

module Braintrust
  module Models
    class PromptUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Braintrust::PromptUpdateParams, Braintrust::Internal::AnyHash)
        end

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Name of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::PromptData)) }
      attr_reader :prompt_data

      sig do
        params(prompt_data: T.nilable(Braintrust::PromptData::OrHash)).void
      end
      attr_writer :prompt_data

      # Unique identifier for the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :slug

      # A list of tags for the prompt
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          description: T.nilable(String),
          name: T.nilable(String),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          slug: T.nilable(String),
          tags: T.nilable(T::Array[String]),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Textual description of the prompt
        description: nil,
        # Name of the prompt
        name: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # Unique identifier for the prompt
        slug: nil,
        # A list of tags for the prompt
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            description: T.nilable(String),
            name: T.nilable(String),
            prompt_data: T.nilable(Braintrust::PromptData),
            slug: T.nilable(String),
            tags: T.nilable(T::Array[String]),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
