# typed: strong

module Braintrust
  module Models
    class CodeBundle < Braintrust::BaseModel
      sig { returns(String) }
      def bundle_id
      end

      sig { params(_: String).returns(String) }
      def bundle_id=(_)
      end

      sig do
        returns(
          T.any(
            Braintrust::Models::CodeBundle::Location::Experiment,
            Braintrust::Models::CodeBundle::Location::Function
          )
        )
      end
      def location
      end

      sig do
        params(
          _: T.any(
            Braintrust::Models::CodeBundle::Location::Experiment,
            Braintrust::Models::CodeBundle::Location::Function
          )
        )
          .returns(
            T.any(
              Braintrust::Models::CodeBundle::Location::Experiment,
              Braintrust::Models::CodeBundle::Location::Function
            )
          )
      end
      def location=(_)
      end

      sig { returns(Braintrust::Models::CodeBundle::RuntimeContext) }
      def runtime_context
      end

      sig do
        params(_: Braintrust::Models::CodeBundle::RuntimeContext)
          .returns(Braintrust::Models::CodeBundle::RuntimeContext)
      end
      def runtime_context=(_)
      end

      # A preview of the code
      sig { returns(T.nilable(String)) }
      def preview
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def preview=(_)
      end

      sig do
        params(
          bundle_id: String,
          location: T.any(
            Braintrust::Models::CodeBundle::Location::Experiment,
            Braintrust::Models::CodeBundle::Location::Function
          ),
          runtime_context: Braintrust::Models::CodeBundle::RuntimeContext,
          preview: T.nilable(String)
        )
          .returns(T.attached_class)
      end
      def self.new(bundle_id:, location:, runtime_context:, preview: nil)
      end

      sig do
        override
          .returns(
            {
              bundle_id: String,
              location: T.any(
                Braintrust::Models::CodeBundle::Location::Experiment,
                Braintrust::Models::CodeBundle::Location::Function
              ),
              runtime_context: Braintrust::Models::CodeBundle::RuntimeContext,
              preview: T.nilable(String)
            }
          )
      end
      def to_hash
      end

      module Location
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Braintrust::Models::CodeBundle::Location::Experiment,
                Braintrust::Models::CodeBundle::Location::Function
              )
            }
          end

        class Experiment < Braintrust::BaseModel
          sig { returns(String) }
          def eval_name
          end

          sig { params(_: String).returns(String) }
          def eval_name=(_)
          end

          sig do
            returns(
              T.any(
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Type,
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer
              )
            )
          end
          def position
          end

          sig do
            params(
              _: T.any(
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Type,
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer
              )
            )
              .returns(
                T.any(
                  Braintrust::Models::CodeBundle::Location::Experiment::Position::Type,
                  Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer
                )
              )
          end
          def position=(_)
          end

          sig { returns(Braintrust::Models::CodeBundle::Location::Experiment::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::CodeBundle::Location::Experiment::Type::OrSymbol)
              .returns(Braintrust::Models::CodeBundle::Location::Experiment::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(
              eval_name: String,
              position: T.any(
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Type,
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer
              ),
              type: Braintrust::Models::CodeBundle::Location::Experiment::Type::OrSymbol
            )
              .returns(T.attached_class)
          end
          def self.new(eval_name:, position:, type:)
          end

          sig do
            override
              .returns(
                {
                  eval_name: String,
                  position: T.any(
                    Braintrust::Models::CodeBundle::Location::Experiment::Position::Type,
                    Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer
                  ),
                  type: Braintrust::Models::CodeBundle::Location::Experiment::Type::OrSymbol
                }
              )
          end
          def to_hash
          end

          module Position
            extend Braintrust::Union

            Variants =
              type_template(:out) do
                {
                  fixed: T.any(
                    Braintrust::Models::CodeBundle::Location::Experiment::Position::Type,
                    Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer
                  )
                }
              end

            class Type < Braintrust::BaseModel
              sig { returns(Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::OrSymbol) }
              def type
              end

              sig do
                params(_: Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::OrSymbol)
                  .returns(Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::OrSymbol)
              end
              def type=(_)
              end

              sig do
                params(type: Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::OrSymbol)
                  .returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override
                  .returns({type: Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::OrSymbol})
              end
              def to_hash
              end

              module Type
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::TaggedSymbol) }

                TASK = T.let(:task, Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::OrSymbol)
              end
            end

            class Scorer < Braintrust::BaseModel
              sig { returns(Integer) }
              def index
              end

              sig { params(_: Integer).returns(Integer) }
              def index=(_)
              end

              sig { returns(Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::OrSymbol) }
              def type
              end

              sig do
                params(_: Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::OrSymbol)
                  .returns(Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::OrSymbol)
              end
              def type=(_)
              end

              sig do
                params(
                  index: Integer,
                  type: Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::OrSymbol
                )
                  .returns(T.attached_class)
              end
              def self.new(index:, type:)
              end

              sig do
                override
                  .returns(
                    {index: Integer, type: Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::OrSymbol}
                  )
              end
              def to_hash
              end

              module Type
                extend Braintrust::Enum

                TaggedSymbol =
                  T.type_alias { T.all(Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type) }
                OrSymbol =
                  T.type_alias { T.any(Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::TaggedSymbol) }

                SCORER =
                  T.let(:scorer, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::OrSymbol)
              end
            end
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Type::TaggedSymbol) }

            EXPERIMENT = T.let(:experiment, Braintrust::Models::CodeBundle::Location::Experiment::Type::OrSymbol)
          end
        end

        class Function < Braintrust::BaseModel
          sig { returns(Integer) }
          def index
          end

          sig { params(_: Integer).returns(Integer) }
          def index=(_)
          end

          sig { returns(Braintrust::Models::CodeBundle::Location::Function::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::CodeBundle::Location::Function::Type::OrSymbol)
              .returns(Braintrust::Models::CodeBundle::Location::Function::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(index: Integer, type: Braintrust::Models::CodeBundle::Location::Function::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(index:, type:)
          end

          sig do
            override
              .returns({index: Integer, type: Braintrust::Models::CodeBundle::Location::Function::Type::OrSymbol})
          end
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::CodeBundle::Location::Function::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::CodeBundle::Location::Function::Type::TaggedSymbol) }

            FUNCTION = T.let(:function, Braintrust::Models::CodeBundle::Location::Function::Type::OrSymbol)
          end
        end
      end

      class RuntimeContext < Braintrust::BaseModel
        sig { returns(Braintrust::Models::CodeBundle::RuntimeContext::Runtime::OrSymbol) }
        def runtime
        end

        sig do
          params(_: Braintrust::Models::CodeBundle::RuntimeContext::Runtime::OrSymbol)
            .returns(Braintrust::Models::CodeBundle::RuntimeContext::Runtime::OrSymbol)
        end
        def runtime=(_)
        end

        sig { returns(String) }
        def version
        end

        sig { params(_: String).returns(String) }
        def version=(_)
        end

        sig do
          params(runtime: Braintrust::Models::CodeBundle::RuntimeContext::Runtime::OrSymbol, version: String)
            .returns(T.attached_class)
        end
        def self.new(runtime:, version:)
        end

        sig do
          override
            .returns({runtime: Braintrust::Models::CodeBundle::RuntimeContext::Runtime::OrSymbol, version: String})
        end
        def to_hash
        end

        module Runtime
          extend Braintrust::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::CodeBundle::RuntimeContext::Runtime) }
          OrSymbol =
            T.type_alias { T.any(Symbol, Braintrust::Models::CodeBundle::RuntimeContext::Runtime::TaggedSymbol) }

          NODE = T.let(:node, Braintrust::Models::CodeBundle::RuntimeContext::Runtime::OrSymbol)
          PYTHON = T.let(:python, Braintrust::Models::CodeBundle::RuntimeContext::Runtime::OrSymbol)
        end
      end
    end
  end
end
