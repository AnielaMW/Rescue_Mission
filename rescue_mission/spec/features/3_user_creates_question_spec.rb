require "rails_helper"

feature "User creates a question" do
  # As a user
  # I want to post a question
  # So that I can receive help from others

  # Acceptance Criteria
  # - I must provide a title that is at least 40 characters long
  # - I must provide a description that is at least 150 characters long
  # - I must be presented with errors if I fill out the form incorrectly

  scenario "successfully create a question" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    new_question = {title: "How do I attend a wedding full of Drumpfs?", description: "I am attending a cousin's wedding; a cousin and family I don't particularly like. They are all misinformed, redneck, Drumpfster SOBs. How do I keep my cool when they try to lecture me on my liberal ideals?"}

    visit "questions#index"
    click_link "Ask New Question"

    expect(page).to have_current_path("/questions/new")

    fill_in "Title", :with => "#{new_question[:title]}"
    fill_in "Description", :with => "#{new_question[:description]}"
    click_on 'Create Question'

    expect(page).to have_content(new_question[:title])
    expect(page).to have_content(new_question[:description])

    visit "questions#index"

    questions = page.all("div#qulist ul li")
    expect(questions[0]).to have_content(new_question[:title])
    expect(questions[1]).to have_content(question[:title])
  end

  scenario "fail to create a question with invalid information" do
    user = FactoryGirl.create(:user)
    invalid_question = {title: "Why?", description: "Why, for God's sake; Why?"}

    visit "questions#index"
    click_link "Ask New Question"
    fill_in "Title", :with => "#{invalid_question[:title]}"
    fill_in "Description", :with => "#{invalid_question[:description]}"
    click_on 'Create Question'

    expect(page).to have_content("errors prohibited this question from being saved:")
    expect(page).to have_content("Title is too short (minimum is 40 characters)")
    expect(page).to have_content("Description is too short (minimum is 150 characters)")
  end
end
