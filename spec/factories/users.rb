FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password(min_length: 10, max_length: 20) }
  end
end
