# typed: strong

module Braintrust
  module Models
    class Prompt < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Braintrust::Prompt, Braintrust::Internal::AnyHash)
        end

      # Unique identifier for the prompt
      sig { returns(String) }
      attr_accessor :id

      # The transaction id of an event is unique to the network operation that processed
      # the event insertion. Transaction ids are monotonically increasing over time and
      # can be used to retrieve a versioned snapshot of the prompt (see the `version`
      # parameter)
      sig { returns(String) }
      attr_accessor :_xact_id

      # A literal 'p' which identifies the object as a project prompt
      sig { returns(Braintrust::Prompt::LogID::TaggedSymbol) }
      attr_accessor :log_id

      # Name of the prompt
      sig { returns(String) }
      attr_accessor :name

      # Unique identifier for the organization
      sig { returns(String) }
      attr_accessor :org_id

      # Unique identifier for the project that the prompt belongs under
      sig { returns(String) }
      attr_accessor :project_id

      # Unique identifier for the prompt
      sig { returns(String) }
      attr_accessor :slug

      # Date of prompt creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig { returns(T.nilable(Braintrust::Prompt::FunctionType::TaggedSymbol)) }
      attr_accessor :function_type

      # User-controlled metadata about the prompt
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

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
          id: String,
          _xact_id: String,
          log_id: Braintrust::Prompt::LogID::OrSymbol,
          name: String,
          org_id: String,
          project_id: String,
          slug: String,
          created: T.nilable(Time),
          description: T.nilable(String),
          function_type: T.nilable(Braintrust::Prompt::FunctionType::OrSymbol),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          prompt_data: T.nilable(Braintrust::PromptData::OrHash),
          tags: T.nilable(T::Array[String])
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the prompt
        id:,
        # The transaction id of an event is unique to the network operation that processed
        # the event insertion. Transaction ids are monotonically increasing over time and
        # can be used to retrieve a versioned snapshot of the prompt (see the `version`
        # parameter)
        _xact_id:,
        # A literal 'p' which identifies the object as a project prompt
        log_id:,
        # Name of the prompt
        name:,
        # Unique identifier for the organization
        org_id:,
        # Unique identifier for the project that the prompt belongs under
        project_id:,
        # Unique identifier for the prompt
        slug:,
        # Date of prompt creation
        created: nil,
        # Textual description of the prompt
        description: nil,
        function_type: nil,
        # User-controlled metadata about the prompt
        metadata: nil,
        # The prompt, model, and its parameters
        prompt_data: nil,
        # A list of tags for the prompt
        tags: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            _xact_id: String,
            log_id: Braintrust::Prompt::LogID::TaggedSymbol,
            name: String,
            org_id: String,
            project_id: String,
            slug: String,
            created: T.nilable(Time),
            description: T.nilable(String),
            function_type:
              T.nilable(Braintrust::Prompt::FunctionType::TaggedSymbol),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
            prompt_data: T.nilable(Braintrust::PromptData),
            tags: T.nilable(T::Array[String])
          }
        )
      end
      def to_hash
      end

      # A literal 'p' which identifies the object as a project prompt
      module LogID
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Prompt::LogID) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        P = T.let(:p, Braintrust::Prompt::LogID::TaggedSymbol)

        sig do
          override.returns(T::Array[Braintrust::Prompt::LogID::TaggedSymbol])
        end
        def self.values
        end
      end

      module FunctionType
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Braintrust::Prompt::FunctionType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LLM = T.let(:llm, Braintrust::Prompt::FunctionType::TaggedSymbol)
        SCORER = T.let(:scorer, Braintrust::Prompt::FunctionType::TaggedSymbol)
        TASK = T.let(:task, Braintrust::Prompt::FunctionType::TaggedSymbol)
        TOOL = T.let(:tool, Braintrust::Prompt::FunctionType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Braintrust::Prompt::FunctionType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
