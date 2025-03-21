# typed: strong

module Braintrust
  module Models
    class OnlineScoreConfig < Braintrust::BaseModel
      # The sampling rate for online scoring
      sig { returns(Float) }
      def sampling_rate
      end

      sig { params(_: Float).returns(Float) }
      def sampling_rate=(_)
      end

      # The list of scorers to use for online scoring
      sig do
        returns(
          T::Array[
          T.any(
            Braintrust::Models::OnlineScoreConfig::Scorer::Function,
            Braintrust::Models::OnlineScoreConfig::Scorer::Global
          )
          ]
        )
      end
      def scorers
      end

      sig do
        params(
          _: T::Array[
          T.any(
            Braintrust::Models::OnlineScoreConfig::Scorer::Function,
            Braintrust::Models::OnlineScoreConfig::Scorer::Global
          )
          ]
        )
          .returns(
            T::Array[
            T.any(
              Braintrust::Models::OnlineScoreConfig::Scorer::Function,
              Braintrust::Models::OnlineScoreConfig::Scorer::Global
            )
            ]
          )
      end
      def scorers=(_)
      end

      # Whether to trigger online scoring on the root span of each trace
      sig { returns(T.nilable(T::Boolean)) }
      def apply_to_root_span
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def apply_to_root_span=(_)
      end

      # Trigger online scoring on any spans with a name in this list
      sig { returns(T.nilable(T::Array[String])) }
      def apply_to_span_names
      end

      sig { params(_: T.nilable(T::Array[String])).returns(T.nilable(T::Array[String])) }
      def apply_to_span_names=(_)
      end

      sig do
        params(
          sampling_rate: Float,
          scorers: T::Array[
          T.any(
            Braintrust::Models::OnlineScoreConfig::Scorer::Function,
            Braintrust::Models::OnlineScoreConfig::Scorer::Global
          )
          ],
          apply_to_root_span: T.nilable(T::Boolean),
          apply_to_span_names: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(sampling_rate:, scorers:, apply_to_root_span: nil, apply_to_span_names: nil)
      end

      sig do
        override
          .returns(
            {
              sampling_rate: Float,
              scorers: T::Array[
              T.any(
                Braintrust::Models::OnlineScoreConfig::Scorer::Function,
                Braintrust::Models::OnlineScoreConfig::Scorer::Global
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
        extend Braintrust::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Braintrust::Models::OnlineScoreConfig::Scorer::Function,
                Braintrust::Models::OnlineScoreConfig::Scorer::Global
              )
            }
          end

        class Function < Braintrust::BaseModel
          sig { returns(String) }
          def id
          end

          sig { params(_: String).returns(String) }
          def id=(_)
          end

          sig { returns(Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::OrSymbol)
              .returns(Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(id: String, type: Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(id:, type:)
          end

          sig do
            override
              .returns({id: String, type: Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::OrSymbol})
          end
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::TaggedSymbol) }

            FUNCTION = T.let(:function, Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::OrSymbol)
          end
        end

        class Global < Braintrust::BaseModel
          sig { returns(String) }
          def name
          end

          sig { params(_: String).returns(String) }
          def name=(_)
          end

          sig { returns(Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::OrSymbol) }
          def type
          end

          sig do
            params(_: Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::OrSymbol)
              .returns(Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::OrSymbol)
          end
          def type=(_)
          end

          sig do
            params(name: String, type: Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(name:, type:)
          end

          sig do
            override
              .returns({name: String, type: Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::OrSymbol})
          end
          def to_hash
          end

          module Type
            extend Braintrust::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::TaggedSymbol) }

            GLOBAL = T.let(:global, Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::OrSymbol)
          end
        end
      end
    end
  end
end
