require "rails_helper"

feature "User views list of posted questions" do
  # As a user
  # I want to view recently posted questions
  # So that I can help others

  # Acceptance Criteria
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  scenario "successfully view ordered list of posted questions" do
    question1 = FactoryGirl.create(:question)
    question2 = FactoryGirl.create(:question)

    visit "questions#index"

    questions = page.all("div#qulist ul li")
    expect(questions[0]).to have_content(question2.title)
    expect(questions[1]).to have_content(question1.title)
  end
end
