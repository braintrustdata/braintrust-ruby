# typed: strong

module Braintrust
  module Models
    class View < Braintrust::BaseModel
      # Unique identifier for the view
      sig { returns(String) }
      attr_accessor :id

      # Name of the view
      sig { returns(String) }
      attr_accessor :name

      # The id of the object the view applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::Models::ACLObjectType::TaggedSymbol) }
      attr_accessor :object_type

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Braintrust::Models::View::ViewType::TaggedSymbol)) }
      attr_accessor :view_type

      # Date of view creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Date of role deletion, or null if the role is still active
      sig { returns(T.nilable(Time)) }
      attr_accessor :deleted_at

      # Options for the view in the app
      sig { returns(T.nilable(Braintrust::Models::ViewOptions)) }
      attr_reader :options

      sig { params(options: T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Util::AnyHash))).void }
      attr_writer :options

      # Identifies the user who created the view
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      # The view definition
      sig { returns(T.nilable(Braintrust::Models::ViewData)) }
      attr_reader :view_data

      sig { params(view_data: T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Util::AnyHash))).void }
      attr_writer :view_data

      sig do
        params(
          id: String,
          name: String,
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          view_type: T.nilable(Braintrust::Models::View::ViewType::OrSymbol),
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          options: T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Util::AnyHash)),
          user_id: T.nilable(String),
          view_data: T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Util::AnyHash))
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

        sig { override.returns(T::Array[Braintrust::Models::View::ViewType::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
