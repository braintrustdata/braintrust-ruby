# typed: strong

module Braintrust
  module Models
    class OnlineScoreConfig < Braintrust::BaseModel
      sig { returns(Float) }
      def sampling_rate
      end

      sig { params(_: Float).returns(Float) }
      def sampling_rate=(_)
      end

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

      sig { returns(T.nilable(T::Boolean)) }
      def apply_to_root_span
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def apply_to_root_span=(_)
      end

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

      class Scorer < Braintrust::Union
        abstract!

        class Function < Braintrust::BaseModel
          sig { returns(String) }
          def id
          end

          sig { params(_: String).returns(String) }
          def id=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(id:, type:)
          end

          sig { override.returns({id: String, type: Symbol}) }
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

        class Global < Braintrust::BaseModel
          sig { returns(String) }
          def name
          end

          sig { params(_: String).returns(String) }
          def name=(_)
          end

          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { params(name: String, type: Symbol).returns(T.attached_class) }
          def self.new(name:, type:)
          end

          sig { override.returns({name: String, type: Symbol}) }
          def to_hash
          end

          class Type < Braintrust::Enum
            abstract!

            GLOBAL = :global

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
                [[NilClass, Braintrust::Models::OnlineScoreConfig::Scorer::Function], [NilClass, Braintrust::Models::OnlineScoreConfig::Scorer::Global]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
