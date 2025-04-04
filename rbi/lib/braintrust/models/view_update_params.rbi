# typed: strong

module Braintrust
  module Models
    class ViewUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # The id of the object the view applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
      attr_accessor :object_type

      # Name of the view
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Options for the view in the app
      sig { returns(T.nilable(Braintrust::Models::ViewOptions)) }
      attr_reader :options

      sig { params(options: T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Internal::AnyHash))).void }
      attr_writer :options

      # Identifies the user who created the view
      sig { returns(T.nilable(String)) }
      attr_accessor :user_id

      # The view definition
      sig { returns(T.nilable(Braintrust::Models::ViewData)) }
      attr_reader :view_data

      sig { params(view_data: T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Internal::AnyHash))).void }
      attr_writer :view_data

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Braintrust::Models::ViewUpdateParams::ViewType::OrSymbol)) }
      attr_accessor :view_type

      sig do
        params(
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          name: T.nilable(String),
          options: T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Internal::AnyHash)),
          user_id: T.nilable(String),
          view_data: T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Internal::AnyHash)),
          view_type: T.nilable(Braintrust::Models::ViewUpdateParams::ViewType::OrSymbol),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Internal::AnyHash)
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
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ViewUpdateParams::ViewType) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol) }

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

        sig { override.returns(T::Array[Braintrust::Models::ViewUpdateParams::ViewType::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
