# typed: strong

module Braintrust
  module Models
    class ProjectUpdateParams < Braintrust::BaseModel
      extend Braintrust::Type::RequestParameters::Converter
      include Braintrust::RequestParameters

      # Name of the project
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Project settings. Patch operations replace all settings, so make sure you
      #   include all settings you want to keep.
      sig { returns(T.nilable(Braintrust::Models::ProjectSettings)) }
      attr_reader :settings

      sig { params(settings: T.nilable(T.any(Braintrust::Models::ProjectSettings, Braintrust::Util::AnyHash))).void }
      attr_writer :settings

      sig do
        params(
          name: T.nilable(String),
          settings: T.nilable(T.any(Braintrust::Models::ProjectSettings, Braintrust::Util::AnyHash)),
          request_options: T.any(Braintrust::RequestOptions, Braintrust::Util::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(name: nil, settings: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              name: T.nilable(String),
              settings: T.nilable(Braintrust::Models::ProjectSettings),
              request_options: Braintrust::RequestOptions
            }
          )
      end
      def to_hash
      end
    end
  end
end
