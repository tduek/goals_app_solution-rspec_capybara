# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    password "123456"

    factory :user_with_goals do
      ignore do
        goals_count 5
      end

      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:goal, evaluator.goals_count, user_id: user.id)
        FactoryGirl.create_list(:private_goal, evaluator.goals_count, user_id: user.id)
      end
    end
  end
end
