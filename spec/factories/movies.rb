# == Schema Information
#
# Table name: movies
#
#  id            :bigint           not null, primary key
#  title         :string
#  creation_date :date
#  rating        :integer
#  genre_id      :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    creation_date { Faker::Date.between(from: '2000-01-01', to: '2021-12-31') }
    rating { rand(1..5) }
    genre
  end
end
