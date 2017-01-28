require "rails_helper"

feature "User views details of a posted question" do
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question

  # Acceptance Criteria
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario "successfully view details of a posted question" do
    question = FactoryGirl.create(:question)

    visit "questions#index"
    click_link question.title

    expect(page).to have_current_path("/questions/#{question.id}")
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
