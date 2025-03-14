# typed: strong

module Braintrust
  module Models
    class ViewCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(String) }
      def name
      end

      sig { params(_: String).returns(String) }
      def name=(_)
      end

      sig { returns(String) }
      def object_id_
      end

      sig { params(_: String).returns(String) }
      def object_id_=(_)
      end

      sig { returns(Symbol) }
      def object_type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def object_type=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def view_type
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def view_type=(_)
      end

      sig { returns(T.nilable(Time)) }
      def deleted_at
      end

      sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
      def deleted_at=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::ViewOptions)) }
      def options
      end

      sig { params(_: T.nilable(Braintrust::Models::ViewOptions)).returns(T.nilable(Braintrust::Models::ViewOptions)) }
      def options=(_)
      end

      sig { returns(T.nilable(String)) }
      def user_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def user_id=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::ViewData)) }
      def view_data
      end

      sig { params(_: T.nilable(Braintrust::Models::ViewData)).returns(T.nilable(Braintrust::Models::ViewData)) }
      def view_data=(_)
      end

      sig do
        params(
          name: String,
          object_id_: String,
          object_type: Symbol,
          view_type: T.nilable(Symbol),
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
              object_type: Symbol,
              view_type: T.nilable(Symbol),
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

      class ViewType < Braintrust::Enum
        abstract!

        PROJECTS = T.let(:projects, T.nilable(Symbol))
        EXPERIMENTS = T.let(:experiments, T.nilable(Symbol))
        EXPERIMENT = T.let(:experiment, T.nilable(Symbol))
        PLAYGROUNDS = T.let(:playgrounds, T.nilable(Symbol))
        PLAYGROUND = T.let(:playground, T.nilable(Symbol))
        DATASETS = T.let(:datasets, T.nilable(Symbol))
        DATASET = T.let(:dataset, T.nilable(Symbol))
        PROMPTS = T.let(:prompts, T.nilable(Symbol))
        TOOLS = T.let(:tools, T.nilable(Symbol))
        SCORERS = T.let(:scorers, T.nilable(Symbol))
        LOGS = T.let(:logs, T.nilable(Symbol))

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end
    end
  end
end
