FactoryBot.define do
  factory :movie do
    title { "MyString" }
    creation_date { "2022-07-16" }
    rating { 1 }
    genre { nil }
  end
end
