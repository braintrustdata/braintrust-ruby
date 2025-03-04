# typed: strong

module Braintrust
  module Models
    class ExperimentCreateParams < Braintrust::BaseModel
      extend Braintrust::RequestParameters::Converter
      include Braintrust::RequestParameters

      sig { returns(String) }
      def project_id
      end

      sig { params(_: String).returns(String) }
      def project_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def base_exp_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def base_exp_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def dataset_id
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def dataset_id=(_)
      end

      sig { returns(T.nilable(String)) }
      def dataset_version
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def dataset_version=(_)
      end

      sig { returns(T.nilable(String)) }
      def description
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def description=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def ensure_new
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def ensure_new=(_)
      end

      sig { returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)])) }
      def metadata
      end

      sig do
        params(_: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
          .returns(T.nilable(T::Hash[Symbol, T.nilable(T.anything)]))
      end
      def metadata=(_)
      end

      sig { returns(T.nilable(String)) }
      def name
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def name=(_)
      end

      sig { returns(T.nilable(T::Boolean)) }
      def public
      end

      sig { params(_: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
      def public=(_)
      end

      sig { returns(T.nilable(Braintrust::Models::RepoInfo)) }
      def repo_info
      end

      sig { params(_: T.nilable(Braintrust::Models::RepoInfo)).returns(T.nilable(Braintrust::Models::RepoInfo)) }
      def repo_info=(_)
      end

      sig do
        params(
          project_id: String,
          base_exp_id: T.nilable(String),
          dataset_id: T.nilable(String),
          dataset_version: T.nilable(String),
          description: T.nilable(String),
          ensure_new: T.nilable(T::Boolean),
          metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
          name: T.nilable(String),
          public: T.nilable(T::Boolean),
          repo_info: T.nilable(Braintrust::Models::RepoInfo),
          request_options: T.any(Braintrust::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .void
      end
      def initialize(
        project_id:,
        base_exp_id: nil,
        dataset_id: nil,
        dataset_version: nil,
        description: nil,
        ensure_new: nil,
        metadata: nil,
        name: nil,
        public: nil,
        repo_info: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              project_id: String,
              base_exp_id: T.nilable(String),
              dataset_id: T.nilable(String),
              dataset_version: T.nilable(String),
              description: T.nilable(String),
              ensure_new: T.nilable(T::Boolean),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(T.anything)]),
              name: T.nilable(String),
              public: T.nilable(T::Boolean),
              repo_info: T.nilable(Braintrust::Models::RepoInfo),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
