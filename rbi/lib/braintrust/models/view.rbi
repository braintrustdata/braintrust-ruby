# typed: strong

module Braintrust
  module Models
    class View < Braintrust::BaseModel
      # Unique identifier for the view
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # Name of the view
      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      # The id of the object the view applies to
      sig { returns(String) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      # The object type that the ACL applies to
      sig { returns(Braintrust::Models::ACLObjectType::TaggedSymbol) }
      def object_type
      end

      sig do
        params(_: Braintrust::Models::ACLObjectType::TaggedSymbol)
          .returns(Braintrust::Models::ACLObjectType::TaggedSymbol)
      end
      def object_type=(_)
      end

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Braintrust::Models::View::ViewType::TaggedSymbol)) }
      def view_type
      end

      sig do
        params(_: T.nilable(Braintrust::Models::View::ViewType::TaggedSymbol))
          .returns(T.nilable(Braintrust::Models::View::ViewType::TaggedSymbol))
      end
      def view_type=(_)
      end

      # Date of view creation
      sig { returns(T.nilable(Time)) }
      def created
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def created=(_)
      end

      # Date of role deletion, or null if the role is still active
      sig { returns(T.nilable(Time)) }
      def deleted_at
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def deleted_at=(_)
      end

      # Options for the view in the app
      sig { returns(T.nilable(Braintrust::Models::ViewOptions)) }
      def options
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Util::AnyHash)))
      end
      def options=(_)
      end

      # Identifies the user who created the view
      sig { returns(T.nilable(String)) }
      def user_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def user_id=(_)
      end

      # The view definition
      sig { returns(T.nilable(Braintrust::Models::ViewData)) }
      def view_data
      end

      sig do
        params(_: T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Util::AnyHash)))
          .returns(T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Util::AnyHash)))
      end
      def view_data=(_)
      end

      sig do
        params(
          id: String,
          name: String,
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::TaggedSymbol,
          view_type: T.nilable(Braintrust::Models::View::ViewType::TaggedSymbol),
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          options: T.nilable(Braintrust::Models::ViewOptions),
          user_id: T.nilable(String),
          view_data: T.nilable(Braintrust::Models::ViewData)
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        name:,
        object_id_:,
        object_type:,
        view_type:,
        created: nil,
        deleted_at: nil,
        options: nil,
        user_id: nil,
        view_data: nil
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              name: String,
              object_id_: String,
              object_type: Braintrust::Models::ACLObjectType::TaggedSymbol,
              view_type: T.nilable(Braintrust::Models::View::ViewType::TaggedSymbol),
              created: T.nilable(Time),
              deleted_at: T.nilable(Time),
              options: T.nilable(Braintrust::Models::ViewOptions),
              user_id: T.nilable(String),
              view_data: T.nilable(Braintrust::Models::ViewData)
            }
          )
      end
      def to_hash
      end

      # Type of table that the view corresponds to.
      module ViewType
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::View::ViewType) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::View::ViewType::TaggedSymbol) }

        PROJECTS = T.let(:projects, Braintrust::Models::View::ViewType::TaggedSymbol)
        EXPERIMENTS = T.let(:experiments, Braintrust::Models::View::ViewType::TaggedSymbol)
        EXPERIMENT = T.let(:experiment, Braintrust::Models::View::ViewType::TaggedSymbol)
        PLAYGROUNDS = T.let(:playgrounds, Braintrust::Models::View::ViewType::TaggedSymbol)
        PLAYGROUND = T.let(:playground, Braintrust::Models::View::ViewType::TaggedSymbol)
        DATASETS = T.let(:datasets, Braintrust::Models::View::ViewType::TaggedSymbol)
        DATASET = T.let(:dataset, Braintrust::Models::View::ViewType::TaggedSymbol)
        PROMPTS = T.let(:prompts, Braintrust::Models::View::ViewType::TaggedSymbol)
        TOOLS = T.let(:tools, Braintrust::Models::View::ViewType::TaggedSymbol)
        SCORERS = T.let(:scorers, Braintrust::Models::View::ViewType::TaggedSymbol)
        LOGS = T.let(:logs, Braintrust::Models::View::ViewType::TaggedSymbol)
      end
    end
  end
end
