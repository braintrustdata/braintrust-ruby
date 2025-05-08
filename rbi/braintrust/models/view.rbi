# typed: strong

module Braintrust
  module Models
    class View < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

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
      sig { returns(Braintrust::ACLObjectType::TaggedSymbol) }
      attr_accessor :object_type

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Braintrust::View::ViewType::TaggedSymbol)) }
      attr_accessor :view_type

      # Date of view creation
      sig { returns(T.nilable(Time)) }
      attr_accessor :created

      # Date of role deletion, or null if the role is still active
      sig { returns(T.nilable(Time)) }
      attr_accessor :deleted_at

      # Options for the view in the app
      sig { returns(T.nilable(Braintrust::ViewOptions)) }
      attr_reader :options

      sig { params(options: T.nilable(Braintrust::ViewOptions::OrHash)).void }
      attr_writer :options

      # Identifies the user who created the view
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      # The view definition
      sig { returns(T.nilable(Braintrust::ViewData)) }
      attr_reader :view_data

      sig { params(view_data: T.nilable(Braintrust::ViewData::OrHash)).void }
      attr_writer :view_data

      sig do
        params(
          id: String,
          name: String,
          object_id_: String,
          object_type: Braintrust::ACLObjectType::OrSymbol,
          view_type: T.nilable(Braintrust::View::ViewType::OrSymbol),
          created: T.nilable(Time),
          deleted_at: T.nilable(Time),
          options: T.nilable(Braintrust::ViewOptions::OrHash),
          user_id: T.nilable(String),
          view_data: T.nilable(Braintrust::ViewData::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the view
        id:,
        # Name of the view
        name:,
        # The id of the object the view applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Type of table that the view corresponds to.
        view_type:,
        # Date of view creation
        created: nil,
        # Date of role deletion, or null if the role is still active
        deleted_at: nil,
        # Options for the view in the app
        options: nil,
        # Identifies the user who created the view
        user_id: nil,
        # The view definition
        view_data: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            name: String,
            object_id_: String,
            object_type: Braintrust::ACLObjectType::TaggedSymbol,
            view_type: T.nilable(Braintrust::View::ViewType::TaggedSymbol),
            created: T.nilable(Time),
            deleted_at: T.nilable(Time),
            options: T.nilable(Braintrust::ViewOptions),
            user_id: T.nilable(String),
            view_data: T.nilable(Braintrust::ViewData)
          }
        )
      end
      def to_hash
      end

      # Type of table that the view corresponds to.
      module ViewType
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Braintrust::View::ViewType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PROJECTS = T.let(:projects, Braintrust::View::ViewType::TaggedSymbol)
        EXPERIMENTS =
          T.let(:experiments, Braintrust::View::ViewType::TaggedSymbol)
        EXPERIMENT =
          T.let(:experiment, Braintrust::View::ViewType::TaggedSymbol)
        PLAYGROUNDS =
          T.let(:playgrounds, Braintrust::View::ViewType::TaggedSymbol)
        PLAYGROUND =
          T.let(:playground, Braintrust::View::ViewType::TaggedSymbol)
        DATASETS = T.let(:datasets, Braintrust::View::ViewType::TaggedSymbol)
        DATASET = T.let(:dataset, Braintrust::View::ViewType::TaggedSymbol)
        PROMPTS = T.let(:prompts, Braintrust::View::ViewType::TaggedSymbol)
        TOOLS = T.let(:tools, Braintrust::View::ViewType::TaggedSymbol)
        SCORERS = T.let(:scorers, Braintrust::View::ViewType::TaggedSymbol)
        LOGS = T.let(:logs, Braintrust::View::ViewType::TaggedSymbol)

        sig do
          override.returns(T::Array[Braintrust::View::ViewType::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
