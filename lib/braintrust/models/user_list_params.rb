# frozen_string_literal: true

module Braintrust
  module Models
    # @see Braintrust::Resources::Users#list
    class UserListParams < Braintrust::Internal::Type::BaseModel
      extend Braintrust::Internal::Type::RequestParameters::Converter
      include Braintrust::Internal::Type::RequestParameters

      # @!attribute email
      #   Email of the user to search for. You may pass the param multiple times to filter
      #   for more than one email
      #
      #   @return [String, Array<String>, nil]
      optional :email, union: -> { Braintrust::UserListParams::Email }

      # @!attribute ending_before
      #   Pagination cursor id.
      #
      #   For example, if the initial item in the last page you fetched had an id of
      #   `foo`, pass `ending_before=foo` to fetch the previous page. Note: you may only
      #   pass one of `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :ending_before, String

      # @!attribute family_name
      #   Family name of the user to search for. You may pass the param multiple times to
      #   filter for more than one family name
      #
      #   @return [String, Array<String>, nil]
      optional :family_name, union: -> { Braintrust::UserListParams::FamilyName }

      # @!attribute given_name
      #   Given name of the user to search for. You may pass the param multiple times to
      #   filter for more than one given name
      #
      #   @return [String, Array<String>, nil]
      optional :given_name, union: -> { Braintrust::UserListParams::GivenName }

      # @!attribute ids
      #   Filter search results to a particular set of object IDs. To specify a list of
      #   IDs, include the query param multiple times
      #
      #   @return [String, Array<String>, nil]
      optional :ids, union: -> { Braintrust::UserListParams::IDs }

      # @!attribute limit
      #   Limit the number of objects to return
      #
      #   @return [Integer, nil]
      optional :limit, Integer, nil?: true

      # @!attribute org_name
      #   Filter search results to within a particular organization
      #
      #   @return [String, nil]
      optional :org_name, String

      # @!attribute starting_after
      #   Pagination cursor id.
      #
      #   For example, if the final item in the last page you fetched had an id of `foo`,
      #   pass `starting_after=foo` to fetch the next page. Note: you may only pass one of
      #   `starting_after` and `ending_before`
      #
      #   @return [String, nil]
      optional :starting_after, String

      # @!method initialize(email: nil, ending_before: nil, family_name: nil, given_name: nil, ids: nil, limit: nil, org_name: nil, starting_after: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Braintrust::Models::UserListParams} for more details.
      #
      #   @param email [String, Array<String>] Email of the user to search for. You may pass the param multiple times to filter
      #
      #   @param ending_before [String] Pagination cursor id.
      #
      #   @param family_name [String, Array<String>] Family name of the user to search for. You may pass the param multiple times to
      #
      #   @param given_name [String, Array<String>] Given name of the user to search for. You may pass the param multiple times to f
      #
      #   @param ids [String, Array<String>] Filter search results to a particular set of object IDs. To specify a list of ID
      #
      #   @param limit [Integer, nil] Limit the number of objects to return
      #
      #   @param org_name [String] Filter search results to within a particular organization
      #
      #   @param starting_after [String] Pagination cursor id.
      #
      #   @param request_options [Braintrust::RequestOptions, Hash{Symbol=>Object}]

      # Email of the user to search for. You may pass the param multiple times to filter
      # for more than one email
      module Email
        extend Braintrust::Internal::Type::Union

        variant String

        variant -> { Braintrust::UserListParams::Email::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(String, T::Array[String]) }
        end

        # @type [Braintrust::Internal::Type::Converter]
        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end

      # Family name of the user to search for. You may pass the param multiple times to
      # filter for more than one family name
      module FamilyName
        extend Braintrust::Internal::Type::Union

        variant String

        variant -> { Braintrust::UserListParams::FamilyName::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(String, T::Array[String]) }
        end

        # @type [Braintrust::Internal::Type::Converter]
        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end

      # Given name of the user to search for. You may pass the param multiple times to
      # filter for more than one given name
      module GivenName
        extend Braintrust::Internal::Type::Union

        variant String

        variant -> { Braintrust::UserListParams::GivenName::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(String, T::Array[String]) }
        end

        # @type [Braintrust::Internal::Type::Converter]
        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end

      # Filter search results to a particular set of object IDs. To specify a list of
      # IDs, include the query param multiple times
      module IDs
        extend Braintrust::Internal::Type::Union

        variant String

        variant -> { Braintrust::UserListParams::IDs::StringArray }

        # @!method self.variants
        #   @return [Array(String, Array<String>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(String, T::Array[String]) }
        end

        # @type [Braintrust::Internal::Type::Converter]
        StringArray = Braintrust::Internal::Type::ArrayOf[String]
      end
    end
  end
end
