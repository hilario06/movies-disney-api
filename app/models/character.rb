class Character < ApplicationRecord
  has_many :characters_movies
  has_many :movies, through: :characters_movies
end
