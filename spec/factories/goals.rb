# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
    title "MyString"
    description "MyText"
    user_id 1
    is_private false
  end
end
