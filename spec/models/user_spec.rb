require 'spec_helper'

describe User do

  let(:user) do
    FactoryGirl.build(:user,
      name: "Example User", 
      email: "user@example.com", 
      password: "mypassword"
    )
  end
  
  subject { user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  context "when name is not present" do
    before { user.name = " " }
    it { should_not be_valid }
  end

  context "when name is too long" do
    before { user.name = "a" * 51 }
    it { should_not be_valid }
  end

  context "when email address is already taken" do
    before { FactoryGirl.create :user, email: user.email }
    it { should_not be_valid }
  end
end
