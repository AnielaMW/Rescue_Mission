require "rails_helper"

feature "Authorized-user deletes a question" do
  # As a user
  # I want to prevent other users from deleting my question
  # So that malicious users can't mess with my question

  # Acceptance Criteria
  # - I must be signed in
  # - I must be able to delete a question that I posted
  # - I can't delete a question that was posted by another user

  pending "successfully delete a question from questions/edit page with authorized-user"
  pending "fail to delete a question from questions/edit page with non-authorized-user"
  pending "successfully delete a question from questions/show page with authorized-user"
  pending "fail to delete a question from questions/show page with non-authorized-user"
end
