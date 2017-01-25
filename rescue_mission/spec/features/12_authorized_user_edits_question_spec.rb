require "rails_helper"

feature "Authorized-user edits a question" do
  # As a user
  # I want to prevent other users from editing my questions
  # So that malicious users can't mess with my question

  # Acceptance Criteria
  # - I must be signed in
  # - I must be able to edit a question that I posted
  # - I can't edit a question that was posted by another user

  pending "successfully edit a question with authorized-user"
  pending "fail to see edit option for a question with non-authorized-user"
end
