# typed: strong

module Braintrust
  module Models
    class CodeBundle < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :bundle_id

      sig do
        returns(
          T.any(
            Braintrust::CodeBundle::Location::Experiment,
            Braintrust::CodeBundle::Location::Function
          )
        )
      end
      attr_accessor :location

      sig { returns(Braintrust::CodeBundle::RuntimeContext) }
      attr_reader :runtime_context

      sig do
        params(
          runtime_context: Braintrust::CodeBundle::RuntimeContext::OrHash
        ).void
      end
      attr_writer :runtime_context

      # A preview of the code
      sig { returns(T.nilable(String)) }
      attr_accessor :preview

      sig do
        params(
          bundle_id: String,
          location:
            T.any(
              Braintrust::CodeBundle::Location::Experiment::OrHash,
              Braintrust::CodeBundle::Location::Function::OrHash
            ),
          runtime_context: Braintrust::CodeBundle::RuntimeContext::OrHash,
          preview: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        bundle_id:,
        location:,
        runtime_context:,
        # A preview of the code
        preview: nil
      )
      end

      sig do
        override.returns(
          {
            bundle_id: String,
            location:
              T.any(
                Braintrust::CodeBundle::Location::Experiment,
                Braintrust::CodeBundle::Location::Function
              ),
            runtime_context: Braintrust::CodeBundle::RuntimeContext,
            preview: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      module Location
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::CodeBundle::Location::Experiment,
              Braintrust::CodeBundle::Location::Function
            )
          end

        class Experiment < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig { returns(String) }
          attr_accessor :eval_name

          sig do
            returns(
              T.any(
                Braintrust::CodeBundle::Location::Experiment::Position::Type,
                Braintrust::CodeBundle::Location::Experiment::Position::Scorer
              )
            )
          end
          attr_accessor :position

          sig do
            returns(
              Braintrust::CodeBundle::Location::Experiment::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              eval_name: String,
              position:
                T.any(
                  Braintrust::CodeBundle::Location::Experiment::Position::Type::OrHash,
                  Braintrust::CodeBundle::Location::Experiment::Position::Scorer::OrHash
                ),
              type: Braintrust::CodeBundle::Location::Experiment::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(eval_name:, position:, type:)
          end

          sig do
            override.returns(
              {
                eval_name: String,
                position:
                  T.any(
                    Braintrust::CodeBundle::Location::Experiment::Position::Type,
                    Braintrust::CodeBundle::Location::Experiment::Position::Scorer
                  ),
                type:
                  Braintrust::CodeBundle::Location::Experiment::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Position
            extend Braintrust::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Braintrust::CodeBundle::Location::Experiment::Position::Type,
                  Braintrust::CodeBundle::Location::Experiment::Position::Scorer
                )
              end

            class Type < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig do
                returns(
                  Braintrust::CodeBundle::Location::Experiment::Position::Type::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  type:
                    Braintrust::CodeBundle::Location::Experiment::Position::Type::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(type:)
              end

              sig do
                override.returns(
                  {
                    type:
                      Braintrust::CodeBundle::Location::Experiment::Position::Type::Type::OrSymbol
                  }
                )
              end
              def to_hash
              end

              module Type
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::CodeBundle::Location::Experiment::Position::Type::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                TASK =
                  T.let(
                    :task,
                    Braintrust::CodeBundle::Location::Experiment::Position::Type::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::CodeBundle::Location::Experiment::Position::Type::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Scorer < Braintrust::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(T.self_type, Braintrust::Internal::AnyHash)
                end

              sig { returns(Integer) }
              attr_accessor :index

              sig do
                returns(
                  Braintrust::CodeBundle::Location::Experiment::Position::Scorer::Type::OrSymbol
                )
              end
              attr_accessor :type

              sig do
                params(
                  index: Integer,
                  type:
                    Braintrust::CodeBundle::Location::Experiment::Position::Scorer::Type::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(index:, type:)
              end

              sig do
                override.returns(
                  {
                    index: Integer,
                    type:
                      Braintrust::CodeBundle::Location::Experiment::Position::Scorer::Type::OrSymbol
                  }
                )
              end
              def to_hash
              end

              module Type
                extend Braintrust::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Braintrust::CodeBundle::Location::Experiment::Position::Scorer::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                SCORER =
                  T.let(
                    :scorer,
                    Braintrust::CodeBundle::Location::Experiment::Position::Scorer::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Braintrust::CodeBundle::Location::Experiment::Position::Scorer::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            sig do
              override.returns(
                T::Array[
                  Braintrust::CodeBundle::Location::Experiment::Position::Variants
                ]
              )
            end
            def self.variants
            end
          end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Braintrust::CodeBundle::Location::Experiment::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXPERIMENT =
              T.let(
                :experiment,
                Braintrust::CodeBundle::Location::Experiment::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::CodeBundle::Location::Experiment::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Function < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig { returns(Integer) }
          attr_accessor :index

          sig do
            returns(Braintrust::CodeBundle::Location::Function::Type::OrSymbol)
          end
          attr_accessor :type

          sig do
            params(
              index: Integer,
              type: Braintrust::CodeBundle::Location::Function::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(index:, type:)
          end

          sig do
            override.returns(
              {
                index: Integer,
                type: Braintrust::CodeBundle::Location::Function::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Braintrust::CodeBundle::Location::Function::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FUNCTION =
              T.let(
                :function,
                Braintrust::CodeBundle::Location::Function::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::CodeBundle::Location::Function::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(T::Array[Braintrust::CodeBundle::Location::Variants])
        end
        def self.variants
        end
      end

      class RuntimeContext < Braintrust::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

        sig do
          returns(Braintrust::CodeBundle::RuntimeContext::Runtime::OrSymbol)
        end
        attr_accessor :runtime

        sig { returns(String) }
        attr_accessor :version

        sig do
          params(
            runtime: Braintrust::CodeBundle::RuntimeContext::Runtime::OrSymbol,
            version: String
          ).returns(T.attached_class)
        end
        def self.new(runtime:, version:)
        end

        sig do
          override.returns(
            {
              runtime:
                Braintrust::CodeBundle::RuntimeContext::Runtime::OrSymbol,
              version: String
            }
          )
        end
        def to_hash
        end

        module Runtime
          extend Braintrust::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Braintrust::CodeBundle::RuntimeContext::Runtime)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NODE =
            T.let(
              :node,
              Braintrust::CodeBundle::RuntimeContext::Runtime::TaggedSymbol
            )
          PYTHON =
            T.let(
              :python,
              Braintrust::CodeBundle::RuntimeContext::Runtime::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Braintrust::CodeBundle::RuntimeContext::Runtime::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
