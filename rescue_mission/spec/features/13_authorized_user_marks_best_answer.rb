require "spec_helper"

feature "Authorized-user marks answer as best answer" do
  # As a user
  # I want to prevent other users from choosing the "best" answer for my question
  # So that malicious users can't mess with my question

  # Acceptance Criteria
  # - I must be signed in
  # - I must be able to choose the "best" answer for a question that I posted
  # - I can't choose the best answer for a question that was posted by another user

  pending "successfully mark answer as best answer with authorized-user"
  pending "fail to see mark_best option for an answer with non-authorized-user"
end
