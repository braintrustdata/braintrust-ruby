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
          .void
      end
      def initialize(bundle_id:, location:, runtime_context:, preview: nil)
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
              .void
          end
          def initialize(eval_name:, position:, type:)
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

            class Type < Braintrust::BaseModel
              sig { returns(Symbol) }
              def type
              end

              sig { params(_: Symbol).returns(Symbol) }
              def type=(_)
              end

              sig { params(type: Symbol).void }
              def initialize(type:)
              end

              sig { override.returns({type: Symbol}) }
              def to_hash
              end

              class Type < Braintrust::Enum
                abstract!

                TASK = :task

                class << self
                  sig { override.returns(T::Array[Symbol]) }
                  def values
                  end
                end
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

              sig { params(index: Integer, type: Symbol).void }
              def initialize(index:, type:)
              end

              sig { override.returns({index: Integer, type: Symbol}) }
              def to_hash
              end

              class Type < Braintrust::Enum
                abstract!

                SCORER = :scorer

                class << self
                  sig { override.returns(T::Array[Symbol]) }
                  def values
                  end
                end
              end
            end

            class << self
              sig do
                override
                  .returns(
                    [[NilClass, Braintrust::Models::CodeBundle::Location::Experiment::Position::Type], [NilClass, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer]]
                  )
              end
              private def variants
              end
            end
          end

          class Type < Braintrust::Enum
            abstract!

            EXPERIMENT = :experiment

            class << self
              sig { override.returns(T::Array[Symbol]) }
              def values
              end
            end
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

          sig { params(index: Integer, type: Symbol).void }
          def initialize(index:, type:)
          end

          sig { override.returns({index: Integer, type: Symbol}) }
          def to_hash
          end

          class Type < Braintrust::Enum
            abstract!

            FUNCTION = :function

            class << self
              sig { override.returns(T::Array[Symbol]) }
              def values
              end
            end
          end
        end

        class << self
          sig do
            override
              .returns(
                [[NilClass, Braintrust::Models::CodeBundle::Location::Experiment], [NilClass, Braintrust::Models::CodeBundle::Location::Function]]
              )
          end
          private def variants
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

        sig { params(runtime: Symbol, version: String).void }
        def initialize(runtime:, version:)
        end

        sig { override.returns({runtime: Symbol, version: String}) }
        def to_hash
        end

        class Runtime < Braintrust::Enum
          abstract!

          NODE = :node
          PYTHON = :python

          class << self
            sig { override.returns(T::Array[Symbol]) }
            def values
            end
          end
        end
      end
    end
  end
end
