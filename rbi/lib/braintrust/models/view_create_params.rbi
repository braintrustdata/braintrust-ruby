# typed: strong

module Braintrust
  module Models
    class ViewCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the view
      sig { returns(String) }
      attr_accessor :name

      # The id of the object the view applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::Models::ACLObjectType::OrSymbol) }
      attr_accessor :object_type

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Braintrust::Models::ViewCreateParams::ViewType::OrSymbol)) }
      attr_accessor :view_type

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
          name: String,
          object_id_: String,
          object_type: Braintrust::Models::ACLObjectType::OrSymbol,
          view_type: T.nilable(Braintrust::Models::ViewCreateParams::ViewType::OrSymbol),
          deleted_at: T.nilable(Time),
          options: T.nilable(T.any(Braintrust::Models::ViewOptions, Braintrust::Util::AnyHash)),
          user_id: T.nilable(String),
          view_data: T.nilable(T.any(Braintrust::Models::ViewData, Braintrust::Util::AnyHash)),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
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
              view_type: T.nilable(Braintrust::Models::ViewCreateParams::ViewType::OrSymbol),
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

        TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::ViewCreateParams::ViewType) }
        OrSymbol = T.type_alias { T.any(Symbol, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol) }

        PROJECTS = T.let(:projects, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)
        EXPERIMENTS = T.let(:experiments, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)
        EXPERIMENT = T.let(:experiment, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)
        PLAYGROUNDS = T.let(:playgrounds, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)
        PLAYGROUND = T.let(:playground, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)
        DATASETS = T.let(:datasets, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)
        DATASET = T.let(:dataset, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)
        PROMPTS = T.let(:prompts, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)
        TOOLS = T.let(:tools, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)
        SCORERS = T.let(:scorers, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)
        LOGS = T.let(:logs, Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol)

        class << self
          sig { override.returns(T::Array[Braintrust::Models::ViewCreateParams::ViewType::TaggedSymbol]) }
          def values
          end
        end
      end
    end
  end
end
