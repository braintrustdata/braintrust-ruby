# typed: strong

module Braintrust
  module Models
    class CodeBundle < Braintrust::BaseModel
      sig { returns(String) }
      attr_accessor :bundle_id

      sig do
        returns(
          T.any(
            Braintrust::Models::CodeBundle::Location::Experiment,
            Braintrust::Models::CodeBundle::Location::Function
          )
        )
      end
      attr_accessor :location

      sig { returns(Braintrust::Models::CodeBundle::RuntimeContext) }
      attr_reader :runtime_context

      sig do
        params(
          runtime_context: T.any(Braintrust::Models::CodeBundle::RuntimeContext, Braintrust::Internal::Util::AnyHash)
        )
          .void
      end
      attr_writer :runtime_context

      # A preview of the code
      sig { returns(T.nilable(String)) }
      attr_accessor :preview

      sig do
        params(
          bundle_id: String,
          location: T.any(
            Braintrust::Models::CodeBundle::Location::Experiment,
            Braintrust::Internal::Util::AnyHash,
            Braintrust::Models::CodeBundle::Location::Function
          ),
          runtime_context: T.any(Braintrust::Models::CodeBundle::RuntimeContext, Braintrust::Internal::Util::AnyHash),
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

        class Experiment < Braintrust::BaseModel
          sig { returns(String) }
          attr_accessor :eval_name

          sig do
            returns(
              T.any(
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Type,
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer
              )
            )
          end
          attr_accessor :position

          sig { returns(Braintrust::Models::CodeBundle::Location::Experiment::Type::OrSymbol) }
          attr_accessor :type

          sig do
            params(
              eval_name: String,
              position: T.any(
                Braintrust::Models::CodeBundle::Location::Experiment::Position::Type,
                Braintrust::Internal::Util::AnyHash,
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

            class Type < Braintrust::BaseModel
              sig { returns(Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::OrSymbol) }
              attr_accessor :type

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
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::TaggedSymbol
                    )
                  end

                TASK =
                  T.let(:task, Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::TaggedSymbol)

                sig do
                  override
                    .returns(
                      T::Array[Braintrust::Models::CodeBundle::Location::Experiment::Position::Type::Type::TaggedSymbol]
                    )
                end
                def self.values
                end
              end
            end

            class Scorer < Braintrust::BaseModel
              sig { returns(Integer) }
              attr_accessor :index

              sig { returns(Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::OrSymbol) }
              attr_accessor :type

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
                  T.type_alias do
                    T.any(
                      Symbol,
                      String,
                      Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::TaggedSymbol
                    )
                  end

                SCORER =
                  T.let(:scorer, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::TaggedSymbol)

                sig do
                  override
                    .returns(
                      T::Array[Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer::Type::TaggedSymbol]
                    )
                end
                def self.values
                end
              end
            end

            sig do
              override
                .returns(
                  [Braintrust::Models::CodeBundle::Location::Experiment::Position::Type, Braintrust::Models::CodeBundle::Location::Experiment::Position::Scorer]
                )
            end
            def self.variants
            end
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol = T.type_alias { T.all(Symbol, Braintrust::Models::CodeBundle::Location::Experiment::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Braintrust::Models::CodeBundle::Location::Experiment::Type::TaggedSymbol) }

            EXPERIMENT = T.let(:experiment, Braintrust::Models::CodeBundle::Location::Experiment::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::CodeBundle::Location::Experiment::Type::TaggedSymbol]) }
            def self.values
            end
          end
        end

        class Function < Braintrust::BaseModel
          sig { returns(Integer) }
          attr_accessor :index

          sig { returns(Braintrust::Models::CodeBundle::Location::Function::Type::OrSymbol) }
          attr_accessor :type

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
              T.type_alias { T.any(Symbol, String, Braintrust::Models::CodeBundle::Location::Function::Type::TaggedSymbol) }

            FUNCTION = T.let(:function, Braintrust::Models::CodeBundle::Location::Function::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::CodeBundle::Location::Function::Type::TaggedSymbol]) }
            def self.values
            end
          end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::CodeBundle::Location::Experiment, Braintrust::Models::CodeBundle::Location::Function]
            )
        end
        def self.variants
        end
      end

      class RuntimeContext < Braintrust::BaseModel
        sig { returns(Braintrust::Models::CodeBundle::RuntimeContext::Runtime::OrSymbol) }
        attr_accessor :runtime

        sig { returns(String) }
        attr_accessor :version

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
            T.type_alias { T.any(Symbol, String, Braintrust::Models::CodeBundle::RuntimeContext::Runtime::TaggedSymbol) }

          NODE = T.let(:node, Braintrust::Models::CodeBundle::RuntimeContext::Runtime::TaggedSymbol)
          PYTHON = T.let(:python, Braintrust::Models::CodeBundle::RuntimeContext::Runtime::TaggedSymbol)

          sig { override.returns(T::Array[Braintrust::Models::CodeBundle::RuntimeContext::Runtime::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
