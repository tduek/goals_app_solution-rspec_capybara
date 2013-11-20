# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    is_private false
    is_completed false

    factory :private_goal do
      is_private true
    end

    factory :completed_goal do
      is_completed true
    end

    factory :completed_private_goal do
      is_completed true
      is_private true
    end
  end
end
