require "rails_helper"

feature "User deletes a question" do
  # As a user
  # I want to delete a question
  # So that I can delete duplicate questions

  # Acceptance Criteria
  # - I must be able delete a question from the question index page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted

  scenario "successfully delete a question from questions/index page" do
    question = FactoryGirl.create(:question)

    visit 'questions#index'
    click_link 'Delete'

    expect(page).to have_current_path("/questions")
    expect(page).not_to have_content(question.title)
  end

  scenario "successfully delete a question from questions/show page" do
    question = FactoryGirl.create(:question)

    visit "/questions/#{question[:id]}"
    click_link 'Delete'

    expect(page).to have_current_path("/questions")
    expect(page).not_to have_content(question.title)
  end

  scenario "successfully delete answers when assocciated question is deleted" do
    answer = FactoryGirl.create(:answer)

    visit 'questions#index'
    click_link 'Delete'

    expect(page).to have_content("How do I test for information in the database without it needing to be found on the website?")
  end
end
