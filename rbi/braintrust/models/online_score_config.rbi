# typed: strong

module Braintrust
  module Models
    class OnlineScoreConfig < Braintrust::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # The sampling rate for online scoring
      sig { returns(Float) }
      attr_accessor :sampling_rate

      # The list of scorers to use for online scoring
      sig do
        returns(
          T::Array[
            T.any(
              Braintrust::OnlineScoreConfig::Scorer::Function,
              Braintrust::OnlineScoreConfig::Scorer::Global
            )
          ]
        )
      end
      attr_accessor :scorers

      # Whether to trigger online scoring on the root span of each trace
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :apply_to_root_span

      # Trigger online scoring on any spans with a name in this list
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :apply_to_span_names

      sig do
        params(
          sampling_rate: Float,
          scorers:
            T::Array[
              T.any(
                Braintrust::OnlineScoreConfig::Scorer::Function::OrHash,
                Braintrust::OnlineScoreConfig::Scorer::Global::OrHash
              )
            ],
          apply_to_root_span: T.nilable(T::Boolean),
          apply_to_span_names: T.nilable(T::Array[String])
        ).returns(T.attached_class)
      end
      def self.new(
        # The sampling rate for online scoring
        sampling_rate:,
        # The list of scorers to use for online scoring
        scorers:,
        # Whether to trigger online scoring on the root span of each trace
        apply_to_root_span: nil,
        # Trigger online scoring on any spans with a name in this list
        apply_to_span_names: nil
      )
      end

      sig do
        override.returns(
          {
            sampling_rate: Float,
            scorers:
              T::Array[
                T.any(
                  Braintrust::OnlineScoreConfig::Scorer::Function,
                  Braintrust::OnlineScoreConfig::Scorer::Global
                )
              ],
            apply_to_root_span: T.nilable(T::Boolean),
            apply_to_span_names: T.nilable(T::Array[String])
          }
        )
      end
      def to_hash
      end

      module Scorer
        extend Braintrust::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Braintrust::OnlineScoreConfig::Scorer::Function,
              Braintrust::OnlineScoreConfig::Scorer::Global
            )
          end

        class Function < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig { returns(String) }
          attr_accessor :id

          sig do
            returns(
              Braintrust::OnlineScoreConfig::Scorer::Function::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              id: String,
              type:
                Braintrust::OnlineScoreConfig::Scorer::Function::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(id:, type:)
          end

          sig do
            override.returns(
              {
                id: String,
                type:
                  Braintrust::OnlineScoreConfig::Scorer::Function::Type::OrSymbol
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
                  Braintrust::OnlineScoreConfig::Scorer::Function::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FUNCTION =
              T.let(
                :function,
                Braintrust::OnlineScoreConfig::Scorer::Function::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::OnlineScoreConfig::Scorer::Function::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

          sig { returns(String) }
          attr_accessor :name

          sig do
            returns(
              Braintrust::OnlineScoreConfig::Scorer::Global::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              name: String,
              type:
                Braintrust::OnlineScoreConfig::Scorer::Global::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override.returns(
              {
                name: String,
                type:
                  Braintrust::OnlineScoreConfig::Scorer::Global::Type::OrSymbol
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
                  Braintrust::OnlineScoreConfig::Scorer::Global::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GLOBAL =
              T.let(
                :global,
                Braintrust::OnlineScoreConfig::Scorer::Global::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Braintrust::OnlineScoreConfig::Scorer::Global::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[Braintrust::OnlineScoreConfig::Scorer::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
