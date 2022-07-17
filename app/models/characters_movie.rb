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
class CharactersMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :character
end
