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
class Movie < ApplicationRecord
  belongs_to :genre
  has_many :characters_movies
  has_many :characters, through: :characters_movies
end
