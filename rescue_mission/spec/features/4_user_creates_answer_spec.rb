require "rails_helper"

feature "User creates an answer" do
  # As a user
  # I want to answer another user's question
  # So that I can help them solve their problem

  # Acceptance Criteria
  # - I must be on the question detail page
  # - I must provide a description that is at least 50 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario "successfully create an answer" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    new_answer = {description: "Always look on the bright side of life. Always look on the right side of life."}

    sign_in user
    visit question_path(question[:id])
    click_link "Create New Answer"

    expect(page).to have_current_path(new_question_answer_path(question[:id]))

    fill_in "Description", :with => "#{new_answer[:description]}"
    click_on 'Create Answer'

    expect(page).to have_content(question[:title])
    expect(page).to have_content(new_answer[:description])
  end

  scenario "fail to create an answer with invalid information" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    invalid_answer = {description: "Lifes a piece of shit when you look at it."}

    sign_in user
    visit question_path(question[:id])
    click_link "Create New Answer"
    fill_in "Description", :with => "#{invalid_answer[:description]}"
    click_on 'Create Answer'

    expect(page).to have_content("error prohibited this answer from being saved:")
    expect(page).to have_content("Description is too short (minimum is 50 characters)")
  end
end
