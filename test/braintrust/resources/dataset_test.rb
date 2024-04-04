# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::DatasetTest < Test::Unit::TestCase
      def setup
          @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
      end

      def test_create_required_params
          response = @braintrust.dataset.create({name: "string", })
          assert(Braintrust::Converter.same_type?(Braintrust::Models::Dataset, response), response.class.to_s)
      end

      def test_retrieve
          response = @braintrust.dataset.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
          assert(Braintrust::Converter.same_type?(Braintrust::Models::Dataset, response), response.class.to_s)
      end

      def test_update_required_params
          response = @braintrust.dataset.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {name: "string", })
          assert(Braintrust::Converter.same_type?(Braintrust::Models::Dataset, response), response.class.to_s)
      end

      def test_delete
          response = @braintrust.dataset.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
          assert(Braintrust::Converter.same_type?(Braintrust::Models::Dataset, response), response.class.to_s)
      end

      def test_feedback_required_params
          response = @braintrust.dataset.feedback("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {feedback: [{"id" => "string", }, {"id" => "string", }, {"id" => "string", }], })
          assert(Braintrust::Converter.same_type?(NilClass, response), response.class.to_s)
      end

      def test_fetch
          response = @braintrust.dataset.fetch("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
          assert(Braintrust::Converter.same_type?(Braintrust::Models::DatasetFetchResponse, response), response.class.to_s)
      end

      def test_fetch_post
          response = @braintrust.dataset.fetch_post("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
          assert(Braintrust::Converter.same_type?(Braintrust::Models::DatasetFetchPostResponse, response), response.class.to_s)
      end

      def test_insert_required_params
          response = @braintrust.dataset.insert("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {events: [{}, {}, {}], })
          assert(Braintrust::Converter.same_type?(Braintrust::Models::DatasetInsertResponse, response), response.class.to_s)
      end

      def test_replace_required_params
          response = @braintrust.dataset.replace({name: "string", })
          assert(Braintrust::Converter.same_type?(Braintrust::Models::Dataset, response), response.class.to_s)
      end
end
