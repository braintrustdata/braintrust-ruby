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
      sig { returns(Symbol) }
      def object_type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def object_type=(_)
      end

      # Type of table that the view corresponds to.
      sig { returns(T.nilable(Symbol)) }
      def view_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
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

      sig do
        params(
          id: String,
          name: String,
          object_id_: String,
          object_type: Symbol,
          view_type: T.nilable(Symbol),
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
              object_type: Symbol,
              view_type: T.nilable(Symbol),
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
