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
      sig { returns(Symbol) }
      def object_type
      end

      sig { params(_: Symbol).returns(Symbol) }
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

      sig { params(_: T.nilable(Braintrust::Models::ViewOptions)).returns(T.nilable(Braintrust::Models::ViewOptions)) }
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

      sig { params(_: T.nilable(Braintrust::Models::ViewData)).returns(T.nilable(Braintrust::Models::ViewData)) }
      def view_data=(_)
      end

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Symbol)) }
      def view_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def view_type=(_)
      end

      sig do
        params(
          object_id_: String,
          object_type: Symbol,
          name: T.nilable(String),
          options: T.nilable(Braintrust::Models::ViewOptions),
          user_id: T.nilable(String),
          view_data: T.nilable(Braintrust::Models::ViewData),
          view_type: T.nilable(Symbol),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
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
              object_type: Symbol,
              name: T.nilable(String),
              options: T.nilable(Braintrust::Models::ViewOptions),
              user_id: T.nilable(String),
              view_data: T.nilable(Braintrust::Models::ViewData),
              view_type: T.nilable(Symbol),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      # Type of table that the view corresponds to.
      class ViewType < Braintrust::Enum
        abstract!

        Value = type_template(:out) { {fixed: Symbol} }

        PROJECTS = :projects
        EXPERIMENTS = :experiments
        EXPERIMENT = :experiment
        PLAYGROUNDS = :playgrounds
        PLAYGROUND = :playground
        DATASETS = :datasets
        DATASET = :dataset
        PROMPTS = :prompts
        TOOLS = :tools
        SCORERS = :scorers
        LOGS = :logs
      end
    end
  end
end
