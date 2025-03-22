# typed: strong

module Braintrust
  module Models
    class Prompt < Braintrust::BaseModel
      # Unique identifier for the prompt
      sig { returns(String) }
      attr_accessor :id

      # The transaction id of an event is unique to the network operation that processed
      #   the event insertion. Transaction ids are monotonically increasing over time and
      #   can be used to retrieve a versioned snapshot of the prompt (see the `version`
      #   parameter)
      sig { returns(String) }
      attr_accessor :_xact_id

      # A literal 'p' which identifies the object as a project prompt
      sig { returns(Braintrust::Models::Prompt::LogID::TaggedSymbol) }
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

      sig { returns(T.nilable(Braintrust::Models::Prompt::FunctionType::TaggedSymbol)) }
      attr_accessor :function_type

      # User-controlled metadata about the prompt
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      attr_accessor :metadata

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      attr_reader :prompt_data

      sig { params(prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash))).void }
      attr_writer :prompt_data

      # A list of tags for the prompt
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      sig do
        params(
          id: String,
          _xact_id: String,
          log_id: Braintrust::Models::Prompt::LogID::OrSymbol,
          name: String,
          org_id: String,
          project_id: String,
          slug: String,
          created: T.nilable(Time),
          description: T.nilable(String),
          function_type: T.nilable(Braintrust::Models::Prompt::FunctionType::OrSymbol),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          prompt_data: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)),
          tags: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        _xact_id:,
        log_id:,
        name:,
        org_id:,
        project_id:,
        slug:,
        created: nil,
        description: nil,
        function_type: nil,
        metadata: nil,
        prompt_data: nil,
        tags: nil
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              _xact_id: String,
              log_id: Braintrust::Models::Prompt::LogID::TaggedSymbol,
              name: String,
              org_id: String,
              project_id: String,
              slug: String,
              created: T.nilable(Time),
              description: T.nilable(String),
              function_type: T.nilable(Braintrust::Models::Prompt::FunctionType::TaggedSymbol),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              prompt_data: T.nilable(Braintrust::Models::PromptData),
              tags: T.nilable(T::Array[String])
            }
          )
      end
      def to_hash
      end

      # A literal 'p' which identifies the object as a project prompt
      module LogID
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Prompt::LogID) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::Prompt::LogID::TaggedSymbol) }

        P = T.let(:p, Braintrust::Models::Prompt::LogID::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::Prompt::LogID::TaggedSymbol]) }
        def self.values
        end
      end

      module FunctionType
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::Prompt::FunctionType) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::Prompt::FunctionType::TaggedSymbol) }

        LLM = T.let(:llm, Braintrust::Models::Prompt::FunctionType::TaggedSymbol)
        SCORER = T.let(:scorer, Braintrust::Models::Prompt::FunctionType::TaggedSymbol)
        TASK = T.let(:task, Braintrust::Models::Prompt::FunctionType::TaggedSymbol)
        TOOL = T.let(:tool, Braintrust::Models::Prompt::FunctionType::TaggedSymbol)

        sig { override.returns(T::Array[Braintrust::Models::Prompt::FunctionType::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
