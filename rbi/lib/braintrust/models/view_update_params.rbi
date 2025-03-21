# typed: strong

module Braintrust
  module Models
    class ViewUpdateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

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

      # Name of the view
      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
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

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Braintrust::Models::ViewUpdateParams::ViewType::OrSymbol)) }
      def view_type
      end

      sig do
        params(_: T.nilable(Braintrust::Models::ViewUpdateParams::ViewType::OrSymbol))
          .returns(T.nilable(Braintrust::Models::ViewUpdateParams::ViewType::OrSymbol))
      end
      def view_type=(_)
      end

      sig do
        params(
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          name: T.nilable(String),
          options: T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Util::AnyHash)),
          user_id: T.nilable(String),
          view_data: T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Util::AnyHash)),
          view_type: T.nilable(Braintrust::Models::ViewUpdateParams::ViewType::OrSymbol),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        object_id_:,
        object_type:,
        name: nil,
        options: nil,
        user_id: nil,
        view_data: nil,
        view_type: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              object_id_: String,
              object_type: Braintrust::Models::ACLObjectType::OrSymbol,
              name: T.nilable(String),
              options: T.nilable(Braintrust::Models::ViewOptions),
              user_id: T.nilable(String),
              view_data: T.nilable(Braintrust::Models::ViewData),
              view_type: T.nilable(Braintrust::Models::ViewUpdateParams::ViewType::OrSymbol),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # Type of table that the view corresponds to.
      module ViewType
        extend Braintrust::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ViewUpdateParams::ViewType) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol) }

        PROJECTS = T.let(:projects, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)
        EXPERIMENTS = T.let(:experiments, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)
        EXPERIMENT = T.let(:experiment, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)
        PLAYGROUNDS = T.let(:playgrounds, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)
        PLAYGROUND = T.let(:playground, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)
        DATASETS = T.let(:datasets, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)
        DATASET = T.let(:dataset, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)
        PROMPTS = T.let(:prompts, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)
        TOOLS = T.let(:tools, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)
        SCORERS = T.let(:scorers, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)
        LOGS = T.let(:logs, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol)

        class << self
          sig { override.returns(T::Array[Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol]) }
          def values
          end
        end
      end
    end
  end
end
