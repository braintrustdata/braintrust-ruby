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
      sig { returns(Symbol) }
      def log_id
      end

      sig { params(_: Symbol).returns(Symbol) }
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

      sig { returns(T.nilable(Symbol)) }
      def function_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
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
          id: String,
          _xact_id: String,
          log_id: Symbol,
          name: String,
          org_id: String,
          project_id: String,
          slug: String,
          created: T.nilable(Time),
          description: T.nilable(String),
          function_type: T.nilable(Symbol),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          prompt_data: T.nilable(Braintrust::Models::PromptData),
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
              log_id: Symbol,
              name: String,
              org_id: String,
              project_id: String,
              slug: String,
              created: T.nilable(Time),
              description: T.nilable(String),
              function_type: T.nilable(Symbol),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              prompt_data: T.nilable(Braintrust::Models::PromptData),
              tags: T.nilable(T::Array[String])
            }
          )
      end
      def to_hash
      end

      # A literal 'p' which identifies the object as a project prompt
      class LogID < Braintrust::Enum
        abstract!

        Value = type_template(:out) { {fixed: Symbol} }

        P = :p
      end

      class FunctionType < Braintrust::Enum
        abstract!

        Value = type_template(:out) { {fixed: Symbol} }

        LLM = :llm
        SCORER = :scorer
        TASK = :task
        TOOL = :tool
      end
    end
  end
end
