require "spec_helper"

feature "User authentication" do

  scenario "User login" do
    FactoryGirl.create(:user, email: "unicorn@mail.com", password: "password")
    
    visit "/users/sign_in"

    fill_in "user[email]", :with => "unicorn@mail.com"
    fill_in "user[password]", :with => "password"
    click_button "Sign in"

    expect(page).to have_text("Signed in successfully.")
  end
end