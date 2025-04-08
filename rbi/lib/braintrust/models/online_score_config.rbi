# typed: strong

module Braintrust
  module Models
    class OnlineScoreConfig < Braintrust::Internal::Type::BaseModel
      # The sampling rate for online scoring
      sig { returns(Float) }
      attr_accessor :sampling_rate

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
          scorers: T::Array[
            T.any(
              Braintrust::Models::OnlineScoreConfig::Scorer::Function,
              Braintrust::Internal::AnyHash,
              Braintrust::Models::OnlineScoreConfig::Scorer::Global
            )
          ],
          apply_to_root_span: T.nilable(T::Boolean),
          apply_to_span_names: T.nilable(T::Array[String])
        )
          .returns(T.attached_class)
      end
      def self.new(sampling_rate:, scorers:, apply_to_root_span: nil, apply_to_span_names: nil); end

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
      def to_hash; end

      module Scorer
        extend Braintrust::Internal::Type::Union

        class Function < Braintrust::Internal::Type::BaseModel
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::OrSymbol) }
          attr_accessor :type

          sig do
            params(id: String, type: Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(id:, type:); end

          sig do
            override
              .returns({id: String, type: Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::OrSymbol})
          end
          def to_hash; end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::TaggedSymbol) }

            FUNCTION = T.let(:function, Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::OnlineScoreConfig::Scorer::Function::Type::TaggedSymbol]) }
            def self.values; end
          end
        end

        class Global < Braintrust::Internal::Type::BaseModel
          sig { returns(String) }
          attr_accessor :name

          sig { returns(Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::OrSymbol) }
          attr_accessor :type

          sig do
            params(name: String, type: Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::OrSymbol)
              .returns(T.attached_class)
          end
          def self.new(name:, type:); end

          sig do
            override
              .returns({name: String, type: Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::OrSymbol})
          end
          def to_hash; end

          module Type
            extend Braintrust::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias { T.all(Symbol, Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type) }
            OrSymbol =
              T.type_alias { T.any(Symbol, String, Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::TaggedSymbol) }

            GLOBAL = T.let(:global, Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::TaggedSymbol)

            sig { override.returns(T::Array[Braintrust::Models::OnlineScoreConfig::Scorer::Global::Type::TaggedSymbol]) }
            def self.values; end
          end
        end

        sig do
          override
            .returns(
              [Braintrust::Models::OnlineScoreConfig::Scorer::Function, Braintrust::Models::OnlineScoreConfig::Scorer::Global]
            )
        end
        def self.variants; end
      end
    end
  end
end
