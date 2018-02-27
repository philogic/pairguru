FactoryBot.define do
  factory :user do
    name 'John Doe'
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
    sequence(:email) { |n| "user#{n}@example.com" }
  end
end
