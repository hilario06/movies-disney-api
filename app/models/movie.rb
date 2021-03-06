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
#  deleted_at    :datetime
#
class Movie < ApplicationRecord
  acts_as_paranoid  # de la gema paranoia (que cambia el estado del registro)
  has_one_attached :image
  belongs_to :genre
  has_many :characters_movies
  has_many :characters, through: :characters_movies

  validates :title, :creation_date, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
end
