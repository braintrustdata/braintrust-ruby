# typed: strong

module Braintrust
  module Models
    class ViewCreateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Name of the view
      sig { returns(String) }
      attr_accessor :name

      # The id of the object the view applies to
      sig { returns(String) }
      attr_accessor :object_id_

      # The object type that the ACL applies to
      sig { returns(Braintrust::ACLObjectType::OrSymbol) }
      attr_accessor :object_type

      # Type of table that the view corresponds to.
      sig do
        returns(T.nilable(Braintrust::ViewCreateParams::ViewType::OrSymbol))
      end
      attr_accessor :view_type

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
          name: String,
          object_id_: String,
          object_type: Braintrust::ACLObjectType::OrSymbol,
          view_type:
            T.nilable(Braintrust::ViewCreateParams::ViewType::OrSymbol),
          deleted_at: T.nilable(Time),
          options: T.nilable(Braintrust::ViewOptions::OrHash),
          user_id: T.nilable(String),
          view_data: T.nilable(Braintrust::ViewData::OrHash),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the view
        name:,
        # The id of the object the view applies to
        object_id_:,
        # The object type that the ACL applies to
        object_type:,
        # Type of table that the view corresponds to.
        view_type:,
        # Date of role deletion, or null if the role is still active
        deleted_at: nil,
        # Options for the view in the app
        options: nil,
        # Identifies the user who created the view
        user_id: nil,
        # The view definition
        view_data: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: String,
            object_id_: String,
            object_type: Braintrust::ACLObjectType::OrSymbol,
            view_type:
              T.nilable(Braintrust::ViewCreateParams::ViewType::OrSymbol),
            deleted_at: T.nilable(Time),
            options: T.nilable(Braintrust::ViewOptions),
            user_id: T.nilable(String),
            view_data: T.nilable(Braintrust::ViewData),
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
          T.type_alias { T.all(Symbol, Braintrust::ViewCreateParams::ViewType) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PROJECTS =
          T.let(:projects, Braintrust::ViewCreateParams::ViewType::TaggedSymbol)
        EXPERIMENTS =
          T.let(
            :experiments,
            Braintrust::ViewCreateParams::ViewType::TaggedSymbol
          )
        EXPERIMENT =
          T.let(
            :experiment,
            Braintrust::ViewCreateParams::ViewType::TaggedSymbol
          )
        PLAYGROUNDS =
          T.let(
            :playgrounds,
            Braintrust::ViewCreateParams::ViewType::TaggedSymbol
          )
        PLAYGROUND =
          T.let(
            :playground,
            Braintrust::ViewCreateParams::ViewType::TaggedSymbol
          )
        DATASETS =
          T.let(:datasets, Braintrust::ViewCreateParams::ViewType::TaggedSymbol)
        DATASET =
          T.let(:dataset, Braintrust::ViewCreateParams::ViewType::TaggedSymbol)
        PROMPTS =
          T.let(:prompts, Braintrust::ViewCreateParams::ViewType::TaggedSymbol)
        TOOLS =
          T.let(:tools, Braintrust::ViewCreateParams::ViewType::TaggedSymbol)
        SCORERS =
          T.let(:scorers, Braintrust::ViewCreateParams::ViewType::TaggedSymbol)
        LOGS =
          T.let(:logs, Braintrust::ViewCreateParams::ViewType::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Braintrust::ViewCreateParams::ViewType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
