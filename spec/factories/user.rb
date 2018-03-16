FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.zone.now
    sequence(:email) { |n| "user#{n}@example.com" }
    trait :with_comments do
      after :create do |user|
        create_list :comment, 2, user: user
      end
    end
  end
end
