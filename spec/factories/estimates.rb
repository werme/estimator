FactoryGirl.define do
  factory :estimate do
    association :author, factory: :user
    #author
    project "Default unicorn project"
  end
end
