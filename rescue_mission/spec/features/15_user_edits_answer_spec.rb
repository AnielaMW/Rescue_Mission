require "rails_helper"

feature "User edits an answer" do
  # As a user
  # I want to edit an answer
  # So that I can correct any mistakes or add updates

  # Acceptance Criteria
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page

  scenario "successfully edit an answer" do
    answer = FactoryGirl.create(:answer)
    edit_answer = {description: "Sit at the open bar, aviod eye-contact, and leave as soon as the dinner is over."}

    visit "/questions/#{answer.question[:id]}"
    click_link "Edit Answer"

    expect(page).to have_current_path("/answers/#{answer[:id]}/edit")

    fill_in "Description", :with => "#{edit_answer[:description]}"
    click_on 'Update Answer'

    expect(page).to have_current_path("/questions/#{answer.question[:id]}")
    expect(page).to have_content(answer.question[:title])
    expect(page).to have_content(edit_answer[:description])
  end

  scenario "fail to edit a question with invalid information" do
    answer = FactoryGirl.create(:answer)
    invalid_answer = {description: "Why, for God's sake; Why?"}

    visit "/questions/#{answer.question[:id]}"
    click_link "Edit Answer"
    fill_in "Description", :with => "#{invalid_answer[:description]}"
    click_on 'Update Answer'

    expect(page).to have_content("error prohibited this answer from being saved:")
    expect(page).to have_content("Description is too short (minimum is 50 characters)")
  end
end
