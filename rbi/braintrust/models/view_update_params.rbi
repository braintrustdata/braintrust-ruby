# typed: strong

module Braintrust
  module Models
    class ViewUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # The id of the object the view applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::ACLObjectType::OrSymbol) }
      attr_accessor :object_type

      # Name of the view
      sig { returns(T.nilable(String)) }
      attr_accessor :name

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

      # Type of table that the view corresponds to.
      sig do
        returns(T.nilable(Braintrust::ViewUpdateParams::ViewType::OrSymbol))
      end
      attr_accessor :view_type

      sig do
        params(
          object_id_: String,
          object_type: Braintrust::ACLObjectType::OrSymbol,
          name: T.nilable(String),
          options: T.nilable(Braintrust::ViewOptions::OrHash),
          user_id: T.nilable(String),
          view_data: T.nilable(Braintrust::ViewData::OrHash),
          view_type:
            T.nilable(Braintrust::ViewUpdateParams::ViewType::OrSymbol),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The id of the object the view applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Name of the view
        name: nil,
        # Options for the view in the app
        options: nil,
        # Identifies the user who created the view
        user_id: nil,
        # The view definition
        view_data: nil,
        # Type of table that the view corresponds to.
        view_type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            object_id_: String,
            object_type: Braintrust::ACLObjectType::OrSymbol,
            name: T.nilable(String),
            options: T.nilable(Braintrust::ViewOptions),
            user_id: T.nilable(String),
            view_data: T.nilable(Braintrust::ViewData),
            view_type:
              T.nilable(Braintrust::ViewUpdateParams::ViewType::OrSymbol),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Type of table that the view corresponds to.
      module ViewType
        extend Braintrust::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Braintrust::ViewUpdateParams::ViewType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PROJECTS =
          T.let(:projects, Braintrust::ViewUpdateParams::ViewType::TaggedSymbol)
        EXPERIMENTS =
          T.let(
            :experiments,
            Braintrust::ViewUpdateParams::ViewType::TaggedSymbol
          )
        EXPERIMENT =
          T.let(
            :experiment,
            Braintrust::ViewUpdateParams::ViewType::TaggedSymbol
          )
        PLAYGROUNDS =
          T.let(
            :playgrounds,
            Braintrust::ViewUpdateParams::ViewType::TaggedSymbol
          )
        PLAYGROUND =
          T.let(
            :playground,
            Braintrust::ViewUpdateParams::ViewType::TaggedSymbol
          )
        DATASETS =
          T.let(:datasets, Braintrust::ViewUpdateParams::ViewType::TaggedSymbol)
        DATASET =
          T.let(:dataset, Braintrust::ViewUpdateParams::ViewType::TaggedSymbol)
        PROMPTS =
          T.let(:prompts, Braintrust::ViewUpdateParams::ViewType::TaggedSymbol)
        TOOLS =
          T.let(:tools, Braintrust::ViewUpdateParams::ViewType::TaggedSymbol)
        SCORERS =
          T.let(:scorers, Braintrust::ViewUpdateParams::ViewType::TaggedSymbol)
        LOGS =
          T.let(:logs, Braintrust::ViewUpdateParams::ViewType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Braintrust::ViewUpdateParams::ViewType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
