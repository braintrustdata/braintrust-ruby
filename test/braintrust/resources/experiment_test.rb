# frozen_string_literal: true

require_relative "../test_helper"

class Braintrust::Test::Resources::ExperimentTest < Test::Unit::TestCase
      def setup
          @braintrust = Braintrust::Client.new(base_url: "http://localhost:4010", api_key: "My API Key")
      end

      def test_create_required_params
          response = @braintrust.experiment.create({project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", })
          assert(Braintrust::Converter.same_type?(Braintrust::Models::Experiment, response), response.class.to_s)
      end

      def test_retrieve
          response = @braintrust.experiment.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
          assert(Braintrust::Converter.same_type?(Braintrust::Models::Experiment, response), response.class.to_s)
      end

      def test_update
          response = @braintrust.experiment.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
          assert(Braintrust::Converter.same_type?(Braintrust::Models::Experiment, response), response.class.to_s)
      end

      def test_delete
          response = @braintrust.experiment.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
          assert(Braintrust::Converter.same_type?(Braintrust::Models::Experiment, response), response.class.to_s)
      end

      def test_feedback_required_params
          response = @braintrust.experiment.feedback("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {feedback: [{"id" => "string", }, {"id" => "string", }, {"id" => "string", }], })
          assert(Braintrust::Converter.same_type?(NilClass, response), response.class.to_s)
      end

      def test_fetch
          response = @braintrust.experiment.fetch("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
          assert(Braintrust::Converter.same_type?(Braintrust::Models::ExperimentFetchResponse, response), response.class.to_s)
      end

      def test_fetch_post
          response = @braintrust.experiment.fetch_post("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")
          assert(Braintrust::Converter.same_type?(Braintrust::Models::ExperimentFetchPostResponse, response), response.class.to_s)
      end

      def test_insert_required_params
          response = @braintrust.experiment.insert("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", {events: [{}, {}, {}], })
          assert(Braintrust::Converter.same_type?(Braintrust::Models::ExperimentInsertResponse, response), response.class.to_s)
      end

      def test_replace_required_params
          response = @braintrust.experiment.replace({project_id: "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", })
          assert(Braintrust::Converter.same_type?(Braintrust::Models::Experiment, response), response.class.to_s)
      end
end
