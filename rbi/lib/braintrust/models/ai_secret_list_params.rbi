# typed: strong

module Braintrust
  module Models
    class AISecretListParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the ai_secret to search for
      sig { returns(T.nilable(String)) }
      def ai_secret_name
      end

      sig { params(_: String).returns(String) }
      def ai_secret_name=(_)
      end

      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def ai_secret_type
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def ai_secret_type=(_)
      end

      # Pagination cursor id.
      #
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      def ending_before
      end

      sig { params(_: String).returns(String) }
      def ending_before=(_)
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def ids
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def ids=(_)
      end

      # Limit the number of objects to return
      sig { returns(T.nilable(Integer)) }
      def limit
      end

      sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
      def limit=(_)
      end

      # Filter search results to within a particular organization
      sig { returns(T.nilable(String)) }
      def org_name
      end

      sig { params(_: String).returns(String) }
      def org_name=(_)
      end

      # Pagination cursor id.
      #
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      sig { returns(T.nilable(String)) }
      def starting_after
      end

      sig { params(_: String).returns(String) }
      def starting_after=(_)
      end

      sig do
        params(
          ai_secret_name: String,
          ai_secret_type: T.any(String, T::Array[String]),
          ending_before: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          starting_after: String,
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
        ai_secret_name: nil,
        ai_secret_type: nil,
        ending_before: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        starting_after: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              ai_secret_name: String,
              ai_secret_type: T.any(String, T::Array[String]),
              ending_before: String,
              ids: T.any(String, T::Array[String]),
              limit: T.nilable(Integer),
              org_name: String,
              starting_after: String,
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      class AISecretType < Braintrust::Union
        abstract!

        StringArray = T.type_alias { T::Array[String] }

        class << self
          # @api private
          sig { override.returns([[NilClass, String], [NilClass, T::Array[String]]]) }
          private def variants
          end
        end
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      class IDs < Braintrust::Union
        abstract!

        StringArray = T.type_alias { T::Array[String] }

        class << self
          # @api private
          sig { override.returns([[NilClass, String], [NilClass, T::Array[String]]]) }
          private def variants
          end
        end
      end
    end
  end
end
