# == Schema Information
#
# Table name: characters_movies
#
#  id           :bigint           not null, primary key
#  movie_id     :bigint           not null
#  character_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :characters_movie do
    movie
    character
  end
end
