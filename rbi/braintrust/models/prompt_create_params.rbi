# typed: strong

module Braintrust
  module Models
    class PromptCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Braintrust::PromptCreateParams, Braintrust::Internal::AnyHash)
        end

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

      sig do
        returns(
          T.nilable(Braintrust::PromptCreateParams::FunctionType::OrSymbol)
        )
      end
      attr_accessor :function_type

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::PromptData)) }
      attr_reader :prompt_data

      sig do
        params(prompt_data: T.nilable(Braintrust::PromptData::OrHash)).void
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
          function_type:
            T.nilable(Braintrust::PromptCreateParams::FunctionType::OrSymbol),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          tags: T.nilable(T::Array[String]),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the prompt
        name:,
        # Unique identifier for the project that the prompt belongs under
        project_id:,
        # Unique identifier for the prompt
        slug:,
        # Textual description of the prompt
        description: nil,
        function_type: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # A list of tags for the prompt
        tags: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            project_id: String,
            slug: String,
            description: T.nilable(String),
            function_type:
              T.nilable(Braintrust::PromptCreateParams::FunctionType::OrSymbol),
            prompt_data: T.nilable(Braintrust::PromptData),
            tags: T.nilable(T::Array[String]),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end

      module FunctionType
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Braintrust::PromptCreateParams::FunctionType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LLM =
          T.let(
            :llm,
            Braintrust::PromptCreateParams::FunctionType::TaggedSymbol
          )
        SCORER =
          T.let(
            :scorer,
            Braintrust::PromptCreateParams::FunctionType::TaggedSymbol
          )
        TASK =
          T.let(
            :task,
            Braintrust::PromptCreateParams::FunctionType::TaggedSymbol
          )
        TOOL =
          T.let(
            :tool,
            Braintrust::PromptCreateParams::FunctionType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Braintrust::PromptCreateParams::FunctionType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
