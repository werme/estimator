require 'spec_helper'

describe User do

  let(:user) do
    FactoryGirl.build :user,
      name: "Example User", 
      email: "user@example.com", 
      password: "mypassword"
  end
  
  subject { user }

  it { should respond_to :name, :email, :reset_password_token, :created_at }
  it { should be_valid }

  context "When name is not present" do
    before { user.name = " " }
    it { should_not be_valid }
  end

  context "When name is too long" do
    before { user.name = "a" * 51 }
    it { should_not be_valid }
  end

  context "When email address is already taken" do
    before { FactoryGirl.create :user, email: user.email }
    it { should_not be_valid }
  end
end
