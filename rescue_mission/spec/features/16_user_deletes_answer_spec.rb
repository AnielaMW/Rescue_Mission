require "rails_helper"

feature "User deletes an answer" do
  # As a user
  # I want to delete an answer
  # So that I can delete duplicate answers

  # Acceptance Criteria
  # - I must be able delete an answer from the question details page

  scenario "successfully delete an answer from questions/show page" do
    answer = FactoryGirl.create(:answer)

    visit "/questions/#{answer.question[:id]}"
    click_link 'Delete Answer'

    expect(page).to have_current_path("/questions/#{answer.question[:id]}")
  end
end
