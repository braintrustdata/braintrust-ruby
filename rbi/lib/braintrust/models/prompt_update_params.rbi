# typed: strong

module Braintrust
  module Models
    class PromptUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      # Name of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      attr_reader :prompt_data

      sig { params(prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::AnyHash))).void }
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
          prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::AnyHash)),
          slug: T.nilable(String),
          tags: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(description: nil, name: nil, prompt_data: nil, slug: nil, tags: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              description: T.nilable(String),
              name: T.nilable(String),
              prompt_data: T.nilable(Braintrust::Models::PromptData),
              slug: T.nilable(String),
              tags: T.nilable(T::Array[String]),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash; end
    end
  end
end
