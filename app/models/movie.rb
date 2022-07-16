class Movie < ApplicationRecord
  belongs_to :genre
  has_many :characters_movies
  has_many :characters, through: :characters_movies
end
