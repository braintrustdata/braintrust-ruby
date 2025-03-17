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

      class Location < Braintrust::Union
        abstract!

        Variants = type_template(:out) do
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

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig do
            params(
              eval_name: String,
              position: T.any(
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Type,
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer
              ),
              type: Symbol
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
                  type: Symbol
                }
              )
          end
          def to_hash
          end

          class Position < Braintrust::Union
            abstract!

            Variants = type_template(:out) do
              {
                fixed: T.any(
                  Braintrust::Models::CodeBundle::Location::Experiment::Position::Type,
                  Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer
                )
              }
            end

            class Type < Braintrust::BaseModel
              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig { params(type: Symbol).returns(T.attached_class) }
              def self.new(type:)
              end

              sig { override.returns({type: Symbol}) }
              def to_hash
              end

              class Type < Braintrust::Enum
                abstract!

                Value = type_template(:out) { {fixed: Symbol} }

                TASK = :task
              end
            end

            class Scorer < Braintrust::BaseModel
              sig { returns(Integer) }
              def index
              end

              sig { params(_: Integer).returns(Integer) }
              def index=(_)
              end

              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig { params(index: Integer, type: Symbol).returns(T.attached_class) }
              def self.new(index:, type:)
              end

              sig { override.returns({index: Integer, type: Symbol}) }
              def to_hash
              end

              class Type < Braintrust::Enum
                abstract!

                Value = type_template(:out) { {fixed: Symbol} }

                SCORER = :scorer
              end
            end
          end

          class Type < Braintrust::Enum
            abstract!

            Value = type_template(:out) { {fixed: Symbol} }

            EXPERIMENT = :experiment
          end
        end

        class Function < Braintrust::BaseModel
          sig { returns(Integer) }
          def index
          end

          sig { params(_: Integer).returns(Integer) }
          def index=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(index: Integer, type: Symbol).returns(T.attached_class) }
          def self.new(index:, type:)
          end

          sig { override.returns({index: Integer, type: Symbol}) }
          def to_hash
          end

          class Type < Braintrust::Enum
            abstract!

            Value = type_template(:out) { {fixed: Symbol} }

            FUNCTION = :function
          end
        end
      end

      class RuntimeContext < Braintrust::BaseModel
        sig { returns(Symbol) }
        def runtime
        end

        sig { params(_: Symbol).returns(Symbol) }
        def runtime=(_)
        end

        sig { returns(String) }
        def version
        end

        sig { params(_: String).returns(String) }
        def version=(_)
        end

        sig { params(runtime: Symbol, version: String).returns(T.attached_class) }
        def self.new(runtime:, version:)
        end

        sig { override.returns({runtime: Symbol, version: String}) }
        def to_hash
        end

        class Runtime < Braintrust::Enum
          abstract!

          Value = type_template(:out) { {fixed: Symbol} }

          NODE = :node
          PYTHON = :python
        end
      end
    end
  end
end
