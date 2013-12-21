FactoryGirl.define do
  factory :user, aliases: [:author, :editor] do
    name      "unicorn"
    password  "password"
    email     "example@unicorn.com"
  end
end
