# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :respondent do
    name  { generate :string }
    email { generate :email }
  end
end
