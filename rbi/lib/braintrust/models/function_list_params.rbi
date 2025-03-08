# typed: strong

module Braintrust
  module Models
    class FunctionListParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(T.nilable(String)) }
      def ending_before
      end

      sig { params(_: String).returns(String) }
      def ending_before=(_)
      end

      sig { returns(T.nilable(String)) }
      def function_name
      end

      sig { params(_: String).returns(String) }
      def function_name=(_)
      end

      sig { returns(T.nilable(T.any(String, T::Array[String]))) }
      def ids
      end

      sig { params(_: T.any(String, T::Array[String])).returns(T.any(String, T::Array[String])) }
      def ids=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def limit
      end

      sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
      def limit=(_)
      end

      sig { returns(T.nilable(String)) }
      def org_name
      end

      sig { params(_: String).returns(String) }
      def org_name=(_)
      end

      sig { returns(T.nilable(String)) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def project_name
      end

      sig { params(_: String).returns(String) }
      def project_name=(_)
      end

      sig { returns(T.nilable(String)) }
      def slug
      end

      sig { params(_: String).returns(String) }
      def slug=(_)
      end

      sig { returns(T.nilable(String)) }
      def starting_after
      end

      sig { params(_: String).returns(String) }
      def starting_after=(_)
      end

      sig { returns(T.nilable(String)) }
      def version
      end

      sig { params(_: String).returns(String) }
      def version=(_)
      end

      sig do
        params(
          ending_before: String,
          function_name: String,
          ids: T.any(String, T::Array[String]),
          limit: T.nilable(Integer),
          org_name: String,
          project_id: String,
          project_name: String,
          slug: String,
          starting_after: String,
          version: String,
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(
        ending_before: nil,
        function_name: nil,
        ids: nil,
        limit: nil,
        org_name: nil,
        project_id: nil,
        project_name: nil,
        slug: nil,
        starting_after: nil,
        version: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              ending_before: String,
              function_name: String,
              ids: T.any(String, T::Array[String]),
              limit: T.nilable(Integer),
              org_name: String,
              project_id: String,
              project_name: String,
              slug: String,
              starting_after: String,
              version: String,
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end

      class IDs < Braintrust::Union
        abstract!

        StringArray = T.type_alias { T::Array[String] }

        class << self
          sig { override.returns([[NilClass, String], [NilClass, T::Array[String]]]) }
          private def variants
          end
        end
      end
    end
  end
end
