require "spec_helper"

feature "User authentication" do
  before { @user = FactoryGirl.create(:user, email: "unicorn@mail.com", password: "password") }
  let(:user) { @user }

  scenario "User signs in" do
    login(user, "password")
    expect(page).to have_text("Signed in successfully.")
  end

  scenario "User tries to sign in with with an invalid password" do
    login(user, "invalid password")
    expect(page).to have_text("Invalid email or password.")
  end  

  scenario "Logged in User log out" do
    login(user, "password")
    visit root_path
    click_link "Log out"
    expect(page).to have_text("Signed out successfully.")
  end
end