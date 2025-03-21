# typed: strong

module Braintrust
  module Models
    class PromptCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the prompt
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Unique identifier for the project that the prompt belongs under
      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      # Unique identifier for the prompt
      sig { returns(String) }
      def slug
      end

      sig { params(_: String).returns(String) }
      def slug=(_)
      end

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::PromptCreateParams::FunctionType::OrSymbol)) }
      def function_type
      end

      sig do
        params(_: T.nilable(Braintrust::Models::PromptCreateParams::FunctionType::OrSymbol))
          .returns(T.nilable(Braintrust::Models::PromptCreateParams::FunctionType::OrSymbol))
      end
      def function_type=(_)
      end

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data
      end

      sig { params(_: T.nilable(Braintrust::Models::PromptData)).returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data=(_)
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
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_type: T.nilable(Braintrust::Models::PromptCreateParams::FunctionType::OrSymbol),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
          tags: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
        name:,
        project_id:,
        slug:,
        description: nil,
        function_type: nil,
        prompt_data: nil,
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              name: String,
              project_id: String,
              slug: String,
              description: T.nilable(String),
              function_type: T.nilable(Braintrust::Models::PromptCreateParams::FunctionType::OrSymbol),
              prompt_data: T.nilable(Braintrust::Models::PromptData),
              tags: T.nilable(T::Array[String]),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      module FunctionType
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PromptCreateParams::FunctionType) }
        OrSymbol =
          T.type_alias { T.any(Symbol, Braintrust::Models::PromptCreateParams::FunctionType::TaggedSymbol) }

        LLM = T.let(:llm, Braintrust::Models::PromptCreateParams::FunctionType::OrSymbol)
        SCORER = T.let(:scorer, Braintrust::Models::PromptCreateParams::FunctionType::OrSymbol)
        TASK = T.let(:task, Braintrust::Models::PromptCreateParams::FunctionType::OrSymbol)
        TOOL = T.let(:tool, Braintrust::Models::PromptCreateParams::FunctionType::OrSymbol)
      end
    end
  end
end
