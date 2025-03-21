# typed: strong

module Braintrust
  module Models
    class ViewReplaceParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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
      sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
      def object_type
      end

      sig do
        params(_: Braintrust::Models::ACLObjectType::OrSymbol).returns(Braintrust::Models::ACLObjectType::OrSymbol)
      end
      def object_type=(_)
      end

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)) }
      def view_type
      end

      sig do
        params(_: T.nilable(Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol))
          .returns(T.nilable(Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol))
      end
      def view_type=(_)
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
          name: String,
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          view_type: T.nilable(Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol),
          deleted_at: T.nilable(Time),
          options: T.nilable(Braintrust::Models::ViewOptions),
          user_id: T.nilable(String),
          view_data: T.nilable(Braintrust::Models::ViewData),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
        name:,
        object_id_:,
        object_type:,
        view_type:,
        deleted_at: nil,
        options: nil,
        user_id: nil,
        view_data: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              name: String,
              object_id_: String,
              object_type: Braintrust::Models::ACLObjectType::OrSymbol,
              view_type: T.nilable(Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol),
              deleted_at: T.nilable(Time),
              options: T.nilable(Braintrust::Models::ViewOptions),
              user_id: T.nilable(String),
              view_data: T.nilable(Braintrust::Models::ViewData),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # Type of table that the view corresponds to.
      module ViewType
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ViewReplaceParams::ViewType) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::ViewReplaceParams::ViewType::TaggedSymbol) }

        PROJECTS = T.let(:projects, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
        EXPERIMENTS = T.let(:experiments, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
        EXPERIMENT = T.let(:experiment, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
        PLAYGROUNDS = T.let(:playgrounds, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
        PLAYGROUND = T.let(:playground, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
        DATASETS = T.let(:datasets, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
        DATASET = T.let(:dataset, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
        PROMPTS = T.let(:prompts, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
        TOOLS = T.let(:tools, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
        SCORERS = T.let(:scorers, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
        LOGS = T.let(:logs, Braintrust::Models::ViewReplaceParams::ViewType::OrSymbol)
      end
    end
  end
end
