# typed: strong

module Braintrust
  module Models
    class PromptReplaceParams < Braintrust::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # Name of the prompt
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the project that the prompt belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # Unique identifier for the prompt
      sig { returns(String) }
      attr_accessor :slug

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig { returns(T.nilable(Braintrust::Models::PromptReplaceParams::FunctionType::OrSymbol)) }
      attr_accessor :function_type

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      attr_reader :prompt_data

      sig do
        params(prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::Util::AnyHash)))
          .void
      end
      attr_writer :prompt_data

      # A list of tags for the prompt
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          name: String,
          project_id: String,
          slug: String,
          description: T.nilable(String),
          function_type: T.nilable(Braintrust::Models::PromptReplaceParams::FunctionType::OrSymbol),
          prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Internal::Util::AnyHash)),
          tags: T.nilable(T::Array[String]),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::Util::AnyHash)
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
              function_type: T.nilable(Braintrust::Models::PromptReplaceParams::FunctionType::OrSymbol),
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

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::PromptReplaceParams::FunctionType) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Braintrust::Models::PromptReplaceParams::FunctionType::TaggedSymbol) }

        LLM = T.let(:llm, Braintrust::Models::PromptReplaceParams::FunctionType::TaggedSymbol)
        SCORER = T.let(:scorer, Braintrust::Models::PromptReplaceParams::FunctionType::TaggedSymbol)
        TASK = T.let(:task, Braintrust::Models::PromptReplaceParams::FunctionType::TaggedSymbol)
        TOOL = T.let(:tool, Braintrust::Models::PromptReplaceParams::FunctionType::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::PromptReplaceParams::FunctionType::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
