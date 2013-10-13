module FeatureHelper
  def login(user, password)
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: password
    click_button "Sign in"
  end
end

RSpec.configure do |c|
  c.include FeatureHelper, type: :feature
end