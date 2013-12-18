FactoryGirl.define do
  factory :user, aliases: [:author, :editor] do
    name      "unicorn"
    password  "password"
    email     "example@test.com"
  end
end
