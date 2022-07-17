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
    title { "MyString" }
    creation_date { "2022-07-16" }
    rating { 1 }
    genre { nil }
  end
end
