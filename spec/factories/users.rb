# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    session_token "MyString"
    username "MyString"
    password_digest "MyString"
  end
end
