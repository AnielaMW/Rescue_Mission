require "rails_helper"

feature "User signs-in" do
  # As a user
  # I want to sign in
  # So that my questions and answers can be associated to me

  # Acceptance Criteria
  # - I must be able to sign in using either GitHub, Twitter, or Facebook (choose one)

  scenario "successfully sign-in user" do
    user = FactoryGirl.create(:user)

    visit "/users/sign_in"
    fill_in "Email", with: "#{user.email}"
    fill_in "Password", with: "#{user.password}"
    click_button "Submit"

    expect(page).to have_current_path(questions_path)
    expect(page).to have_content("signed-in as #{user.email}")
  end
end
