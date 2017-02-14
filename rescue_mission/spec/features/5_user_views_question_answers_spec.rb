require "rails_helper"

feature "User views answers to a posted question" do
  # As a user
  # I want to view the answers for a question
  # So that I can learn from the answer

  # Acceptance Criteria
  # - I must be on the question detail page
  # - I must only see answers to the question I'm viewing
  # - I must see all answers listed in order, most recent last

  scenario "successfully view answers to a posted question" do
    question = FactoryGirl.create(:question)
    answer1 = FactoryGirl.create(:answer, question: question)
    answer2 = FactoryGirl.create(:answer, question: question)

    visit question_path(question.id)

    answers = page.all("div#anlist ul li")
    expect(answers[0]).to have_content(answer1.user.name)
    expect(answers[0]).to have_content(answer1.description)
    expect(answers[1]).to have_content(answer2.user.name)
    expect(answers[1]).to have_content(answer2.description)
  end
end
