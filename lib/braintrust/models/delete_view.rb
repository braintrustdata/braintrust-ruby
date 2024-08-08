# frozen_string_literal: true

module Braintrust
  module Models
    class DeleteView < BaseModel
      # @!attribute [rw] object_id_
      #   The id of the object the view applies to
      #   @return [String]
      required :object_id_, String

      # @!attribute [rw] object_type
      #   The object type that the ACL applies to
      #   @return [Symbol]
      required :object_type,
               Braintrust::Enum.new(
                 :organization,
                 :project,
                 :experiment,
                 :dataset,
                 :prompt,
                 :prompt_session,
                 :group,
                 :role,
                 :org_member,
                 :project_log,
                 :org_project
               )
    end
  end
end
