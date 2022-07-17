# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  name       :string
#  age        :integer
#  weight     :float
#  story      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
class Character < ApplicationRecord
  acts_as_paranoid  # de la gema paranoia (que cambia el estado del registro)
  has_many :characters_movies
  has_many :movies, through: :characters_movies

  validates :name, :age, :weight, :story, presence: true
  validates :age, numericality: { only_integer: true }
  validates :weight, numericality: true
end
