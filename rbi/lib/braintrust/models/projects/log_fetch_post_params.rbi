# typed: strong

module Braintrust
  module Models
    module Projects
      class LogFetchPostParams < Braintrust::BaseModel
        extend Braintrust::RequestParameters::Converter
        include Braintrust::RequestParameters

        sig { returns(T.nilable(String)) }
        def cursor
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def cursor=(_)
        end

        sig { returns(T.nilable(Integer)) }
        def limit
        end

        sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def limit=(_)
        end

        sig { returns(T.nilable(String)) }
        def max_root_span_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def max_root_span_id=(_)
        end

        sig { returns(T.nilable(String)) }
        def max_xact_id
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def max_xact_id=(_)
        end

        sig { returns(T.nilable(String)) }
        def version
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def version=(_)
        end

        sig do
          params(
            cursor: T.nilable(String),
            limit: T.nilable(Integer),
            max_root_span_id: T.nilable(String),
            max_xact_id: T.nilable(String),
            version: T.nilable(String),
            request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
          )
            .returns(T.attached_class)
        end
        def self.new(cursor: nil, limit: nil, max_root_span_id: nil, max_xact_id: nil, version: nil, request_options: {})
        end

        sig do
          override
            .returns(
              {
                cursor: T.nilable(String),
                limit: T.nilable(Integer),
                max_root_span_id: T.nilable(String),
                max_xact_id: T.nilable(String),
                version: T.nilable(String),
                request_options: Braintrust::RequestOptions
              }
            )
        end
        def to_hash
        end
      end
    end
  end
end
