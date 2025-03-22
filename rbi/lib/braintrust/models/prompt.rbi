# typed: strong

module Braintrust
  module Models
    class Prompt < Braintrust::BaseModel
      # Unique identifier for the prompt
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # The transaction id of an event is unique to the network operation that processed
      #   the event insertion. Transaction ids are monotonically increasing over time and
      #   can be used to retrieve a versioned snapshot of the prompt (see the `version`
      #   parameter)
      sig { returns(String) }
      def _xact_id
      end

      sig { params(_: String).returns(String) }
      def _xact_id=(_)
      end

      # A literal 'p' which identifies the object as a project prompt
      sig { returns(Braintrust::Models::Prompt::LogID::TaggedSymbol) }
      def log_id
      end

      sig do
        params(_: Braintrust::Models::Prompt::LogID::TaggedSymbol)
          .returns(Braintrust::Models::Prompt::LogID::TaggedSymbol)
      end
      def log_id=(_)
      end

      # Name of the prompt
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # Unique identifier for the organization
      sig { returns(String) }
      def org_id
      end

      sig { params(_: String).returns(String) }
      def org_id=(_)
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

      # Date of prompt creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      # Textual description of the prompt
      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::Prompt::FunctionType::TaggedSymbol)) }
      def function_type
      end

      sig do
        params(_: T.nilable(Braintrust::Models::Prompt::FunctionType::TaggedSymbol))
          .returns(T.nilable(Braintrust::Models::Prompt::FunctionType::TaggedSymbol))
      end
      def function_type=(_)
      end

      # User-controlled metadata about the prompt
      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      # The prompt, model, and its parameters
      sig { returns(T.nilable(Braintrust::Models::PromptData)) }
      def prompt_data
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::PromptData, Braintrust::Util::AnyHash)))
      end
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

        class << self
          sig { override.returns(T::Array[Braintrust::Models::Prompt::LogID::TaggedSymbol]) }
          def values
          end
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

        class << self
          sig { override.returns(T::Array[Braintrust::Models::Prompt::FunctionType::TaggedSymbol]) }
          def values
          end
        end
      end
    end
  end
end
