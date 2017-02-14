require "rails_helper"

feature "User edits a question" do
  # As a user
  # I want to edit a question
  # So that I can correct any mistakes or add updates

  # Acceptance Criteria
  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page

  scenario "successfully edit a question" do
    question = FactoryGirl.create(:question)
    edit_question = {title: "How do I attend a wedding full of Drumpfs?", description: "I am attending a cousin's wedding; a cousin and family I don't particularly like. They are all misinformed, redneck, Drumpfster SOBs. How do I keep my cool when they try to lecture me on my liberal ideals?"}

    visit question_path(question[:id])
    click_link "Edit Question"

    expect(page).to have_current_path(edit_question_path(question[:id]))

    fill_in "Title", :with => "#{edit_question[:title]}"
    fill_in "Description", :with => "#{edit_question[:description]}"
    click_on 'Update Question'

    expect(page).to have_current_path(question_path(question[:id]))
    expect(page).to have_content(edit_question[:title])
    expect(page).to have_content(edit_question[:description])
  end

  scenario "fail to edit a question with invalid information" do
    question = FactoryGirl.create(:question)
    invalid_question = {title: "Why?", description: "Why, for God's sake; Why?"}

    visit question_path(question[:id])
    click_link "Edit Question"
    fill_in "Title", :with => "#{invalid_question[:title]}"
    fill_in "Description", :with => "#{invalid_question[:description]}"
    click_on 'Update Question'

    expect(page).to have_content("errors prohibited this question from being saved:")
    expect(page).to have_content("Title is too short (minimum is 40 characters)")
    expect(page).to have_content("Description is too short (minimum is 150 characters)")
  end
end
