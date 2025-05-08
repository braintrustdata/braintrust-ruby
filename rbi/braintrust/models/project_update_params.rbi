# typed: strong

module Braintrust
  module Models
    class ProjectUpdateParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      OrHash =
        T.type_alias { T.any(T.self_type, Braintrust::Internal::AnyHash) }

      # Name of the project
      sig { returns(T.nilable(String)) }
      attr_accessor :name

      # Project settings. Patch operations replace all settings, so make sure you
      # include all settings you want to keep.
      sig { returns(T.nilable(Braintrust::ProjectSettings)) }
      attr_reader :settings

      sig do
        params(settings: T.nilable(Braintrust::ProjectSettings::OrHash)).void
      end
      attr_writer :settings

      sig do
        params(
          name: T.nilable(String),
          settings: T.nilable(Braintrust::ProjectSettings::OrHash),
          request_options: Braintrust::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Name of the project
        name: nil,
        # Project settings. Patch operations replace all settings, so make sure you
        # include all settings you want to keep.
        settings: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            name: T.nilable(String),
            settings: T.nilable(Braintrust::ProjectSettings),
            request_options: Braintrust::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
