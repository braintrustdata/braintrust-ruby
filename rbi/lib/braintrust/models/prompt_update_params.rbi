# typed: strong

module Braintrust
  module Models
    class PromptUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      # Name of the prompt
      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data
      end

      sig { params(_: T.nilable(Braintrust::Models::PromptData)).returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data=(_)
      end

      # Unique identifier for the prompt
      sig { returns(T.nilable(String)) }
      def slug
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def slug=(_)
      end

      # A list of tags for the prompt
      sig { returns(T.nilable(T::Array[String])) }
      def tags
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def tags=(_)
      end

      sig do
        params(
          description: T.nilable(String),
          name: T.nilable(String),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          slug: T.nilable(String),
          tags: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
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
      def to_hash
      end
    end
  end
end
